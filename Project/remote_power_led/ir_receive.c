///////////////////////////////////////////////////////////////////////////////////////////
/*user code is 0xFF00*/
//#include "stm8s.h"
#include "Function.h"
#include "ir_receive.h"

typedef struct _IR_CODE
{
    u16 wData;          //<键值
    u8  bState;         //<接收状态
    u16 wUserCode;      //<用户码
    u8  boverflow;      //<红外信号超时
} IR_CODE;

IR_CODE  ir_code;       ///<红外遥控信息  

extern u8 IrKey_Value;
extern u8 flag_mode_current;





const u8 IRTabFF00[256] =
{
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0x0f
	0xff,0xff,0xff,0xff,0xff,KEY_IR_POWER,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0x1f
	0xff,0xff,0xff,0xff,0xff,KEY_IR_MODE,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0x2f
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0x3f
	0xff,0xff,0xff,0xff,0xff,KEY_IR_DOWM,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0x4f
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0x5f
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0x6f
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0x7f
	0xff,0xff,0xff,0xff,0xff,KEY_IR_UP,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0x8f
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0x9f
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0xaf
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0xbf
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0xcf
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0xdf
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0xef
	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff, //0xff
};           //NKEY_XX全部定义为0XFF,IR_XX定义为有效键值XX

//////////////////////////////////////////////////////////////////////////////////////////
void IrTask_Init(void)
{
	GPIO_Init(IrInPort, IrInPin, GPIO_MODE_IN_FL_IT);

	EXTI_DeInit();
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE,EXTI_SENSITIVITY_RISE_FALL);//下降沿触发中断
	//EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);//下降沿触发中断

	/* enable interrupts */
	//enableInterrupts();//必须在此才能打开中断，否则外部中断将设置不成功，造成反复进入中断
}

void Init_TIM2(void)
{
	TIM2_DeInit();
	/* Use fMASTER=16MHz , and the Prescaler=128 so every clock is 8uS :*/
	TIM2_TimeBaseInit(TIM2_PRESCALER_16, 65535);//1us一次
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
	TIM2_Cmd(ENABLE);
}
void Ir_TimeOut(void)    //IR计时溢出处理 1ms一次
{
    ir_code.boverflow++;
    if (ir_code.boverflow > 112) //112*1ms ~= 112ms
    {
        ir_code.bState = 0;
    }
}
 
/*
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)//中断
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
  /*
	Ir_Receive();
}
*/
/* //原型
void Ir_Receive(void)    //IR接收
{
	u16 bCap1;
	u8 cap = 0;

	bCap1 = TIM2_GetCounter();
	TIM2_SetCounter(0);
	cap = bCap1/timer1_pad;

	if (cap == 0)
	{
		ir_code.wData >>= 1;
		ir_code.bState++;
		ir_code.boverflow = 0;
	}
	else if (cap == 1)
	{
		ir_code.wData >>= 1;
		ir_code.bState++;
		ir_code.boverflow = 0;
	}
	else if (cap == 2)
	{
		ir_code.wData >>= 1;
		ir_code.bState++;
		ir_code.wData |= 0x8000;
		ir_code.boverflow = 0;
	}
	//13ms-Sync
	else if((cap == 13)&&(ir_code.boverflow < 16))
	{
		ir_code.bState = 0;
	}
	else if((cap < 8)&&(ir_code.boverflow < 10))
	{
		ir_code.bState = 0;
	}
	else if((cap >110)&&(ir_code.boverflow > 106))
	{
		ir_code.bState = 0;
	}
	else if((cap >20)&&(ir_code.boverflow > 106)) //溢出情况下 （12M 48M）
	{
		ir_code.bState = 0;
	}
	else
	{
		ir_code.boverflow = 0;
	}
	if (ir_code.bState == 16)
	{
		ir_code.wUserCode = ir_code.wData;
	}
	if (ir_code.bState == 32)
	{
			_asm("nop");
	}
} 
*/

