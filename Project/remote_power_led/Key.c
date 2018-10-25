#include "Function.h"
#include "key.h"

uint16_t value1=0;
uint16_t value3=0;


void Init_ADC1(void)
{
  	GPIO_Init(GPIOB, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);      //引脚初始化  初始化ADC通道引脚
	ADC1_DeInit();
        ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,      //单次转换
                  ADC1_CHANNEL_1,                  //通道
                  ADC1_PRESSEL_FCPU_D2,            //预定标器选择 分频器  fMASTER 可以被分频 2 到 18
                  ADC1_EXTTRIG_TIM,                //从内部的TIM1 TRGO事件转换
                  DISABLE,                         //是否使能该触发方式
                  ADC1_ALIGN_RIGHT,                //对齐方式（可以左右对齐）
                  ADC1_SCHMITTTRIG_CHANNEL1,       //指定触发通道
                  ENABLE);                         //是否使能指定触发通道
        ADC1_Cmd(ENABLE);                          //使能ADC
}

uint16_t Get_Ad1(void)
{

  ADC1_StartConversion();                      //启动AD转换
  while(RESET == ADC1_GetFlagStatus(ADC1_FLAG_EOC));   //等待转换完成
  ADC1_ClearFlag(ADC1_FLAG_EOC);               //清除标志
  value1 = ADC1_GetConversionValue();            //读取AD值 
  return value1;
}

void Init_ADC3(void)
{
  	GPIO_Init(GPIOB, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);      //引脚初始化  初始化ADC通道引脚
	ADC1_DeInit();
        ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,      //单次转换
                  ADC1_CHANNEL_3,                  //通道
                  ADC1_PRESSEL_FCPU_D2,            //预定标器选择 分频器  fMASTER 可以被分频 2 到 18
                  ADC1_EXTTRIG_TIM,                //从内部的TIM1 TRGO事件转换
                  DISABLE,                         //是否使能该触发方式
                  ADC1_ALIGN_RIGHT,                //对齐方式（可以左右对齐）
                  ADC1_SCHMITTTRIG_CHANNEL3,       //指定触发通道
                  ENABLE);                         //是否使能指定触发通道
        ADC1_Cmd(ENABLE);                          //使能ADC
}

uint16_t Get_Ad3(void)
{

  ADC1_StartConversion();                      //启动AD转换
  while(RESET == ADC1_GetFlagStatus(ADC1_FLAG_EOC));   //等待转换完成
  ADC1_ClearFlag(ADC1_FLAG_EOC);               //清除标志
  value3 = ADC1_GetConversionValue();            //读取AD值 
  return value3;
}


