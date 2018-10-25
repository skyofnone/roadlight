#ifndef _Function
#define _Function

//PWM1    电压输出
//UART1   RTC通信

#define   BEEP_PORT           	GPIOD
#define   BEEP_PIN           	GPIO_PIN_4 //BEEP声
#define   VIN_PORT           	GPIOB
#define   VIN_PIN           	GPIO_PIN_0 //电压检测
#define   PB1_PORT           	GPIOB
#define   PB1_PIN           	GPIO_PIN_1 //电流保护
#define   PB2_PORT           	GPIOB
#define   PB2_PIN           	GPIO_PIN_2 //电流保护备用
#define   IrInPort				GPIOC//GPIOE
#define   IrInPin				GPIO_PIN_5 //GPIO_PIN_1////IR数据接收
#define   IrDataIn             	GPIOE->IDR &= (uint8_t)(0x20)//GPIOC->IDR &= (uint8_t)(0x01)// 
#define   DATAInPort				GPIOB//GPIOE
#define   DATAInPin				GPIO_PIN_0 //GPIO_PIN_1////IR数据接收
#define   DATADataIn             	GPIOB->IDR &= (uint8_t)(0x01)//GPIOC->IDR &= (uint8_t)(0x01)// 


#define		HT1380SLK_HIGH	   GPIOB->ODR |= (uint8_t)(0x10)
#define		HT1380SLK_LOW	   GPIOB->ODR &= (uint8_t)(~0x10)

#define		HT1380DAT_HIGH	   GPIOB->ODR |= (uint8_t)(0x20)
#define		HT1380DAT_LOW	   GPIOB->ODR &= (uint8_t)(~0x20)

#define		HT1380RST_HIGH	   GPIOB->ODR |= (uint8_t)(0x40)
#define		HT1380RST_LOW	   GPIOB->ODR &= (uint8_t)(~0x40)
//读数据端口
#define		HT1380DatIn		   GPIOB->IDR &= (uint8_t)(0x20)


#define LED_GE_1    	 		GPIOD->ODR |= (uint8_t)(0x20)	//PD5 LED 个位使能   高有效
#define LED_SHI_1   			GPIOA->ODR |= (uint8_t)(0x08)	//PA3 LED 十位使能   高有效
#define LED_BAI_1   			GPIOF->ODR |= (uint8_t)(0x10)	//PF4 LED 百位使能   高有效

#define LED_GE_0    	 		GPIOD->ODR &= (uint8_t)(~0x20)	//PD5 LED 个位使能高有效
#define LED_SHI_0   			GPIOA->ODR &= (uint8_t)(~0x08)	//PA3 LED 十位使能   高有效
#define LED_BAI_0   			GPIOF->ODR &= (uint8_t)(~0x10)	//PF4 LED 百位使能   高有效

#define SWITCH_TO_LED_GE 	LED_BAI_0;LED_SHI_0;LED_GE_1
#define SWITCH_TO_LED_SHI 	LED_BAI_0;LED_SHI_1;LED_GE_0
#define SWITCH_TO_LED_BAI 	LED_BAI_1;LED_SHI_0;LED_GE_0

#define DIG1_0   	 		GPIOD->ODR |= (uint8_t)(0x80)	//PD7
#define DIG2_0    			GPIOD->ODR |= (uint8_t)(0x04)	//PA3
#define DIG3_0    			GPIOC->ODR |= (uint8_t)(0x10)	//PF4

#define DIG1_1   	 		GPIOD->ODR &= (uint8_t)(~0x80)  //PD7
#define DIG2_1    			GPIOD->ODR &= (uint8_t)(~0x04)  //PA3
#define DIG3_1    			GPIOC->ODR &= (uint8_t)(~0x10)  //PF4

#define L_A_0   	 		GPIOD->ODR |= (uint8_t)(0x08)	//PD3
#define L_B_0    			GPIOD->ODR |= (uint8_t)(0x01)	//PD0
#define L_C_0    			GPIOC->ODR |= (uint8_t)(0x04)	//PC2
#define L_D_0     	 		GPIOC->ODR |= (uint8_t)(0x40)   //PC6
#define L_E_0    			GPIOC->ODR |= (uint8_t)(0x80)	//PC7
#define L_F_0    			GPIOD->ODR |= (uint8_t)(0x04)	//PD2
#define L_G_0    			GPIOC->ODR |= (uint8_t)(0x02)	//PC1
#define L_DP_0    			GPIOC->ODR |= (uint8_t)(0x20)	//PC5

#define L_A_1   	 		GPIOD->ODR &= (uint8_t)(~0x08)	//PD3
#define L_B_1    			GPIOD->ODR &= (uint8_t)(~0x01)	//PD0
#define L_C_1    			GPIOC->ODR &= (uint8_t)(~0x04)	//PC2
#define L_D_1     	 		GPIOC->ODR &= (uint8_t)(~0x40)  //PC6
#define L_E_1    			GPIOC->ODR &= (uint8_t)(~0x80)	//PC7
#define L_F_1    			GPIOD->ODR &= (uint8_t)(~0x04)	//PD2
#define L_G_1    			GPIOC->ODR &= (uint8_t)(~0x02)	//PC1
#define L_DP_1    			GPIOC->ODR &= (uint8_t)(~0x20)	//PC5