/*
//遥控直连
void Ir_Receive(void)	 //IR接收
{
	u16 bCap1;
	u16 bCap2 = 0;
	u8 cap = 0;
	
	bCap1 = TIM2_GetCounter();
	TIM2_SetCounter(0);
	cap = bCap1/timer1_pad;
	if(IrDataIn == 0)
		return; //只检测高电平时间


	if ((bCap1 >= 10)&&(bCap1 <= 150)) 
	{
		ir_code.wData >>= 1;
		ir_code.bState++;
		ir_code.boverflow = 0;
	}
	else if ((bCap1 >= 1)&&(bCap1 <= 10))
	{
		ir_code.wData >>= 1;
		ir_code.bState++;
		ir_code.wData |= 0x8000;
		ir_code.boverflow = 0;
	}
	//13ms-Sync
	else if((cap >= 0x10)&&(cap < 0x30))
	{
		;
		ir_code.bState = 0;
		ir_code.boverflow = 0;
	}
	else
	{
		ir_code.boverflow = 0;
		ir_code.bState = 0;
	}
	
	if (ir_code.bState == 16)
	{
		ir_code.wUserCode = ir_code.wData;
	}
	if (ir_code.bState == 24)
	{
		//ir_code.bState = 0;
		nop();
		;
	}
} 
*/

/* //调试OK的中断处理方式
void Ir_Receive(void)	 //IR接收
{
	u16 bCap1;
	u16 bCap2 = 0;
	u8 cap = 0;
	
	bCap1 = TIM2_GetCounter();
	TIM2_SetCounter(0);
	cap = bCap1/timer1_pad;
	if((bCap1 >= 200))
	{
		ir_code.bState = 0;;
		ir_code.bState = 0;
	}
	if(IrDataIn == 0)
		return; //只检测低电平时间

	if ((bCap1 >=20)&&(bCap1 < 150)) 
	{
		ir_code.wData >>= 1;
		ir_code.bState++;
		ir_code.wData |= 0x8000;
		ir_code.boverflow = 0;
	}
	else if ((bCap1 >= 1)&&(bCap1 <20))
	{
		ir_code.wData >>= 1;
		ir_code.bState++;
		ir_code.boverflow = 0;
	}
	//13ms-Sync
	else if((bCap1 >= 0x700))
	{
		ir_code.bState = 0;;
		ir_code.bState = 0;
	}

	/*
	else
	{	
		ir_code.bState = 0;
		ir_code.boverflow = 0;
	}*/
	/*
	if (ir_code.bState == 16)
	{
		ir_code.wUserCode = ir_code.wData;
		if(ir_code.wUserCode != 0x9d00)
			ir_code.bState =0;
	}
	if (ir_code.bState ==24)
	{

	}

} 
*/

void Ir_Receive(void)	 //循环IR接收
{
	uint16_t cnt_ir_time = 0;
	static u8 flag_IrDataIn = 0;

	cnt_ir_time = TIM2_GetCounter();
	if(cnt_ir_time>= 200)
		ir_code.bState = 0;
	if((IrDataIn == flag_IrDataIn))//只检测低电平时间
	{
		return;
	}

	if(IrDataIn == 0)
	{	
		flag_IrDataIn = 0;
		TIM2_SetCounter(0);
		return;
	}
	else
	{	
		flag_IrDataIn = 1;
		TIM2_SetCounter(0);
	}



	
	if ((cnt_ir_time >= 50)&&(cnt_ir_time < 55)) 
	{
		ir_code.wData >>= 1;
		ir_code.bState++;
		ir_code.wData |= 0x8000;
		ir_code.boverflow = 0;

	}
	else if ((cnt_ir_time >=0)&&(cnt_ir_time < 50))
	{

		ir_code.wData >>= 1;
		ir_code.bState++;
		ir_code.boverflow = 0;
	}
	//13ms-Sync
//	else if((cnt_ir_time >= 50)&&(cnt_ir_time <= 60))
//	{
//		ir_code.bState = 0;;
//		ir_code.bState = 0;
//	}
	else
	{	
		ir_code.bState = 0;
		ir_code.boverflow = 0;
	}

	if (ir_code.bState == 16)
	{
		ir_code.wUserCode = ir_code.wData;
		if(ir_code.wUserCode != 0x9d00)
			ir_code.bState =0;
		else
			ir_code.wUserCode = ir_code.wData;
	}
	if (ir_code.bState == 24)
	{
		nop();
		nop();
	}

} 


