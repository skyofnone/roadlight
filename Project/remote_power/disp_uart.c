#include "stm8s.h"
#include "disp_uart.h"
#include "stm8s_gpio.h"

/************************************************
函数名称 ： UART1_SendByte
功    能 ： UART1发送一个字符
参    数 ： Data --- 数据
返 回 值 ： 无
作    者 ： strongerHuang
*************************************************/
void UART1_SendByte(uint8_t Data)
{
  while((UART1_GetFlagStatus(UART1_FLAG_TXE)==RESET));
  UART1_SendData8(Data);
  while((UART1_GetFlagStatus(UART1_FLAG_TC)==RESET));
}

/************************************************
函数名称 ： UART1_SendNByte
功    能 ： 串口1发送N个字符
参    数 ： pData ---- 字符串
            Length --- 长度
返 回 值 ： 无
作    者 ： strongerHuang
*************************************************/
void UART1_SendNByte(uint8_t *pData, uint16_t Length)
{
  while(Length--)
  {
    UART1_SendByte(*pData);
    pData++;
  }
}

/************************************************
函数名称 ： UART1_Printf
功    能 ： 串口1打印输出
参    数 ： String --- 字符串
返 回 值 ： 无
作    者 ： strongerHuang
*************************************************/

void UART1_Printf(uint8_t *String)
{
  while((*String) != '\0')
  {
    UART1_SendByte(*String);
    String++;
  }
}
