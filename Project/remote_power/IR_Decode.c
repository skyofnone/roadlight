#include "IR_Decode.h"

unsigned char flag_IR_read_over = 0;  //20msÒç³ö±êÖ¾Î»
unsigned char IR_data[4] = {0};
u8 IrKey_Value = 0;
u8 key_status = 0;
u16 key_press_counter = 0;
u16 no_key_press_counter = 0;
extern bool flag_system_power;
extern u8  flag_mode_current;
extern u8 cnt_time_fen_current;	//æœ€å¤§15
extern u8 cnt_time_shi_current;	//æœ€å¤§15

extern u8 cnt_time_fen_set1;	//æœ€å¤§15
extern u8 cnt_time_shi_set1;	//æœ€å¤§15
extern u8 cnt_time_fen_set2;	//æœ€å¤§15
extern u8 cnt_time_shi_set2;	//æœ€å¤§15
extern u8 cnt_vol_current;	//æœ€å¤§15

void Init_TIM2(void)
{
	TIM2_DeInit();
	/* Use fMASTER=16MHz , and the Prescaler=128 so every clock is 8uS :*/
	TIM2_TimeBaseInit(TIM2_PRESCALER_16, 65535);//1usä¸€æ¬¡
	//TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	TIM2_Cmd(ENABLE);
}

////////////////////////////////////////////////////////////////////////
//¹¦ÄÜ£º//¼ÇÂ¼¸ßµçÆ½Âö³åµÄ¿í¶È
//Èë¿Ú²ÎÊý£º --
//³ö¿Ú²ÎÊý£º --
//·µ»ØÖµ£º   -- HW
////////////////////////////////////////////////////////////////////////
unsigned int HighPulseWidth(void)
{
  unsigned int HW = 0;
  unsigned char Loop = 1;
  if(IR_IN_Status()) //¼ì²âµ½¸ßµçÆ½
  {
    TIM2_SetCounter(1);
    TIM2_Cmd(ENABLE);
  }
  while(Loop) //µÈ´ý¸ßµçÆ½½áÊø
  {
    if(!IR_IN_Status() || flag_IR_read_over) Loop = 0; //¼ì²âµ½µÍµçÆ½»ò¶¨Ê±¼ÆÊýÒç³ö
  }
  flag_IR_read_over = 0;
  HW = TIM2_GetCounter();
  TIM2_Cmd(DISABLE);
  return HW;
}

////////////////////////////////////////////////////////////////////////
//¹¦ÄÜ£º//¼ÇÂ¼µÍµçÆ½Âö³åµÄ¿í¶È,×î´ó20MS
//Èë¿Ú²ÎÊý£º --
//³ö¿Ú²ÎÊý£º --
//·µ»ØÖµ£º   -- LW
////////////////////////////////////////////////////////////////////////
unsigned int LowPulseWidth(void)
{
unsigned int LW = 0;
unsigned char Loop = 1;
if(!IR_IN_Status()) //¼ì²âµ½µÍµçÆ½
{
TIM2_SetCounter(1);
TIM2_Cmd(ENABLE);
}
while(Loop) //µÈ´ýµÍµçÆ½½áÊø
{
if(IR_IN_Status() || flag_IR_read_over) Loop = 0; //¼ì²âµ½µÍµçÆ½»ò¶¨Ê±¼ÆÊýÒç³ö
}
flag_IR_read_over = 0;
LW = TIM2_GetCounter();
TIM2_Cmd(DISABLE);
return LW;
}



