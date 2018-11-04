/**
  ******************************************************************************
  * @file    Project/main.c 
  * @author  MCD Application Team
  * @version V2.3.0
  * @date    16-June-2017
  * @brief   Main program body
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */ 



/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "Function.h"
#include "Key.h"
#include "Rtc.h"
#include "stm8s_gpio.h"
#include "IR_Decode.h"
#include "stm8s_uart1.h"


#define PWM_GPIOC_PORT  (GPIOC)
#define PWM_GPIOC_PINS  (GPIO_PIN_4 | GPIO_PIN_3)
#define RTC_GPIOB_PORT  (GPIOB)
#define RTC_GPIOB_PINS  (GPIO_PIN_4 | GPIO_PIN_6)
#define IR_GPIOE_PORT   (GPIOE)
#define IR_GPIOE_PINS   (GPIO_PIN_5)

#define DATAOUT_GPIOB_PORT  (GPIOB)
#define DATAOUT_GPIOB_PIN  GPIO_PIN_0





#define CCR1_Val ((u16)2047)
#define CCR2_Val ((u16)1535)
#define CCR3_Val ((u16)1023)
#define CCR4_Val ((u16)511)


u16 Cnt_system_ms = 0;
u8 cnt_time_fen_current = 0;	
u8 cnt_time_shi_current = 0;	
u8 cnt_time_fen_set1 = 0;	
u8 cnt_time_shi_set1 = 0;	
u8 cnt_time_fen_set2 = 0;	
u8 cnt_time_shi_set2 = 0;	
u8 cnt_vol_current = 0;
uint16_t cnt_elex_current = 0; //当前的电流反馈

u8 *ucCurtime_set;
//* 输入: pSecDa: 初始时间地址。初始时间格式为: 秒 分 时 日 月 星期 年
//							    * 7Byte (BCD码) 0 1B 1B 1B 1B 1B 1B
uint8_t ucDeftime[7] = {01,01,01,01,01,01,18};  //20180101 0:0:0



u8  flag_mode_current     = 0;//0--电压 1--定时1时 2--定时1分 3--定时2时 4--定时2分 5--校时时 6--校时分

bool flag_system_power = FALSE;
bool flag_pwm_out = TRUE;
BitStatus flag_motor_feedback_port = 0;

void System_Process_10MS(void);
void Display_all_led(void);
void Display_Digital_Led(u16 cnt_receive);
void Delay (uint16_t nCount);
void System_Process_40uS(void);
void System_Process_10uS(void);
void GPIO_InitRemoterPower(void);


/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/****************************************************************************************
*  名    称：void TIMER1_Init(void)
*  功    能：stm8定时器初始化
*  入口参数：无
*  出口参数：无
*  说    明：通道1输出pwm波
*  范    例：无
****************************************************************************************/
void TIMER1_Init(void)
{
	TIM1->EGR=0x01;//初始化TIM1 TIM1时基初始化
	TIM1->EGR|=0x20;//重新初始化TIM1
	TIM1->PSCRH=0; //预分频 设置PWM频率
	TIM1->PSCRL=0;
	TIM1->ARRH=0x1F; //设定重装载值
	TIM1->ARRL=0xFF;
	TIM1->CR1&=0x8F;//边沿对齐,向上计数,带缓冲
	//TIM1->RCR=0x01;//重复计数器
	TIM1->CCMR4=0x68;//PWM模式1 通道2PWM输出
	TIM1->CCER2 &=0x1F;//高电平有效，开启输出
	TIM1->OISR |= 0x40;
	TIM1->CCER2 |=0x10;
	TIM1->CCR4H=0x08;//设置占空比
	TIM1->CCR4L=0xFF;

	TIM1->CR1|=0x01;//计数使能
	TIM1->BKR=0x80;//主使能


}

