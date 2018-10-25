

#ifndef _RTC_H_
#define _RTC_H_
//#include "ht1380.h"
#include "stm8s.h"

//读数据长度
#define		Long_ReadData			(u8)3//7
//读取的数据转换成显示数据
#define		ClockSwitch_TSEC(x) ((x>>4)&0X07)*10 + (x&0x0f)	
#define		ClockSwitch_TMIN(x) ((x>>4)&0X07)*10 + (x&0x0f)	
#define		ClockSwitch_THOR(x) ((x>>4)&0x03)*10 + (x&0x0f)	

//显示数据转换成读取的数据 -- 设置时间时
#define		ClockSwitchB_TSEC(x) (((x/10)<<4) + (x%10))	
#define		ClockSwitchB_TMIN(x) (((x/10)<<4) + (x%10))		
#define		ClockSwitchB_THOR(x) (((x/10)<<4) + (x%10))		
/*
//----HT1381----DS1302
#define		P_SLK1380		PB2_OUT
#define		P_DAT1380Out	PB3_OUT
#define		P_DAT1380In		PB3_IN
#define		P_RST1380		PB4_OUT
*/
//====================================

void HT1380SetTime(uint8_t *pSecDa);
void HT1380ReadTime(uint8_t *ucCurtime);

void Init_TH1380(void);

void ClockSwitchMCU(uint8_t *ClockDat,uint8_t *McuDat );
void MCUSwitchClock(uint8_t *McuDat,uint8_t *ClockDat);



#endif

