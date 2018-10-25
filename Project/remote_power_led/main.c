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
#include "led.h"
#include "disp_uart.h"

#define PWM_GPIOC_PORT  (GPIOC)
#define PWM_GPIOC_PINS  (GPIO_PIN_4 | GPIO_PIN_3)
#define RTC_GPIOB_PORT  (GPIOB)
#define RTC_GPIOB_PINS  (GPIO_PIN_4 | GPIO_PIN_6)

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

u8 DISP_BUF[3]={0,1,2};			   //显示缓冲区
u8  DISP_TAB[]=									  //显示码表
{
		 0x14,0xD7,0x4C,0x45,0x87,0x25,0x24,0x57,0x04,0x05,0x06,0xA4,0x3C
};


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
void spi_gpio_init(void);
void spi_init(void);
void DISP595_Display(u16 cnt_receive);
void receive_data(void);



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
	TIM1->ARRH=0x02; //设定重装载值
	TIM1->ARRL=0x9F;
	TIM1->CR1=0x80;//边沿对齐,向上计数,带缓冲
	TIM1->RCR=0x01;//重复计数器
	TIM1->CCMR4=0x68;//PWM模式1 通道2PWM输出
	TIM1->CCER2=0x10;//高电平有效，开启输出
	TIM1->CCR4H=0;//设置占空比
	TIM1->CCR4L=0X03;
	//TIM1_ITConfig(TIM2_IT_UPDATE, ENABLE);
	TIM1->BKR=0x80;//主使能
	TIM1->CR1|=0x01;//计数使能


}
void GPIO_InitRemoterPower()
{
	GPIO_Init(LED_GPIOA_PORT, (GPIO_Pin_TypeDef)LED_GPIOA_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LED_GPIOC_PORT, (GPIO_Pin_TypeDef)LED_GPIOC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LED_GPIOD_PORT, (GPIO_Pin_TypeDef)LED_GPIOD_PINS, GPIO_MODE_OUT_PP_LOW_FAST); //LED 初始化
	GPIO_Init(LED_GPIOF_PORT, (GPIO_Pin_TypeDef)LED_GPIOF_PINS, GPIO_MODE_OUT_PP_LOW_FAST); //LED 初始化
	GPIO_Init(RTC_GPIOB_PORT, (GPIO_Pin_TypeDef)RTC_GPIOB_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
	GPIO_Init(IrInPort, IrInPin, GPIO_MODE_IN_PU_NO_IT);
}

 //相关的IO口设为上拉输出
void spi_gpio_init(void)
 {
	 GPIO_DeInit(GPIOC);
	 GPIO_Init(GPIOC,GPIO_PIN_5|GPIO_PIN_6,GPIO_MODE_OUT_PP_LOW_FAST);
	 GPIO_DeInit(GPIOE);
	 GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST);
 }

 //SPI初始化
void spi_init(void)
{
	 SPI_DeInit();
	 CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);

	 SPI_Init(SPI_FIRSTBIT_LSB, SPI_BAUDRATEPRESCALER_256, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_1LINE_TX, SPI_NSS_SOFT, 0x07);
	 SPI_Cmd(ENABLE);
 }

void DISP595_Display(u16 cnt_receive)
{
	static u16 cnt_receive_rec = 0;
	static char cnt_bit = 0; 
	static BitStatus  flag_cal_point_end = 0;
	u8 temp = 0;
	GPIO_WriteLow(GPIOE,GPIO_PIN_5);
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
			SWITCH_TO_595_GE;
			if(((cnt_time_shi_set1 == 25)&&(flag_mode_current == 1))||((cnt_time_shi_set2 == 25)&&(flag_mode_current == 3)))
			{
				SHOW_595_N;
				return;
			}	
			break;
		case 2:
			SWITCH_TO_595_SHI;
			if(((cnt_time_shi_set1 == 25)&&(flag_mode_current == 1))||((cnt_time_shi_set2 == 25)&&(flag_mode_current == 3)))
			{
				SHOW_595_BLACK;
				return;
			}
			break;
		case 3:
			SWITCH_TO_595_BAI;
			if((Cnt_system_ms%3000 <= 1500)&&(flag_mode_current != 0))
			{
				SHOW_595_BLACK;
				return;
			}
			break;
		default:
			return;
	}
    switch(temp)
	{
		case 0:
			SHOW_595_0;
			break;
		case 1:
			SHOW_595_1;
			break;
		case 2:
			SHOW_595_2;
			break;
		case 3:
			SHOW_595_3;
			break;
		case 4:
			SHOW_595_4;
			break;
		case 5:
			SHOW_595_5;
			break;
		case 6:
			SHOW_595_6;
			break;
		case 7:
			SHOW_595_7;
			break;
		case 8:
			SHOW_595_8;
			break;
		case 9:
			SHOW_595_9;
			break;	
		default:
			break;
	}