////////////////////////////////////////////////////////////////////////
//¹¦ÄÜ£º//¼ÇÂ¼µÍµçÆ½Âö³åµÄ¿í¶È,×î´ó20MS
//Èë¿Ú²ÎÊý£º --
//³ö¿Ú²ÎÊý£º --
//·µ»ØÖµ£º   -- LW
////////////////////////////////////////////////////////////////////////
unsigned char Receive_IR_Dat(void)
{
	unsigned int WL,HW,LW;
	unsigned char loop = 1;
	unsigned int bitcnt = 24;
	unsigned char error = 0;
	unsigned char value = 0;
	unsigned char i = 0,j = 0;

	WL = LowPulseWidth();
	//if(LW > 0.5*SYNC_L && LW < 1.5*SYNC_L) //¼ì²âµ½µÄÊÇÒýµ¼ÂëµÍµçÆ½²¿·Ö
	if(WL > 10000) //¼ì²âµ½µÄÊÇÒýµ¼ÂëµÍµçÆ½²¿·Ö
	{
		//HW = HighPulseWidth(); 
		//if(HW > 0.5*SYNC_H && HW < 1.5*SYNC_H) //¼ì²âµ½µÄÊÇÒýµ¼Âë¸ßµçÆ½²¿·Ö
		//{
		while(loop)
		{
			WL = HighPulseWidth();
			if((WL > CODE_1_H_MIN) && (WL < CODE_1_H_MAX))
			{
				WL = LowPulseWidth();
				if((WL > CODE_1_L_MIN) && (WL < CODE_1_L_MAX))      //Êý¾Ý 0
				{
					IR_data[i] &= ~(1<<(7 - j));
					++ j;
					if(j > 7) 
					{
						j = 0;
						++ i;
					}
					-- bitcnt; 
					if(!bitcnt)
					{
						value = 1;  
						loop = 0;	 
					}            
				}
				else error = 1;
			}
			else if((WL > CODE_0_H_MIN) && (WL < CODE_0_H_MAX))
			{	
				WL = LowPulseWidth();
				if((WL > CODE_0_L_MIN) && (WL < CODE_0_L_MAX))       //Êý¾Ý 1
				{
					IR_data[i] |= 1<<(7 - j);
					++ j;
					if(j > 7) 
					{
						j = 0;
						++ i;
					}
					-- bitcnt; 
					if(!bitcnt)
					{
						value = 1;  
						loop = 0;	 
					}            
				}
				else error = 1;
			}
			else //Ã»¼ì²âµ½Êý¾ÝµÍµçÆ½²¿·Ö
			{
				error = 1;
				loop = 0;
			}
		}
		//}
		//else error = 1; //Ã»¼ì²âµ½Òýµ¼Âë¸ßµçÆ½²¿·Ö
	}
	else 
		error = 1; //Ã»¼ì²âµ½Òýµ¼ÂëµÍµçÆ½²¿·Ö

	if(error)
	{
		IR_data[0] = 0;
		IR_data[1] = 0;
		IR_data[2] = 0;
		IR_data[3] = 0;
		value = 0;
	}
	else
	{
		nop();
	}
	return value;
}

void IrKey_Scan(void)    //IRæŒ‰é”®è¯†åˆ«
{
    static u8 last_key = NO_KEY;
    static u8  key_press_flag = 0;
    u8 cur_key, back_last_key;

	
    cur_key = NO_KEY;
	IrKey_Value = NO_KEY;
    back_last_key = last_key;

    cur_key = IR_data[2];
	IrKey_Value = cur_key;
    key_press_counter++;
	no_key_press_counter = 0;
    if (key_press_counter == KEY_LONG_CNT)          //é•¿æŒ‰
    {
		key_status = KEY_LONG;
		if(IrKey_Value == KEY_IR_MODE)
		{
			flag_system_power = TRUE;
		}
		else if(IrKey_Value == KEY_IR_POWER)
		{
			flag_system_power = FALSE;
		}
		/*
		else if(IrKey_Value == KEY_IR_DOWM)
		{
			//Display_Digital_Led(1);
			nop();
		}
		else if(IrKey_Value == KEY_IR_UP)
		{
			//Display_Digital_Led(2);
			nop();
		}
		*/
    }
    else if (key_press_counter == (KEY_LONG_CNT + KEY_HOLD_CNT))        //è¿žæŒ‰
    {
        key_status = KEY_HOLD;
        key_press_counter = KEY_LONG_CNT;
		if(IrKey_Value == KEY_IR_DOWM)
		{
			if(flag_mode_current == 0)
				cnt_vol_current--;
			else if(flag_mode_current == 1)
				cnt_time_shi_set1--;
			else if(flag_mode_current == 2)
				cnt_time_fen_set1--;
			else if(flag_mode_current == 3)
				cnt_time_shi_set2--;
			else if(flag_mode_current == 4)
				cnt_time_fen_set2--;
			else if(flag_mode_current == 5)
				cnt_time_shi_current--;
			else if(flag_mode_current == 6)
				cnt_time_fen_current--;
		}
		else if(IrKey_Value == KEY_IR_UP)
		{
			if(flag_mode_current == 0)
				cnt_vol_current ++;
			else if(flag_mode_current == 1)
				cnt_time_shi_set1++;
			else if(flag_mode_current == 2)
				cnt_time_fen_set1++;
			else if(flag_mode_current == 3)
				cnt_time_shi_set2++;
			else if(flag_mode_current == 4)
				cnt_time_fen_set2++;
			else if(flag_mode_current == 5)
				cnt_time_shi_current++;
			else if(flag_mode_current == 6)
				cnt_time_fen_current++;
			IrKey_Value = 0;
		}
		/*
		else if(IrKey_Value == KEY_IR_MODE)
		{
			nop();
		}
		else if(IrKey_Value == KEY_IR_POWER)
		{
			nop();
		}*/
		time_process();						
    }
    else if(key_press_counter < KEY_LONG_CNT)
    {
   		key_status = KEY_SHORT_UP;
        return;
    }

} 

