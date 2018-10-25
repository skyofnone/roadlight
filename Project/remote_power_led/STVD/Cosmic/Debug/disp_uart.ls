   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  62                     ; 12 void UART1_SendByte(uint8_t Data)
  62                     ; 13 {
  64                     .text:	section	.text,new
  65  0000               _UART1_SendByte:
  67  0000 88            	push	a
  68       00000000      OFST:	set	0
  71  0001               L13:
  72                     ; 14   while((UART1_GetFlagStatus(UART1_FLAG_TXE)==RESET));
  74  0001 ae0080        	ldw	x,#128
  75  0004 cd0000        	call	_UART1_GetFlagStatus
  77  0007 4d            	tnz	a
  78  0008 27f7          	jreq	L13
  79                     ; 15   UART1_SendData8(Data);
  81  000a 7b01          	ld	a,(OFST+1,sp)
  82  000c cd0000        	call	_UART1_SendData8
  85  000f               L73:
  86                     ; 16   while((UART1_GetFlagStatus(UART1_FLAG_TC)==RESET));
  88  000f ae0040        	ldw	x,#64
  89  0012 cd0000        	call	_UART1_GetFlagStatus
  91  0015 4d            	tnz	a
  92  0016 27f7          	jreq	L73
  93                     ; 17 }
  96  0018 84            	pop	a
  97  0019 81            	ret	
 142                     ; 27 void UART1_SendNByte(uint8_t *pData, uint16_t Length)
 142                     ; 28 {
 143                     .text:	section	.text,new
 144  0000               _UART1_SendNByte:
 146  0000 89            	pushw	x
 147       00000000      OFST:	set	0
 150  0001 200b          	jra	L76
 151  0003               L56:
 152                     ; 31     UART1_SendByte(*pData);
 154  0003 1e01          	ldw	x,(OFST+1,sp)
 155  0005 f6            	ld	a,(x)
 156  0006 cd0000        	call	_UART1_SendByte
 158                     ; 32     pData++;
 160  0009 1e01          	ldw	x,(OFST+1,sp)
 161  000b 5c            	incw	x
 162  000c 1f01          	ldw	(OFST+1,sp),x
 163  000e               L76:
 164                     ; 29   while(Length--)
 166  000e 1e05          	ldw	x,(OFST+5,sp)
 167  0010 5a            	decw	x
 168  0011 1f05          	ldw	(OFST+5,sp),x
 169  0013 5c            	incw	x
 170  0014 26ed          	jrne	L56
 171                     ; 34 }
 174  0016 85            	popw	x
 175  0017 81            	ret	
 211                     ; 44 void UART1_Printf(uint8_t *String)
 211                     ; 45 {
 212                     .text:	section	.text,new
 213  0000               _UART1_Printf:
 215  0000 89            	pushw	x
 216       00000000      OFST:	set	0
 219  0001 1e01          	ldw	x,(OFST+1,sp)
 220  0003 2008          	jra	L311
 221  0005               L111:
 222                     ; 48     UART1_SendByte(*String);
 224  0005 cd0000        	call	_UART1_SendByte
 226                     ; 49     String++;
 228  0008 1e01          	ldw	x,(OFST+1,sp)
 229  000a 5c            	incw	x
 230  000b 1f01          	ldw	(OFST+1,sp),x
 231  000d               L311:
 232                     ; 46   while((*String) != '\0')
 234  000d f6            	ld	a,(x)
 235  000e 26f5          	jrne	L111
 236                     ; 51 }
 239  0010 85            	popw	x
 240  0011 81            	ret	
 253                     	xdef	_UART1_Printf
 254                     	xdef	_UART1_SendNByte
 255                     	xdef	_UART1_SendByte
 256                     	xref	_UART1_GetFlagStatus
 257                     	xref	_UART1_SendData8
 276                     	end
