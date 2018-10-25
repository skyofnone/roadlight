#ifndef __IR_RECEIVE_H
#define __IR_RECEIVE_H

#include "stm8s.h"
#define IR_ADD 0x01
#define IR_SUB 0x02
#define IR_MOD 0x03
#define IR_OFF 0x04
#define IR_ON  0x05

/*按键门槛值*/
#define KEY_BASE_CNT  4
#define KEY_LONG_CNT  120
#define KEY_HOLD_CNT  20
#define KEY_SHORT_CNT 7

/*按键状态*/
#define KEY_SHORT_UP    0x0
#define KEY_LONG        0x1
#define KEY_HOLD        0x2
#define KEY_LONG_UP     0x3

#define NO_KEY          0xff
//#define timer1_pad      125    //8us*125=1ms 
#define timer1_pad      60



void IrTask_Init(void);
void Init_TIM2(void);
void Ir_TimeOut(void);    //IR计时溢出处理 1ms一次
void Ir_Receive(void);    //IR接收
void Ir_Receive(void);	 //IR接收
u8 Get_IrKey_Value(void);    //取IR键值
void IrKey_Scan(void);    //IR按键识别
extern void Delay (uint16_t nCount);
extern void Display_Digital_Led(u16 cnt_receive);

#endif