void Irkey_release()
{
	no_key_press_counter++;
	if(no_key_press_counter == 500)
	{	
		no_key_press_counter = 0;
		key_press_counter = 0;
		if((key_status == KEY_LONG)||(key_status == KEY_HOLD))
		{
			IrKey_Value = NO_KEY;
			return;
		}
		switch(IrKey_Value)
		{
			case KEY_IR_DOWM:
				IrKey_Value = 0;
				if(flag_mode_current == 0)
					cnt_vol_current--;
				else if(flag_mode_current == 1)
					cnt_time_shi_set1--;
				else if(flag_mode_current == 2)
					cnt_time_fen_set1--;
				else if(flag_mode_current == 3)
					cnt_time_shi_set2--;
				else if(flag_mode_current == 4)
					cnt_time_fen_set2--;
				else if(flag_mode_current == 5)
					cnt_time_shi_current--;
				else if(flag_mode_current == 6)
					cnt_time_fen_current--;
				IrKey_Value =0;
				break;
			case KEY_IR_UP:
				if(flag_mode_current == 0)
					cnt_vol_current ++;
				else if(flag_mode_current == 1)
					cnt_time_shi_set1++;
				else if(flag_mode_current == 2)
					cnt_time_fen_set1++;
				else if(flag_mode_current == 3)
					cnt_time_shi_set2++;
				else if(flag_mode_current == 4)
					cnt_time_fen_set2++;
				else if(flag_mode_current == 5)
					cnt_time_shi_current++;
				else if(flag_mode_current == 6)
					cnt_time_fen_current++;
				IrKey_Value = 0;
				break;
			case KEY_IR_MODE:
				flag_mode_current++;
				if(flag_mode_current == 7)
					flag_mode_current = 0;
				IrKey_Value = 0;
				break;
			case KEY_IR_POWER:
				IrKey_Value = 0;
				break;
			default:
				IrKey_Value = 0;
				break;

			
		}
		time_process();
	}
	
}

void time_process()
{
	if(cnt_time_shi_set1 == 26)
		cnt_time_shi_set1 = 0;
	if(cnt_time_shi_set2 == 26)
		cnt_time_shi_set2 = 0;
	if(cnt_time_shi_current == 25)
		cnt_time_shi_current = 0;
	
	if(cnt_time_fen_set1 == 61)
		cnt_time_fen_set1 = 0;
	if(cnt_time_fen_set2 == 61)
		cnt_time_fen_set2 = 0;
	if(cnt_time_shi_current == 61)
		cnt_time_fen_current = 0;

	if(cnt_time_shi_set1 == 255)
		cnt_time_shi_set1 = 25;
	if(cnt_time_shi_set2 == 255)
		cnt_time_shi_set2 = 25;
	if(cnt_time_shi_current == 255)
		cnt_time_shi_current = 24;
	
	if(cnt_time_fen_set1 == 255)
		cnt_time_fen_set1 = 60;
	if(cnt_time_fen_set2 == 255)
		cnt_time_fen_set2 = 60;
	if(cnt_time_shi_current == 255)
		cnt_time_fen_current = 60;	

}
