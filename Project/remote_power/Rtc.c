#include "Function.h"
#include "Rtc.h"


#define		HT1380OSC_ENB		(u8)0X00 //振荡使能
#define		HT1380OSC_DIS		(u8)0X80
#define		MCLOCK24H       (u8)0x00 //24H制
#define		MCLOCK12H       (u8)0x80

//-----------------------------


//-----------------------------------------
void delay1380(void)
{
		u8 i = 0 ;
		
		for(i=10;i>0;i--)
		{
				_asm("nop");
				_asm("nop");
				_asm("nop");
				_asm("nop");
				_asm("nop");
				_asm("nop");
				_asm("nop");	
		}
}
/********************************************************************
*
* 名称: HT1380WriteByte
* 说明:
* 功能: 往HT1381写入1Byte数据
* 调用:
* 输入: ucDa 写入的数据
* 返回值: 无
***********************************************************************/
void HT1380WriteByte(u8 Dat)
{
		u8 i = 0 ;
		
		HT1380SLK_LOW ;
		for(i=0;i<8;i++)
		{
				if(Dat & 0x01)
				{
						HT1380DAT_HIGH ;
				}
				else 
				{
						HT1380DAT_LOW ;
				}
				Dat >>= 1 ;
				
				HT1380SLK_HIGH ;
				delay1380();
				HT1380SLK_LOW ;
				delay1380();	
								
		}
}
/********************************************************************
*
* 名称: u8 HT1380ReadByte
* 说明:
* 功能: 从HT1381读取1Byte数据
* 调用:
* 输入:
* 返回值: ACC
***********************************************************************/
u8 HT1380ReadByte(void)
{
		u8 i = 0 ;
		u8 Dat=0 ;
		
		HT1380DAT_HIGH ; //数据置高后再读  双向口
		delay1380();
		
		if(HT1380DatIn)
		{	
				Dat |= 0x80 ;	
		}	
		
		for(i=0;i<7;i++)
		{		
				HT1380SLK_HIGH ;
				delay1380();
				HT1380SLK_LOW ;
				delay1380();
				
				Dat >>= 1 ;					
				if(HT1380DatIn)
				{	
						Dat |= 0x80 ;	
				}
								
		}
		
		return Dat ;
}
/********************************************************************
*
* 名称: HT1380WriteByteAddr
* 说明: 先写地址,后写命令/数据
* 功能: 往HT1381写入数据
* 调用: HT1380WriteByte()
* 输入: ucAddr: HT1381地址, ucDa: 要写的数据
* 返回值: 无
***********************************************************************/
void HT1380WriteByteAddr(u8 ucAddr, u8 ucDa)
{
		HT1380RST_LOW;
		HT1380SLK_LOW;
		HT1380RST_HIGH;
		HT1380WriteByte(ucAddr); /* 地址,命令 */
		HT1380WriteByte(ucDa); /* 写1Byte数据*/
		HT1380SLK_HIGH;
		HT1380RST_LOW;
}
/********************************************************************
*
* 名称: HT1380ReadByteAddr
* 说明: 先写地址,后读命令/数据
* 功能: 读取HT1381某地址的数据
* 调用: HT1380WriteByte() , HT1380ReadByte()
* 输入: ucAddr: HT1381地址
* 返回值: ucDa :读取的数据
***********************************************************************/
u8 HT1380ReadByteAddr(u8 ucAddr)
{
    u8 ucDa;
    HT1380RST_LOW;
    HT1380SLK_LOW;
    HT1380RST_HIGH;
    HT1380WriteByte(ucAddr); /* 地址,命令 */
    ucDa = HT1380ReadByte(); /* 读1Byte数据 */
    HT1380SLK_HIGH;
    HT1380RST_LOW;
		
    return(ucDa);
}