u8 Get_IrKey_Value(void)    //取IR键值
{
    u8 tkey = NO_KEY;
		u16 tkey2 = NO_KEY;
    if (ir_code.bState != 24)
    {
        return tkey;
    }

   // if ((((u8*)&ir_code.wData)[0] ^ ((u8*)&ir_code.wData)[1]) == 0xff)
   // {
        if (ir_code.wUserCode == 0x9d00)//用户码为0X009d
        {
			tkey2 = ir_code.wData;
			tkey  = (u8)(tkey2 >>= 8);
       //     tkey =IRTabFF00[(u8)(tkey2 >>= 8)];
			 nop();
        }
    //}
    else
    {
        ir_code.bState = 0;
    }
    return tkey;
} 

void IrKey_Scan(void)    //IR按键识别
{
    static u8 last_key = NO_KEY;
    static u16 key_press_counter;
    static u8  key_press_flag = 0;
	static u16 nokey_press_counter = 0;
    u8 cur_key, key_status, back_last_key;
	
    cur_key = NO_KEY;
	IrKey_Value = NO_KEY;
    back_last_key = last_key;

    cur_key = Get_IrKey_Value();

	if(cur_key == NO_KEY)
	{
		nokey_press_counter++;
		if(nokey_press_counter == 1000)
		{
			nop();
			nokey_press_counter = 0;
		}
		else
		{
			nop();
			return;
		}
	}


    if (cur_key == last_key)                            //长时间按键
    {
        if ((cur_key == NO_KEY))
        {
            return;
        }
		nokey_press_counter = 0;

        key_press_counter++;

        if (key_press_counter == KEY_LONG_CNT)          //长按
        {
			key_status = KEY_LONG;
            IrKey_Value = back_last_key;
			if(IrKey_Value == KEY_IR_DOWM)
			{
				Display_Digital_Led(1);
				nop();
			}
			else if(IrKey_Value == KEY_IR_UP)
			{
				Display_Digital_Led(2);
				nop();
			}
			else if(IrKey_Value == KEY_IR_MODE)
			{
				Display_Digital_Led(3);
				nop();
			}
			else if(IrKey_Value == KEY_IR_POWER)
			{
				Display_Digital_Led(4);
				nop();
			}
        }
        else if (key_press_counter == (KEY_LONG_CNT + KEY_HOLD_CNT))        //连按
        {
            key_status = KEY_HOLD;
            IrKey_Value = back_last_key;
            key_press_counter = KEY_LONG_CNT;
			if(IrKey_Value == KEY_IR_DOWM)
			{
				Display_Digital_Led(9);
				nop();
			}
			else if(IrKey_Value == KEY_IR_UP)
			{
				Display_Digital_Led(9);
				nop();
			}
			else if(IrKey_Value == KEY_IR_MODE)
			{
				Display_Digital_Led(9);
				nop();
			}
			else if(IrKey_Value == KEY_IR_POWER)
			{
				Display_Digital_Led(9);
				nop();
			}
        }
        else
        {
            return;
        }
    }
    else  //cur_key = NO_KEY, 抬键
    {
		last_key = cur_key;
		nokey_press_counter = 0;

        if ((key_press_counter < KEY_LONG_CNT) && (cur_key != NO_KEY))
        {
        }
        if ((key_press_counter < KEY_LONG_CNT) && (cur_key == NO_KEY))      //短按抬起
        {
            key_press_counter = 0;
			
			if((key_status == KEY_LONG)||(key_status == KEY_HOLD))
			{
				key_status = KEY_SHORT_UP;
				return;
			}
            //key_status = KEY_SHORT_UP;
            IrKey_Value = back_last_key;
			if(IrKey_Value == KEY_IR_DOWM)
			{
				Display_Digital_Led(5);
				nop();
			}
			else if(IrKey_Value == KEY_IR_UP)
			{
				Display_Digital_Led(6);
				nop();
			}
			else if(IrKey_Value == KEY_IR_MODE)
			{
				Display_Digital_Led(7);
				nop();
			}
			else if(IrKey_Value == KEY_IR_POWER)
			{
				Display_Digital_Led(8);
				nop();
			}
        }
        else
        {
            key_press_counter = 0;
            return;
        }
    }
} 
