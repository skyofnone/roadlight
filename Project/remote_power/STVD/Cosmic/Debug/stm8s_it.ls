   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  50                     ; 54 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  50                     ; 55 {
  51                     .text:	section	.text,new
  52  0000               f_NonHandledInterrupt:
  56                     ; 59 }
  59  0000 80            	iret	
  81                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  81                     ; 68 {
  82                     .text:	section	.text,new
  83  0000               f_TRAP_IRQHandler:
  87                     ; 72 }
  90  0000 80            	iret	
 112                     ; 79 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 112                     ; 80 
 112                     ; 81 {
 113                     .text:	section	.text,new
 114  0000               f_TLI_IRQHandler:
 118                     ; 85 }
 121  0000 80            	iret	
 143                     ; 92 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 143                     ; 93 {
 144                     .text:	section	.text,new
 145  0000               f_AWU_IRQHandler:
 149                     ; 97 }
 152  0000 80            	iret	
 174                     ; 104 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 174                     ; 105 {
 175                     .text:	section	.text,new
 176  0000               f_CLK_IRQHandler:
 180                     ; 109 }
 183  0000 80            	iret	
 206                     ; 116 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 206                     ; 117 {
 207                     .text:	section	.text,new
 208  0000               f_EXTI_PORTA_IRQHandler:
 212                     ; 121 }
 215  0000 80            	iret	
 238                     ; 128 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 238                     ; 129 {
 239                     .text:	section	.text,new
 240  0000               f_EXTI_PORTB_IRQHandler:
 244                     ; 133 }
 247  0000 80            	iret	
 270                     ; 140 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 270                     ; 141 {
 271                     .text:	section	.text,new
 272  0000               f_EXTI_PORTC_IRQHandler:
 276                     ; 145 }
 279  0000 80            	iret	
 302                     ; 152 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 302                     ; 153 {
 303                     .text:	section	.text,new
 304  0000               f_EXTI_PORTD_IRQHandler:
 308                     ; 157 }
 311  0000 80            	iret	
 334                     ; 164 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 334                     ; 165 {
 335                     .text:	section	.text,new
 336  0000               f_EXTI_PORTE_IRQHandler:
 340                     ; 170 }
 343  0000 80            	iret	
 365                     ; 217 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 365                     ; 218 {
 366                     .text:	section	.text,new
 367  0000               f_SPI_IRQHandler:
 371                     ; 222 }
 374  0000 80            	iret	
 397                     ; 229 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 397                     ; 230 {
 398                     .text:	section	.text,new
 399  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 403                     ; 236 }
 406  0000 80            	iret	
 429                     ; 243 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 429                     ; 244 {
 430                     .text:	section	.text,new
 431  0000               f_TIM1_CAP_COM_IRQHandler:
 435                     ; 248 }
 438  0000 80            	iret	
 461                     ; 281  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 461                     ; 282  {
 462                     .text:	section	.text,new
 463  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 467                     ; 288  }
 470  0000 80            	iret	
 493                     ; 295  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 493                     ; 296  {
 494                     .text:	section	.text,new
 495  0000               f_TIM2_CAP_COM_IRQHandler:
 499                     ; 300  }
 502  0000 80            	iret	
 525                     ; 337  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 525                     ; 338  {
 526                     .text:	section	.text,new
 527  0000               f_UART1_TX_IRQHandler:
 531                     ; 342  }
 534  0000 80            	iret	
 557                     ; 349  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 557                     ; 350  {
 558                     .text:	section	.text,new
 559  0000               f_UART1_RX_IRQHandler:
 563                     ; 354  }
 566  0000 80            	iret	
 588                     ; 388 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 588                     ; 389 {
 589                     .text:	section	.text,new
 590  0000               f_I2C_IRQHandler:
 594                     ; 393 }
 597  0000 80            	iret	
 632                     ; 467  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 632                     ; 468  {
 633                     .text:	section	.text,new
 634  0000               f_ADC1_IRQHandler:
 636  0000 8a            	push	cc
 637  0001 84            	pop	a
 638  0002 a4bf          	and	a,#191
 639  0004 88            	push	a
 640  0005 86            	pop	cc
 641       00000002      OFST:	set	2
 642  0006 3b0002        	push	c_x+2
 643  0009 be00          	ldw	x,c_x
 644  000b 89            	pushw	x
 645  000c 3b0002        	push	c_y+2
 646  000f be00          	ldw	x,c_y
 647  0011 89            	pushw	x
 648  0012 89            	pushw	x
 651                     ; 469   	uint16_t Conversion_Value = 0;
 653                     ; 474     Conversion_Value = ADC1_GetConversionValue();
 655  0013 cd0000        	call	_ADC1_GetConversionValue
 657  0016 1f01          	ldw	(OFST-1,sp),x
 658                     ; 476     if (Conversion_Value == 0x0)
 661                     ; 478     ADC1_ClearITPendingBit(ADC1_IT_AWS9);   
 663  0018 ae0119        	ldw	x,#281
 664  001b cd0000        	call	_ADC1_ClearITPendingBit
 666                     ; 479  }
 669  001e 5b02          	addw	sp,#2
 670  0020 85            	popw	x
 671  0021 bf00          	ldw	c_y,x
 672  0023 320002        	pop	c_y+2
 673  0026 85            	popw	x
 674  0027 bf00          	ldw	c_x,x
 675  0029 320002        	pop	c_x+2
 676  002c 80            	iret	
 699                     ; 500  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 699                     ; 501  {
 700                     .text:	section	.text,new
 701  0000               f_TIM4_UPD_OVF_IRQHandler:
 705                     ; 505  }
 708  0000 80            	iret	
 731                     ; 513 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 731                     ; 514 {
 732                     .text:	section	.text,new
 733  0000               f_EEPROM_EEC_IRQHandler:
 737                     ; 518 }
 740  0000 80            	iret	
 752                     	xdef	f_EEPROM_EEC_IRQHandler
 753                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 754                     	xdef	f_ADC1_IRQHandler
 755                     	xdef	f_I2C_IRQHandler
 756                     	xdef	f_UART1_RX_IRQHandler
 757                     	xdef	f_UART1_TX_IRQHandler
 758                     	xdef	f_TIM2_CAP_COM_IRQHandler
 759                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 760                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 761                     	xdef	f_TIM1_CAP_COM_IRQHandler
 762                     	xdef	f_SPI_IRQHandler
 763                     	xdef	f_EXTI_PORTE_IRQHandler
 764                     	xdef	f_EXTI_PORTD_IRQHandler
 765                     	xdef	f_EXTI_PORTC_IRQHandler
 766                     	xdef	f_EXTI_PORTB_IRQHandler
 767                     	xdef	f_EXTI_PORTA_IRQHandler
 768                     	xdef	f_CLK_IRQHandler
 769                     	xdef	f_AWU_IRQHandler
 770                     	xdef	f_TLI_IRQHandler
 771                     	xdef	f_TRAP_IRQHandler
 772                     	xdef	f_NonHandledInterrupt
 773                     	xref	_ADC1_ClearITPendingBit
 774                     	xref	_ADC1_GetConversionValue
 775                     	xref.b	c_x
 776                     	xref.b	c_y
 795                     	end