//	if((flag_mode_current == 0)&&(cnt_bit == 2))
//		SHOW_595_DIAN;

	GPIO_WriteHigh(GPIOE,GPIO_PIN_5);


}
void receive_data()
{
		uint8_t temp =0;
		uint8_t i =0;
		if(DATADataIn)
				Delay(190);
		if(DATADataIn == 1)
		{
				temp = 0;
				for(i=0;i<24;i++)
				{
						Delay(30);
						if(DATADataIn == 1)
							temp |= 1;
						else
							temp &= 0xfe;
						temp <<= 1;
						Delay(30);
				}
				Display_Digital_Led(temp);
		}
		
}

/************************************************
函数名称 ： ADC_Initializes
功    能 ： ADC初始化
参    数 ： 无
返 回 值 ： 无
作    者 ： strongerHuang
*************************************************/
void ADC_Initializes(void)
{
    ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, \
            ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,\
            DISABLE);

    ADC1_Cmd(ENABLE);                              //使能ADC
}

/************************************************
函数名称 ： ADC_Read
功    能 ： 电池检测
参    数 ： 无
返 回 值 ： 电压(放大1000倍)
作    者 ： strongerHuang
*************************************************/
uint32_t ADC_Read(void)
{
  uint8_t  i;
  uint16_t adc_value = 0;
  uint32_t adc_voltage = 0;

  for(i=0; i<4; i++)
  {
    while(RESET == ADC1_GetFlagStatus(ADC1_FLAG_EOC));
    ADC1_ClearFlag(ADC1_FLAG_EOC);               //等待转换完成，并清除标志

    adc_value += ADC1_GetConversionValue();      //读取转换结果
  }

  adc_voltage = adc_value >> 2;                  //求平均
  adc_voltage = (adc_voltage*3300) >> 10;        //1000倍电压值

  return adc_voltage;
}

void main(void)
{	
	uint8_t* ucCurtime;
	uint16_t temp = 0;
	uint8_t RxBuffer = 0;
	
	CLK_HSIPrescalerConfig(CLK_PRESCALER_CPUDIV16);//设置为内部高速时�?
	
	led_gpio_init();
	ucCurtime = ucDeftime;
	HT1380SetTime(ucCurtime);
	Init_TIM2();
	TIMER1_Init(); //PWM输出	
	enableInterrupts();
	UART1_Init((uint32_t)4800, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
				UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
	UART1_Cmd(ENABLE);

	
	while(1)
	{
		temp = Receive_IR_Dat();		
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
		Get_Ad3();

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
			/*

	switch(flag_mode_current&0x0F)	  //0--电压 1--定时1时 2--定时1分 3--定时2时 4--定时2分 5--校时时 6--校时分
	{
		case 0x00:
			DISP595_Display(cnt_vol_current+1000);
			break;
		case 0x01:
			DISP595_Display(cnt_time_shi_set1+100);
			break;
		case 0x02:
			DISP595_Display(cnt_time_fen_set1+200);
			break;
		case 0x03:
			DISP595_Display(cnt_time_shi_set2+300);
			break;
		case 0x04:
			DISP595_Display(cnt_time_fen_set2+400);
			break;
		case 0x05:
			DISP595_Display(cnt_time_shi_current+500);
			break;
		case 0x06:
			DISP595_Display(cnt_time_fen_current+600);
			break;

		default:
			break;
	}
		*/
}
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