#define SHOW_LED_A 		L_A_0;L_B_1;L_C_1;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
#define SHOW_LED_B 		L_A_1;L_B_0;L_C_1;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
#define SHOW_LED_C 		L_A_1;L_B_1;L_C_0;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
#define SHOW_LED_D 		L_A_1;L_B_1;L_C_1;L_D_0;L_E_1;L_F_1;L_G_1;L_DP_1
#define SHOW_LED_EE 	L_A_1;L_B_1;L_C_1;L_D_1;L_E_0;L_F_1;L_G_1;L_DP_1
#define SHOW_LED_F 		L_A_1;L_B_1;L_C_1;L_D_1;L_E_1;L_F_0;L_G_1;L_DP_1
#define SHOW_LED_G 		L_A_1;L_B_1;L_C_1;L_D_1;L_E_1;L_F_1;L_G_0;L_DP_1
#define SHOW_LED_DP 	L_A_1;L_B_1;L_C_1;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_0

/////////////////----------A-----B-----C------D----E----F-----G----DP---高有效
#define SHOW_LED_0 		L_A_0;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_1;L_DP_1
#define SHOW_LED_1 		L_A_1;L_B_0;L_C_0;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
#define SHOW_LED_2 		L_A_0;L_B_0;L_C_1;L_D_0;L_E_0;L_F_1;L_G_0;L_DP_1
#define SHOW_LED_3 		L_A_0;L_B_0;L_C_0;L_D_0;L_E_1;L_F_1;L_G_0;L_DP_1
#define SHOW_LED_4 		L_A_1;L_B_0;L_C_0;L_D_1;L_E_1;L_F_0;L_G_0;L_DP_1
#define SHOW_LED_5 		L_A_0;L_B_1;L_C_0;L_D_0;L_E_1;L_F_0;L_G_0;L_DP_1
#define SHOW_LED_6 		L_A_0;L_B_1;L_C_0;L_D_0;L_E_0;L_F_0;L_G_0;L_DP_1
#define SHOW_LED_7		L_A_0;L_B_0;L_C_0;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
#define SHOW_LED_8 		L_A_0;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_0;L_DP_1
#define SHOW_LED_9 		L_A_0;L_B_0;L_C_0;L_D_0;L_E_1;L_F_0;L_G_0;L_DP_1
#define SHOW_LED_DIAN 											  L_DP_0
#define SHOW_LED_N 		L_A_0;L_B_0;L_C_0;L_D_1;L_E_0;L_F_0;L_G_1;L_DP_1 //n1
#define SHOW_LED_STEP2  L_A_0;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_0;L_DP_0 //全亮
#define SHOW_LED_STEP3  L_A_1;L_B_1;L_C_1;L_D_1;L_E_1;L_F_1;L_G_0;L_DP_0 //-.-.-.-.
#define SHOW_LED_P 		L_A_0;L_B_0;L_C_1;L_D_1;L_E_0;L_F_0;L_G_0;L_DP_1 //模式P1-P5
#define SHOW_LED_E 		L_A_0;L_B_1;L_C_1;L_D_0;L_E_0;L_F_0;L_G_0;L_DP_0 //E
#define SHOW_LED_R 		L_A_0;L_B_0;L_C_0;L_D_1;L_E_0;L_F_0;L_G_0;L_DP_0 //R
#define SHOW_LED_O 		L_A_0;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_1;L_DP_0 //O
#define SHOW_LED_U 		L_A_1;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_1;L_DP_0 //U
#define SHOW_LED_BLACK 	L_A_1;L_B_1;L_C_1;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1 //全黑


#define SWITCH_TO_595_GE 	SPI_SendData(0xC0)//LED_BAI_0;LED_SHI_0;LED_GE_1
#define SWITCH_TO_595_SHI 	SPI_SendData(0xA0)//LED_BAI_0;LED_SHI_1;LED_GE_0
#define SWITCH_TO_595_BAI 	SPI_SendData(0x60)//LED_BAI_1;LED_SHI_0;LED_GE_0

/////////////////----------A-----B-----C------D----E----F-----G----DP---高有效
#define SHOW_595_0 		SPI_SendData(0x03)//L_A_0;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_1;L_DP_1
#define SHOW_595_1 		SPI_SendData(0x9F)//L_A_1;L_B_0;L_C_0;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
#define SHOW_595_2 		SPI_SendData(0x25)//L_A_0;L_B_0;L_C_1;L_D_0;L_E_0;L_F_1;L_G_0;L_DP_1
#define SHOW_595_3 		SPI_SendData(0x0C)//L_A_0;L_B_0;L_C_0;L_D_0;L_E_1;L_F_1;L_G_0;L_DP_1
#define SHOW_595_4 		SPI_SendData(0x99)//L_A_1;L_B_0;L_C_0;L_D_1;L_E_1;L_F_0;L_G_0;L_DP_1
#define SHOW_595_5 		SPI_SendData(0x49)//L_A_0;L_B_1;L_C_0;L_D_0;L_E_1;L_F_0;L_G_0;L_DP_1
#define SHOW_595_6 		SPI_SendData(0x41)//L_A_0;L_B_1;L_C_0;L_D_0;L_E_0;L_F_0;L_G_0;L_DP_1
#define SHOW_595_7		SPI_SendData(0x1F)//L_A_0;L_B_0;L_C_0;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
#define SHOW_595_8 		SPI_SendData(0x01)//L_A_0;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_0;L_DP_1
#define SHOW_595_9 		SPI_SendData(0x09)//L_A_0;L_B_0;L_C_0;L_D_0;L_E_1;L_F_0;L_G_0;L_DP_1
#define SHOW_595_N 		SPI_SendData(0x19)//L_A_0;L_B_0;L_C_0;L_D_1;L_E_0;L_F_0;L_G_1;L_DP_1 //n1
#define SHOW_595_BLACK 	SPI_SendData(0xFF)//L_A_1;L_B_1;L_C_1;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1 //全黑


#else
#endif