/********************************************************************
*
* 名称: HT1380SetTime
* 说明:
* 功能: 设置初始时间
* 调用: HT1380WriteByteAddr()
* 输入: pSecDa: 初始时间地址。初始时间格式为: 秒 分 时 日 月 星期 年
* 7Byte (BCD码) 1B 1B 1B 1B 1B 1B 1B
* 返回值: 无
***********************************************************************/
void HT1380SetTime(uint8_t *pSecDa)
{
		u8 i;
		u8 ucAddr = 0x80;
		
		HT1380WriteByteAddr(0x8e,0x00); /* 控制命令,WP=0,写操作?*/
		for(i = Long_ReadData;i>0;i--)
		{
				HT1380WriteByteAddr(ucAddr,*pSecDa); /* 秒 分 时 日 月 星期 年 */
				
				pSecDa++;
				ucAddr += 2;
		}
		HT1380WriteByteAddr(0x8e,0x80); /* 控制命令,WP=1,写保护?*/
}
/********************************************************************
*
* 名称: HT1380ReadTime
* 说明:
* 功能: 读取HT1381当前时间
* 调用: HT1380ReadByteAddr()
* 输入: ucCurtime: 保存当前时间地址。当前时间格式为: 秒 分 时 日 月 星期 年
* 7Byte (BCD码) 1B 1B 1B 1B 1B 1B 1B
* 返回值: 无
***********************************************************************/
void HT1380ReadTime(uint8_t *ucCurtime)
{
    u8 i;
    u8 ucAddr = 0x81;
		
    for (i=0;i<Long_ReadData;i++)
    {
       *ucCurtime = HT1380ReadByteAddr(ucAddr);/*格式为: 秒 分 时 日 月 星期 年 */
       ucCurtime ++;
       ucAddr += 2;
    }
}
//*************************************
// 函数名称：CmdHT1380
// 函数功能：控制1380的数据读、写
// 入口参数：无
// 出口参数：无
// 返 回 值：无
//***************************************/
void Init_TH1380(void)
{
//		u8 SetTime[3] = {04,04,12} ;
		
//		HT1380SetTime(SetTime) ;
		
		HT1380WriteByteAddr(0x8e,0x00); /* 控制命令,WP=0,写操作?*/
		
		HT1380WriteByteAddr(0x80,HT1380OSC_ENB);//振荡允许
		HT1380WriteByteAddr(0x84,MCLOCK24H);//24小时制
		
		HT1380WriteByteAddr(0x8e,0x80); /* 控制命令,WP=1,写保护?*/
}
//*************************************
// 函数名称：ClockSwitchMCU
// 函数功能：把时钟芯片的数据转换成显示数据
// 入口参数：时钟芯片内所读的数据
// 出口参数：实际显示的时间数据
// 返 回 值：无
//***************************************/
void ClockSwitchMCU(uint8_t *ClockDat,uint8_t *McuDat)
{
		*McuDat = ClockSwitch_TSEC(*ClockDat) ;
		ClockDat ++ ; 
		McuDat ++ ;
		*McuDat = ClockSwitch_TMIN(*ClockDat) ;
		ClockDat ++ ; 
		McuDat ++ ;
		*McuDat = ClockSwitch_THOR(*ClockDat) ;	
		
}
//*************************************
// 函数名称：MCUSwitchClock
// 函数功能：把显示的数据转换成时钟芯片内的可存储数据
// 入口参数：显示的时间数据
// 出口参数：时钟芯片内所存储的数据格式
// 返 回 值：无
//***************************************/
void MCUSwitchClock(uint8_t *McuDat,uint8_t *ClockDat)
{
		*ClockDat = ClockSwitchB_TSEC(*McuDat) ;
		ClockDat ++ ; 
		McuDat ++ ;
		*ClockDat = ClockSwitchB_TMIN(*McuDat) ;
		ClockDat ++ ; 
		McuDat ++ ;
		*ClockDat = ClockSwitchB_THOR(*McuDat) ;	
		
}