void GPIO_InitRemoterPower()
{
	GPIO_Init(PWM_GPIOC_PORT, (GPIO_Pin_TypeDef)PWM_GPIOC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(RTC_GPIOB_PORT, (GPIO_Pin_TypeDef)RTC_GPIOB_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
	GPIO_Init(IrInPort, (GPIO_Pin_TypeDef)IrInPin, GPIO_MODE_IN_PU_IT);
}

void IR_Int(void)
{
	EXTI->CR2 &= 0xFC; 
	EXTI->CR2 |= 0x3; 
}

void main(void)
{	
	uint8_t* ucCurtime;
	uint16_t temp = 0;
	CLK_DeInit();
	CLK_HSIPrescalerConfig(CLK_PRESCALER_CPUDIV16);//设置为内部高速时钟 //0x84 00 f_HSI =f_HSI   100 f_CPU =f_MASTER /16=1M
	GPIO_InitRemoterPower();
	ucCurtime = ucDeftime;
	HT1380SetTime(ucCurtime);
	Init_TIM2();
	IR_Int();	
	TIMER1_Init(); //PWM输出
	
	enableInterrupts();
	while(1);
#if 0
	UART1->CR1 = 0x00; //8bit
	UART1->CR3 = 0x00;//1 stop bit
	UART1->BRR2 = 0x01;
	UART1->BRR1 = 0x1A;//4800 baud rate
	UART1->CR2 = 0x24;//enable REN and RIEN
	while(1)
	{
		while(!(UART1->SR & 0x80));//发送寄存器数据是否转移完
		UART1->CR2=0x00;//a处
		UART1->DR=0x00;//要发送的数据
		UART1->CR2=0x08;//b处
		while((UART1->SR & 0x40) ==0);//发送是否完成
		Delay(30);
	}
	/* Infinite loop */
#endif
	while (1)
	{	
		Cnt_system_ms++;
		System_Process_10uS();
		System_Process_40uS();
		System_Process_10MS();			
		if(flag_system_power == TRUE)
		{
			Display_all_led();
		}
		else
		{
			SHOW_LED_BLACK;
		}
		/*
		temp = TIM2_GetCounter();
		if((temp >= 1000)&&(temp <= 2000))
			GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
		else
			GPIO_WriteLow(GPIOC,GPIO_PIN_3);
			*/
	}
  
}
void Delay (uint16_t nCount)
{
	uint16_t i;
	for(i= 0;i<nCount;i++)
	{
		nop();
		nop();
		nop();
	}
}

void System_Process_10MS()
{	
	static u16 t = 0;
	static u16 i = 0;
	u16 k = 0;
	static u16 Cnt_last10 = 0;
	uint8_t* ucCurtime;
		/*
	if(Cnt_last10 != Cnt_system_ms)
		Cnt_last10 = Cnt_system_ms;
	else
		return;
		*/
	ucCurtime = ucDeftime;
	if (Cnt_system_ms >= t)
	{	
		k = Cnt_system_ms -t;
	}
	else if(Cnt_system_ms < t)
	{
		k = Cnt_system_ms + (0xffff - t);
	}
	if (k > 1000)
	{
		k = 0;
		t = Cnt_system_ms;
		if((flag_mode_current == 5)||(flag_mode_current == 6))
		{
			ucCurtime[1] = cnt_time_fen_current;
			ucCurtime[2] = cnt_time_shi_current;
			HT1380SetTime(ucCurtime);
		}
		else
			HT1380ReadTime(ucCurtime);
		cnt_time_shi_current = ucCurtime[2];
		cnt_time_fen_current = ucCurtime[1];
		if((cnt_time_shi_current == cnt_time_shi_set1)&&(cnt_time_fen_current == cnt_time_fen_set1))
		{
			flag_pwm_out = TRUE;

		}
		if((cnt_time_shi_current == cnt_time_shi_set2)&&(cnt_time_fen_current == cnt_time_fen_set2))
		{
			flag_pwm_out = FALSE;

		}		
		if((flag_system_power == TRUE)&&(flag_pwm_out == TRUE))
		{
			//TIM1->CCR4H=1;//设置占空比
			//TIM1->CCR4L=cnt_vol_current;
		}
		else
		{
			//TIM1->CCR4H=0;//设置占空比
			//TIM1->CCR4L=0;
		}

	}

}

void System_Process_40uS()
{	
	static u16 t = 0;
	static u16 i = 0;
	u16 k = 0;
	static u16 Cnt_last10 = 0;
	uint8_t* ucCurtime;
	uint8_t volt1 = 0;
	uint8_t volt3 = 0;
/*
	if(Cnt_last10 != Cnt_system_ms)
		Cnt_last10 = Cnt_system_ms;
	else
		return;
*/
	if (Cnt_system_ms >= t)
	{	
		k = Cnt_system_ms -t;
	}
	else if(Cnt_system_ms < t)
	{
		k = Cnt_system_ms + (0xffff - t);
	}
	if (k >4)
	{
	
		k = 0;
		t = Cnt_system_ms;
			Init_ADC1();
		cnt_elex_current = Get_Ad1();
			Init_ADC3();
		volt3 = Get_Ad3();

	}

}

void System_Process_10uS()
{	
	static u16 t = 0;
	static u16 i = 0;
	u16 k = 0;
	static u16 Cnt_last10 = 0;
	uint8_t* ucCurtime;
	/*
	if(Cnt_last10 != Cnt_system_ms)
		Cnt_last10 = Cnt_system_ms;
	else
		return;
	*/
	if (Cnt_system_ms >= t)
	{	
		k = Cnt_system_ms -t;
	}
	else if(Cnt_system_ms < t)
	{
		k = Cnt_system_ms + (0xffff - t);
	}
	if (k >1)
	{
	
		k = 0;
		t = Cnt_system_ms;
		if(Receive_IR_Dat())
			IrKey_Scan();
		else
			Irkey_release();

	}

}



void Display_all_led()
{

	switch(flag_mode_current&0x0F)	  //0--电压 1--定时1时 2--定时1分 3--定时2时 4--定时2分 5--校时时 6--校时分
	{
		case 0x00:
			Display_Digital_Led(cnt_vol_current+1000);
			break;
		case 0x01:
			Display_Digital_Led(cnt_time_shi_set1+100);
			break;
		case 0x02:
			Display_Digital_Led(cnt_time_fen_set1+200);
			break;
		case 0x03:
			Display_Digital_Led(cnt_time_shi_set2+300);
			break;
		case 0x04:
			Display_Digital_Led(cnt_time_fen_set2+400);
			break;
		case 0x05:
			Display_Digital_Led(cnt_time_shi_current+500);
			break;
		case 0x06:
			Display_Digital_Led(cnt_time_fen_current+600);
			break;

		default:
			break;
	}
}
/*
void Display_Digital_Led(u16 cnt_receive)
{
	static u16 cnt_receive_rec = 0;
	static char cnt_bit = 0; 
	static BitStatus  flag_cal_point_end = 0;
	u8 temp = 0;
	if(cnt_receive_rec == 0)
	{
		cnt_receive_rec = cnt_receive;
		cnt_bit = 0;
	}
    temp = cnt_receive_rec % 10;   // 取出data的最低位
    cnt_receive_rec /= 10;  // 将去掉data的最低位，次低位变为最低位
    cnt_bit ++;
	if((cnt_bit == 3)&&(flag_mode_current == 0))
		cnt_receive_rec /= 10;  //过滤千位
	switch(cnt_bit)
	{
		case 1:
			SWITCH_TO_LED_GE;
			if(((cnt_time_shi_set1 == 25)&&(flag_mode_current == 1))||((cnt_time_shi_set2 == 25)&&(flag_mode_current == 3)))
			{
				SHOW_LED_N;
				return;
			}	
			break;
		case 2:
			SWITCH_TO_LED_SHI;
			if(((cnt_time_shi_set1 == 25)&&(flag_mode_current == 1))||((cnt_time_shi_set2 == 25)&&(flag_mode_current == 3)))
			{
				SHOW_LED_BLACK;
				return;
			}
			break;
		case 3:
			SWITCH_TO_LED_BAI;
			if((Cnt_system_ms%3000 <= 1500)&&(flag_mode_current != 0))
			{
				SHOW_LED_BLACK;
				return;
			}
			break;
		default:
			return;
	}
    switch(temp)
	{
		case 0:
			SHOW_LED_0;
			break;
		case 1:
			SHOW_LED_1;
			break;
		case 2:
			SHOW_LED_2;
			break;
		case 3:
			SHOW_LED_3;
			break;
		case 4:
			SHOW_LED_4;
			break;
		case 5:
			SHOW_LED_5;
			break;
		case 6:
			SHOW_LED_6;
			break;
		case 7:
			SHOW_LED_7;
			break;
		case 8:
			SHOW_LED_8;
			break;
		case 9:
			SHOW_LED_9;
			break;	
		default:
			break;
	}
	if((flag_mode_current == 0)&&(cnt_bit == 2))
		SHOW_LED_DIAN;

}
*/
void Display_Digital_Led(u16 cnt_receive)
{
	uint8_t temp=0;
	uint8_t i=0;
	DATA_OUT_1;
	Delay(200);
	DATA_OUT_0;
	for(i=0;i<16;i++)
	{
		temp = cnt_receive && 0x01;   
    	cnt_receive <<= 1;  // 
		if(temp == 0x01)
		{
			DATA_OUT_1;
			Delay(50);
			DATA_OUT_0;
			Delay(10);
		}
		else
		{
			DATA_OUT_1;
			Delay(10);
			DATA_OUT_0;
			Delay(50);
		}
	}
		
}




#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  //printf("Wrong parameters value: file %s on line %d\r\n", file, line)

}
#endif



/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
