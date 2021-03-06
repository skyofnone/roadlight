#ifndef __IR_DECODE_H
#define __IR_DECODE_H

#include "stm8s.h"
//#include "io_init.h"

#define SYNC_L    15000 //7500//9000          //引导码低电平宽度  
#define SYNC_H    4500          //引导码高电平宽度
#define CODE_L    600           //数据码低电平宽

#define CODE_0_H_MAX  2000//1600 //450           //数据码0 高电平宽度度
#define CODE_0_H_MIN  1000//1400

#define CODE_0_L_MAX 600//400//  358 //  600           //数据码低电平宽度
#define CODE_0_L_MIN 50//200

#define CODE_1_H_MAX 600//400// 358 //1600          //数据码1 高电平宽度
#define CODE_1_H_MIN 50//200
#define CODE_1_L_MAX 2000//1600 // 600           //数据码低电平宽度
#define CODE_1_L_MIN 1000//1400

#define IR_ADD 0x01
#define IR_SUB 0x02
#define IR_MOD 0x03
#define IR_OFF 0x04
#define IR_ON  0x05

/*鎸夐敭闂ㄦ鍊�*/
#define KEY_BASE_CNT  4
#define KEY_LONG_CNT  10
#define KEY_HOLD_CNT  3
#define KEY_SHORT_CNT 7

/*鎸夐敭鐘舵��*/
#define KEY_SHORT_UP    0x0
#define KEY_LONG        0x1
#define KEY_HOLD        0x2
#define KEY_LONG_UP     0x3

#define KEY_IR_UP   0xa8
#define KEY_IR_DOWM 0xa4
#define KEY_IR_MODE 0xa2  //闀挎寜寮�鏈�
#define KEY_IR_POWER 0xa1 //闀挎寜鍏虫満


#define NO_KEY          0x00
#define IR_IN_Status()  GPIO_ReadInputPin(GPIOB, GPIO_PIN_0)  //接收数据IO
//#define IR_IN_Status()  GPIO_ReadInputPin(GPIOC, GPIO_PIN_1) 

extern uint8_t flag_IR_read_over;
extern uint8_t IR_data[4];

uint32_t HighPulseWidth(void);
uint32_t LowPulseWidth(void);
uint8_t Receive_IR_Dat(void);
void Init_TIM2(void);
void IrKey_Scan(void);    
void Irkey_release(void);
void time_process(void);
extern void Display_Digital_Led(u16 cnt_receive);

#endif