#include "stm8s.h"
#include "led.h"
#include "stm8s_gpio.h"

void led_gpio_init(void)
{
    GPIO_Init(LED_GPIOC_PORT, (GPIO_Pin_TypeDef)LED_GPIOC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LED_GPIOD_PORT, (GPIO_Pin_TypeDef)LED_GPIOD_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LED_GPIOA_PORT, (GPIO_Pin_TypeDef)LED_GPIOA_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LED_GPIOF_PORT, (GPIO_Pin_TypeDef)LED_GPIOF_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
}
void dig_ctl_1(uint8_t on)
{
	if(on)
		GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_7); 
	else
		GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_7); 
}

void dig_ctl_2(uint8_t on)
{
	if(on)
		GPIO_WriteHigh(LED_GPIOA_PORT, GPIO_PIN_3); 
	else
		GPIO_WriteLow(LED_GPIOA_PORT, GPIO_PIN_3); 
}

void dig_ctl_3(uint8_t on)
{
	if(on)
		GPIO_WriteHigh(LED_GPIOF_PORT, GPIO_PIN_4); 
	else
		GPIO_WriteLow(LED_GPIOF_PORT, GPIO_PIN_4); 
}

void show_0(void)
{//L_A_0;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_1;L_DP_1
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
}
void show_1(void)
{//L_A_1;L_B_0;L_C_0;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
}
void show_2(void)
{//L_A_0;L_B_0;L_C_1;L_D_0;L_E_0;L_F_1;L_G_0;L_DP_1
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
}
void show_3(void)
{//L_A_0;L_B_0;L_C_0;L_D_0;L_E_1;L_F_1;L_G_0;L_DP_1
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);   //E   PC7
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);   //DOT PC5
}

void show_4(void)
{//L_A_1;L_B_0;L_C_0;L_D_1;L_E_1;L_F_0;L_G_0;L_DP_1
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
}

void show_5(void)
{//L_A_0;L_B_1;L_C_0;L_D_0;L_E_1;L_F_0;L_G_0;L_DP_1
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
}

void show_6(void)
{//L_A_0;L_B_1;L_C_0;L_D_0;L_E_0;L_F_0;L_G_0;L_DP_1
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
}

void show_7(void)
{//L_A_0;L_B_0;L_C_0;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
}

void show_8(void)
{//L_A_0;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_0;L_DP_1
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
}

void show_9(void)
{//L_A_0;L_B_0;L_C_0;L_D_0;L_E_1;L_F_0;L_G_0;L_DP_1
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
}

void show_dot(uint8_t on)
{//
	if(on)
		GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
	else
		GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
}

void show_black(void)
{//L_A_0;L_B_0;L_C_0;L_D_0;L_E_1;L_F_0;L_G_0;L_DP_1
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_1);   //G   PC1
	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);   //DOT PC5
}

void show_led(uint8_t num)
{		
	switch (num){
		case 0:
			show_0();
			break;
		case 1:
			show_1();
			break;
		case 2:
			show_2();
			break;
		case 3:
			show_3();
			break;
		case 4:
			show_4();
			break;
		case 5:
			show_5();
			break;
		case 6:
			show_6();
			break;
		case 7:
			show_7();
			break;
		case 8:
			show_8();
			break;
		case 9:
			show_9();
			break;
		case 10:
			show_dot(1);
			break;
		case 11:
			show_dot(0);
			break;
		case 12:
			show_black();
			break;
	}
}

