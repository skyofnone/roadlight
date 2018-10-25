   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  21                     	bsct
  22  0000               _flag_IR_read_over:
  23  0000 00            	dc.b	0
  24  0001               _IR_data:
  25  0001 00            	dc.b	0
  26  0002 000000        	ds.b	3
  27  0005               _IrKey_Value:
  28  0005 00            	dc.b	0
  29  0006               _key_status:
  30  0006 00            	dc.b	0
  31  0007               _key_press_counter:
  32  0007 0000          	dc.w	0
  33  0009               _no_key_press_counter:
  34  0009 0000          	dc.w	0
  66                     ; 20 void Init_TIM2(void)
  66                     ; 21 {
  68                     .text:	section	.text,new
  69  0000               _Init_TIM2:
  73                     ; 22 	TIM2_DeInit();
  75  0000 cd0000        	call	_TIM2_DeInit
  77                     ; 24 	TIM2_TimeBaseInit(TIM2_PRESCALER_16, 65535);//1usä¸€æ¬¡
  79  0003 aeffff        	ldw	x,#65535
  80  0006 89            	pushw	x
  81  0007 a604          	ld	a,#4
  82  0009 cd0000        	call	_TIM2_TimeBaseInit
  84  000c a601          	ld	a,#1
  85  000e 85            	popw	x
  86                     ; 26 	TIM2_Cmd(ENABLE);
  89                     ; 27 }
  92  000f cc0000        	jp	_TIM2_Cmd
 140                     ; 35 unsigned int HighPulseWidth(void)
 140                     ; 36 {
 141                     .text:	section	.text,new
 142  0000               _HighPulseWidth:
 144  0000 5203          	subw	sp,#3
 145       00000003      OFST:	set	3
 148                     ; 37   unsigned int HW = 0;
 150                     ; 38   unsigned char Loop = 1;
 152  0002 a601          	ld	a,#1
 153  0004 6b03          	ld	(OFST+0,sp),a
 154                     ; 39   if(IR_IN_Status()) //¼ì²âµ½¸ßµçÆ½
 156  0006 ad2d          	call	LC001
 157  0008 2717          	jreq	L74
 158                     ; 41     TIM2_SetCounter(1);
 160  000a ae0001        	ldw	x,#1
 161  000d cd0000        	call	_TIM2_SetCounter
 163                     ; 42     TIM2_Cmd(ENABLE);
 165  0010 a601          	ld	a,#1
 166  0012 cd0000        	call	_TIM2_Cmd
 168  0015 200a          	jra	L74
 169  0017               L54:
 170                     ; 46     if(!IR_IN_Status() || flag_IR_read_over) Loop = 0; //¼ì²âµ½µÍµçÆ½»ò¶¨Ê±¼ÆÊýÒç³ö
 172  0017 ad1c          	call	LC001
 173  0019 2704          	jreq	L55
 175  001b b600          	ld	a,_flag_IR_read_over
 176  001d 2702          	jreq	L74
 177  001f               L55:
 180  001f 0f03          	clr	(OFST+0,sp)
 181  0021               L74:
 182                     ; 44   while(Loop) //µÈ´ý¸ßµçÆ½½áÊø
 184  0021 7b03          	ld	a,(OFST+0,sp)
 185  0023 26f2          	jrne	L54
 186                     ; 48   flag_IR_read_over = 0;
 188  0025 b700          	ld	_flag_IR_read_over,a
 189                     ; 49   HW = TIM2_GetCounter();
 191  0027 cd0000        	call	_TIM2_GetCounter
 193  002a 1f01          	ldw	(OFST-2,sp),x
 194                     ; 50   TIM2_Cmd(DISABLE);
 196  002c 4f            	clr	a
 197  002d cd0000        	call	_TIM2_Cmd
 199                     ; 51   return HW;
 201  0030 1e01          	ldw	x,(OFST-2,sp)
 204  0032 5b03          	addw	sp,#3
 205  0034 81            	ret	
 206  0035               LC001:
 207  0035 4b20          	push	#32
 208  0037 ae5014        	ldw	x,#20500
 209  003a cd0000        	call	_GPIO_ReadInputPin
 211  003d 5b01          	addw	sp,#1
 212  003f 4d            	tnz	a
 213  0040 81            	ret	
 261                     ; 60 unsigned int LowPulseWidth(void)
 261                     ; 61 {
 262                     .text:	section	.text,new
 263  0000               _LowPulseWidth:
 265  0000 5203          	subw	sp,#3
 266       00000003      OFST:	set	3
 269                     ; 62 unsigned int LW = 0;
 271                     ; 63 unsigned char Loop = 1;
 273  0002 a601          	ld	a,#1
 274  0004 6b03          	ld	(OFST+0,sp),a
 275                     ; 64 if(!IR_IN_Status()) //¼ì²âµ½µÍµçÆ½
 277  0006 ad2d          	call	LC002
 278  0008 2617          	jrne	L501
 279                     ; 66 TIM2_SetCounter(1);
 281  000a ae0001        	ldw	x,#1
 282  000d cd0000        	call	_TIM2_SetCounter
 284                     ; 67 TIM2_Cmd(ENABLE);
 286  0010 a601          	ld	a,#1
 287  0012 cd0000        	call	_TIM2_Cmd
 289  0015 200a          	jra	L501
 290  0017               L301:
 291                     ; 71 if(IR_IN_Status() || flag_IR_read_over) Loop = 0; //¼ì²âµ½µÍµçÆ½»ò¶¨Ê±¼ÆÊýÒç³ö
 293  0017 ad1c          	call	LC002
 294  0019 2604          	jrne	L311
 296  001b b600          	ld	a,_flag_IR_read_over
 297  001d 2702          	jreq	L501
 298  001f               L311:
 301  001f 0f03          	clr	(OFST+0,sp)
 302  0021               L501:
 303                     ; 69 while(Loop) //µÈ´ýµÍµçÆ½½áÊø
 305  0021 7b03          	ld	a,(OFST+0,sp)
 306  0023 26f2          	jrne	L301
 307                     ; 73 flag_IR_read_over = 0;
 309  0025 b700          	ld	_flag_IR_read_over,a
 310                     ; 74 LW = TIM2_GetCounter();
 312  0027 cd0000        	call	_TIM2_GetCounter
 314  002a 1f01          	ldw	(OFST-2,sp),x
 315                     ; 75 TIM2_Cmd(DISABLE);
 317  002c 4f            	clr	a
 318  002d cd0000        	call	_TIM2_Cmd
 320                     ; 76 return LW;
 322  0030 1e01          	ldw	x,(OFST-2,sp)
 325  0032 5b03          	addw	sp,#3
 326  0034 81            	ret	
 327  0035               LC002:
 328  0035 4b20          	push	#32
 329  0037 ae5014        	ldw	x,#20500
 330  003a cd0000        	call	_GPIO_ReadInputPin
 332  003d 5b01          	addw	sp,#1
 333  003f 4d            	tnz	a
 334  0040 81            	ret	
 426                     ; 87 unsigned char Receive_IR_Dat(void)
 426                     ; 88 {
 427                     .text:	section	.text,new
 428  0000               _Receive_IR_Dat:
 430  0000 5209          	subw	sp,#9
 431       00000009      OFST:	set	9
 434                     ; 90 	unsigned char loop = 1;
 436  0002 a601          	ld	a,#1
 437  0004 6b03          	ld	(OFST-6,sp),a
 438                     ; 91 	unsigned int bitcnt = 24;
 440  0006 ae0018        	ldw	x,#24
 441  0009 1f04          	ldw	(OFST-5,sp),x
 442                     ; 92 	unsigned char error = 0;
 444  000b 0f02          	clr	(OFST-7,sp)
 445                     ; 93 	unsigned char value = 0;
 447  000d 0f01          	clr	(OFST-8,sp)
 448                     ; 94 	unsigned char i = 0,j = 0;
 450  000f 0f06          	clr	(OFST-3,sp)
 453  0011 0f07          	clr	(OFST-2,sp)
 454                     ; 96 	WL = LowPulseWidth();
 456  0013 cd0000        	call	_LowPulseWidth
 458  0016 1f08          	ldw	(OFST-1,sp),x
 459                     ; 98 	if(WL > 10000) //¼ì²âµ½µÄÊÇÒýµ¼ÂëµÍµçÆ½²¿·Ö
 461  0018 a32711        	cpw	x,#10001
 462  001b 2403cc00c9    	jrult	L361
 464  0020 cc00c0        	jra	L761
 465  0023               L561:
 466                     ; 105 			WL = HighPulseWidth();
 468  0023 cd0000        	call	_HighPulseWidth
 470  0026 1f08          	ldw	(OFST-1,sp),x
 471                     ; 106 			if((WL > CODE_1_H_MIN) && (WL < CODE_1_H_MAX))
 473  0028 a30033        	cpw	x,#51
 474  002b 2540          	jrult	L371
 476  002d a30258        	cpw	x,#600
 477  0030 243b          	jruge	L371
 478                     ; 108 				WL = LowPulseWidth();
 480  0032 cd0000        	call	_LowPulseWidth
 482  0035 1f08          	ldw	(OFST-1,sp),x
 483                     ; 109 				if((WL > CODE_1_L_MIN) && (WL < CODE_1_L_MAX))      //Êý¾Ý 0
 485  0037 a303e9        	cpw	x,#1001
 486  003a 252b          	jrult	L571
 488  003c a307d0        	cpw	x,#2000
 489  003f 2426          	jruge	L571
 490                     ; 111 					IR_data[i] &= ~(1<<(7 - j));
 492  0041 7b06          	ld	a,(OFST-3,sp)
 493  0043 5f            	clrw	x
 494  0044 97            	ld	xl,a
 495  0045 a607          	ld	a,#7
 496  0047 1007          	sub	a,(OFST-2,sp)
 497  0049 905f          	clrw	y
 498  004b 9097          	ld	yl,a
 499  004d a601          	ld	a,#1
 500  004f 905d          	tnzw	y
 501  0051 2705          	jreq	L06
 502  0053               L26:
 503  0053 48            	sll	a
 504  0054 905a          	decw	y
 505  0056 26fb          	jrne	L26
 506  0058               L06:
 507  0058 43            	cpl	a
 508  0059 e401          	and	a,(_IR_data,x)
 509  005b e701          	ld	(_IR_data,x),a
 510                     ; 112 					++ j;
 512  005d 0c07          	inc	(OFST-2,sp)
 513                     ; 113 					if(j > 7) 
 515  005f 7b07          	ld	a,(OFST-2,sp)
 516  0061 a108          	cp	a,#8
 517  0063 2548          	jrult	L312
 518                     ; 115 						j = 0;
 519                     ; 116 						++ i;
 520                     ; 118 					-- bitcnt; 
 521                     ; 119 					if(!bitcnt)
 522                     ; 121 						value = 1;  
 523                     ; 122 						loop = 0;	 
 524  0065 2042          	jp	LC006
 525  0067               L571:
 526                     ; 125 				else error = 1;
 529  0067 a601          	ld	a,#1
 530  0069 6b02          	ld	(OFST-7,sp),a
 531  006b 2053          	jra	L761
 532  006d               L371:
 533                     ; 127 			else if((WL > CODE_0_H_MIN) && (WL < CODE_0_H_MAX))
 535  006d a303e9        	cpw	x,#1001
 536  0070 2548          	jrult	L702
 538  0072 a307d0        	cpw	x,#2000
 539  0075 2443          	jruge	L702
 540                     ; 129 				WL = LowPulseWidth();
 542  0077 cd0000        	call	_LowPulseWidth
 544  007a 1f08          	ldw	(OFST-1,sp),x
 545                     ; 130 				if((WL > CODE_0_L_MIN) && (WL < CODE_0_L_MAX))       //Êý¾Ý 1
 547  007c a30033        	cpw	x,#51
 548  007f 25e6          	jrult	L571
 550  0081 a30258        	cpw	x,#600
 551  0084 24e1          	jruge	L571
 552                     ; 132 					IR_data[i] |= 1<<(7 - j);
 554  0086 7b06          	ld	a,(OFST-3,sp)
 555  0088 5f            	clrw	x
 556  0089 97            	ld	xl,a
 557  008a a607          	ld	a,#7
 558  008c 1007          	sub	a,(OFST-2,sp)
 559  008e 905f          	clrw	y
 560  0090 9097          	ld	yl,a
 561  0092 a601          	ld	a,#1
 562  0094 905d          	tnzw	y
 563  0096 2705          	jreq	L66
 564  0098               L07:
 565  0098 48            	sll	a
 566  0099 905a          	decw	y
 567  009b 26fb          	jrne	L07
 568  009d               L66:
 569  009d ea01          	or	a,(_IR_data,x)
 570  009f e701          	ld	(_IR_data,x),a
 571                     ; 133 					++ j;
 573  00a1 0c07          	inc	(OFST-2,sp)
 574                     ; 134 					if(j > 7) 
 576  00a3 7b07          	ld	a,(OFST-2,sp)
 577  00a5 a108          	cp	a,#8
 578  00a7 2504          	jrult	L312
 579                     ; 136 						j = 0;
 581                     ; 137 						++ i;
 583  00a9               LC006:
 585  00a9 0f07          	clr	(OFST-2,sp)
 587  00ab 0c06          	inc	(OFST-3,sp)
 588  00ad               L312:
 589                     ; 139 					-- bitcnt; 
 591                     ; 140 					if(!bitcnt)
 593                     ; 142 						value = 1;  
 596  00ad 1e04          	ldw	x,(OFST-5,sp)
 597  00af 5a            	decw	x
 598  00b0 1f04          	ldw	(OFST-5,sp),x
 600  00b2 260c          	jrne	L761
 602  00b4 a601          	ld	a,#1
 603  00b6 6b01          	ld	(OFST-8,sp),a
 604                     ; 143 						loop = 0;	 
 605  00b8 2004          	jp	LC003
 606                     ; 146 				else error = 1;
 607  00ba               L702:
 608                     ; 150 				error = 1;
 610  00ba a601          	ld	a,#1
 611  00bc 6b02          	ld	(OFST-7,sp),a
 612                     ; 151 				loop = 0;
 614  00be               LC003:
 617  00be 0f03          	clr	(OFST-6,sp)
 618  00c0               L761:
 619                     ; 103 		while(loop)
 621  00c0 7b03          	ld	a,(OFST-6,sp)
 622  00c2 2703cc0023    	jrne	L561
 624  00c7 2004          	jra	L322
 625  00c9               L361:
 626                     ; 158 		error = 1; //Ã»¼ì²âµ½Òýµ¼ÂëµÍµçÆ½²¿·Ö
 628  00c9 a601          	ld	a,#1
 629  00cb 6b02          	ld	(OFST-7,sp),a
 630  00cd               L322:
 631                     ; 160 	if(error)
 633  00cd 7b02          	ld	a,(OFST-7,sp)
 634  00cf 270c          	jreq	L522
 635                     ; 162 		IR_data[0] = 0;
 637  00d1 3f01          	clr	_IR_data
 638                     ; 163 		IR_data[1] = 0;
 640  00d3 3f02          	clr	_IR_data+1
 641                     ; 164 		IR_data[2] = 0;
 643  00d5 3f03          	clr	_IR_data+2
 644                     ; 165 		IR_data[3] = 0;
 646  00d7 3f04          	clr	_IR_data+3
 647                     ; 166 		value = 0;
 649  00d9 0f01          	clr	(OFST-8,sp)
 651  00db 2001          	jra	L722
 652  00dd               L522:
 653                     ; 170 		nop();
 656  00dd 9d            	nop	
 658  00de               L722:
 659                     ; 172 	return value;
 661  00de 7b01          	ld	a,(OFST-8,sp)
 664  00e0 5b09          	addw	sp,#9
 665  00e2 81            	ret	
 668                     	bsct
 669  000b               L132_last_key:
 670  000b 00            	dc.b	0
 671  000c               L332_key_press_flag:
 672  000c 00            	dc.b	0
 746                     ; 175 void IrKey_Scan(void)    //IRæŒ‰é”®è¯†åˆ«
 746                     ; 176 {
 747                     .text:	section	.text,new
 748  0000               _IrKey_Scan:
 750       00000002      OFST:	set	2
 753                     ; 182     cur_key = NO_KEY;
 755                     ; 183 	IrKey_Value = NO_KEY;
 757  0000 3f05          	clr	_IrKey_Value
 758  0002 89            	pushw	x
 759                     ; 184     back_last_key = last_key;
 761                     ; 186     cur_key = IR_data[2];
 763  0003 b603          	ld	a,_IR_data+2
 764  0005 6b02          	ld	(OFST+0,sp),a
 765                     ; 187 	IrKey_Value = cur_key;
 767  0007 b705          	ld	_IrKey_Value,a
 768                     ; 188     key_press_counter++;
 770  0009 be07          	ldw	x,_key_press_counter
 771  000b 5c            	incw	x
 772  000c bf07          	ldw	_key_press_counter,x
 773                     ; 189 	no_key_press_counter = 0;
 775  000e 5f            	clrw	x
 776  000f bf09          	ldw	_no_key_press_counter,x
 777                     ; 190     if (key_press_counter == KEY_LONG_CNT)          //é•¿æŒ‰
 779  0011 be07          	ldw	x,_key_press_counter
 780  0013 a3000a        	cpw	x,#10
 781  0016 2618          	jrne	L762
 782                     ; 192 		key_status = KEY_LONG;
 784  0018 35010006      	mov	_key_status,#1
 785                     ; 193 		if(IrKey_Value == KEY_IR_MODE)
 787  001c a1a2          	cp	a,#162
 788  001e 2607          	jrne	L172
 789                     ; 195 			flag_system_power = TRUE;
 791  0020 35010000      	mov	_flag_system_power,#1
 793  0024 cc00c5        	jra	L772
 794  0027               L172:
 795                     ; 197 		else if(IrKey_Value == KEY_IR_POWER)
 797  0027 a1a1          	cp	a,#161
 798  0029 26f9          	jrne	L772
 799                     ; 199 			flag_system_power = FALSE;
 801  002b 3f00          	clr	_flag_system_power
 802  002d cc00c5        	jra	L772
 803  0030               L762:
 804                     ; 214     else if (key_press_counter == (KEY_LONG_CNT + KEY_HOLD_CNT))        //è¿žæŒ‰
 806  0030 a3000d        	cpw	x,#13
 807  0033 2703cc00be    	jrne	L103
 808                     ; 216         key_status = KEY_HOLD;
 810  0038 35020006      	mov	_key_status,#2
 811                     ; 217         key_press_counter = KEY_LONG_CNT;
 813  003c ae000a        	ldw	x,#10
 814  003f bf07          	ldw	_key_press_counter,x
 815                     ; 218 		if(IrKey_Value == KEY_IR_DOWM)
 817  0041 a1a4          	cp	a,#164
 818  0043 2638          	jrne	L303
 819                     ; 220 			if(flag_mode_current == 0)
 821  0045 b600          	ld	a,_flag_mode_current
 822  0047 2604          	jrne	L503
 823                     ; 221 				cnt_vol_current--;
 825  0049 3a00          	dec	_cnt_vol_current
 827  004b 206c          	jra	L733
 828  004d               L503:
 829                     ; 222 			else if(flag_mode_current == 1)
 831  004d a101          	cp	a,#1
 832  004f 2604          	jrne	L113
 833                     ; 223 				cnt_time_shi_set1--;
 835  0051 3a00          	dec	_cnt_time_shi_set1
 837  0053 2064          	jra	L733
 838  0055               L113:
 839                     ; 224 			else if(flag_mode_current == 2)
 841  0055 a102          	cp	a,#2
 842  0057 2604          	jrne	L513
 843                     ; 225 				cnt_time_fen_set1--;
 845  0059 3a00          	dec	_cnt_time_fen_set1
 847  005b 205c          	jra	L733
 848  005d               L513:
 849                     ; 226 			else if(flag_mode_current == 3)
 851  005d a103          	cp	a,#3
 852  005f 2604          	jrne	L123
 853                     ; 227 				cnt_time_shi_set2--;
 855  0061 3a00          	dec	_cnt_time_shi_set2
 857  0063 2054          	jra	L733
 858  0065               L123:
 859                     ; 228 			else if(flag_mode_current == 4)
 861  0065 a104          	cp	a,#4
 862  0067 2604          	jrne	L523
 863                     ; 229 				cnt_time_fen_set2--;
 865  0069 3a00          	dec	_cnt_time_fen_set2
 867  006b 204c          	jra	L733
 868  006d               L523:
 869                     ; 230 			else if(flag_mode_current == 5)
 871  006d a105          	cp	a,#5
 872  006f 2604          	jrne	L133
 873                     ; 231 				cnt_time_shi_current--;
 875  0071 3a00          	dec	_cnt_time_shi_current
 877  0073 2044          	jra	L733
 878  0075               L133:
 879                     ; 232 			else if(flag_mode_current == 6)
 881  0075 a106          	cp	a,#6
 882  0077 2640          	jrne	L733
 883                     ; 233 				cnt_time_fen_current--;
 885  0079 3a00          	dec	_cnt_time_fen_current
 886  007b 203c          	jra	L733
 887  007d               L303:
 888                     ; 235 		else if(IrKey_Value == KEY_IR_UP)
 890  007d a1a8          	cp	a,#168
 891  007f 2638          	jrne	L733
 892                     ; 237 			if(flag_mode_current == 0)
 894  0081 b600          	ld	a,_flag_mode_current
 895  0083 2604          	jrne	L343
 896                     ; 238 				cnt_vol_current ++;
 898  0085 3c00          	inc	_cnt_vol_current
 900  0087 202e          	jra	L543
 901  0089               L343:
 902                     ; 239 			else if(flag_mode_current == 1)
 904  0089 a101          	cp	a,#1
 905  008b 2604          	jrne	L743
 906                     ; 240 				cnt_time_shi_set1++;
 908  008d 3c00          	inc	_cnt_time_shi_set1
 910  008f 2026          	jra	L543
 911  0091               L743:
 912                     ; 241 			else if(flag_mode_current == 2)
 914  0091 a102          	cp	a,#2
 915  0093 2604          	jrne	L353
 916                     ; 242 				cnt_time_fen_set1++;
 918  0095 3c00          	inc	_cnt_time_fen_set1
 920  0097 201e          	jra	L543
 921  0099               L353:
 922                     ; 243 			else if(flag_mode_current == 3)
 924  0099 a103          	cp	a,#3
 925  009b 2604          	jrne	L753
 926                     ; 244 				cnt_time_shi_set2++;
 928  009d 3c00          	inc	_cnt_time_shi_set2
 930  009f 2016          	jra	L543
 931  00a1               L753:
 932                     ; 245 			else if(flag_mode_current == 4)
 934  00a1 a104          	cp	a,#4
 935  00a3 2604          	jrne	L363
 936                     ; 246 				cnt_time_fen_set2++;
 938  00a5 3c00          	inc	_cnt_time_fen_set2
 940  00a7 200e          	jra	L543
 941  00a9               L363:
 942                     ; 247 			else if(flag_mode_current == 5)
 944  00a9 a105          	cp	a,#5
 945  00ab 2604          	jrne	L763
 946                     ; 248 				cnt_time_shi_current++;
 948  00ad 3c00          	inc	_cnt_time_shi_current
 950  00af 2006          	jra	L543
 951  00b1               L763:
 952                     ; 249 			else if(flag_mode_current == 6)
 954  00b1 a106          	cp	a,#6
 955  00b3 2602          	jrne	L543
 956                     ; 250 				cnt_time_fen_current++;
 958  00b5 3c00          	inc	_cnt_time_fen_current
 959  00b7               L543:
 960                     ; 251 			IrKey_Value = 0;
 962  00b7 3f05          	clr	_IrKey_Value
 963  00b9               L733:
 964                     ; 262 		time_process();						
 966  00b9 cd0000        	call	_time_process
 969  00bc 2007          	jra	L772
 970  00be               L103:
 971                     ; 264     else if(key_press_counter < KEY_LONG_CNT)
 973  00be a3000a        	cpw	x,#10
 974  00c1 2402          	jruge	L772
 975                     ; 266    		key_status = KEY_SHORT_UP;
 977  00c3 3f06          	clr	_key_status
 978                     ; 267         return;
 980  00c5               L772:
 981                     ; 270 } 
 984  00c5 85            	popw	x
 985  00c6 81            	ret	
1021                     ; 272 void Irkey_release()
1021                     ; 273 {
1022                     .text:	section	.text,new
1023  0000               _Irkey_release:
1027                     ; 274 	no_key_press_counter++;
1029  0000 be09          	ldw	x,_no_key_press_counter
1030  0002 5c            	incw	x
1031  0003 bf09          	ldw	_no_key_press_counter,x
1032                     ; 275 	if(no_key_press_counter == 500)
1034  0005 a301f4        	cpw	x,#500
1035  0008 2703cc00ba    	jrne	L324
1036                     ; 277 		no_key_press_counter = 0;
1038  000d 5f            	clrw	x
1039  000e bf09          	ldw	_no_key_press_counter,x
1040                     ; 278 		key_press_counter = 0;
1042  0010 bf07          	ldw	_key_press_counter,x
1043                     ; 279 		if((key_status == KEY_LONG)||(key_status == KEY_HOLD))
1045  0012 b606          	ld	a,_key_status
1046  0014 a101          	cp	a,#1
1047  0016 2704          	jreq	L724
1049  0018 a102          	cp	a,#2
1050  001a 2603          	jrne	L524
1051  001c               L724:
1052                     ; 281 			IrKey_Value = NO_KEY;
1054  001c 3f05          	clr	_IrKey_Value
1055                     ; 282 			return;
1058  001e 81            	ret	
1059  001f               L524:
1060                     ; 284 		switch(IrKey_Value)
1062  001f b605          	ld	a,_IrKey_Value
1064                     ; 332 				break;
1065  0021 a0a1          	sub	a,#161
1066  0023 2603cc00b5    	jreq	L704
1067  0028 4a            	dec	a
1068  0029 277c          	jreq	L504
1069  002b a002          	sub	a,#2
1070  002d 2706          	jreq	L104
1071  002f a004          	sub	a,#4
1072  0031 273c          	jreq	L304
1073                     ; 330 			default:
1073                     ; 331 				IrKey_Value = 0;
1074                     ; 332 				break;
1076  0033 207c          	jp	L125
1077  0035               L104:
1078                     ; 286 			case KEY_IR_DOWM:
1078                     ; 287 				IrKey_Value = 0;
1080  0035 b705          	ld	_IrKey_Value,a
1081                     ; 288 				if(flag_mode_current == 0)
1083  0037 b600          	ld	a,_flag_mode_current
1084  0039 2604          	jrne	L534
1085                     ; 289 					cnt_vol_current--;
1087  003b 3a00          	dec	_cnt_vol_current
1089  003d 2072          	jra	L125
1090  003f               L534:
1091                     ; 290 				else if(flag_mode_current == 1)
1093  003f a101          	cp	a,#1
1094  0041 2604          	jrne	L144
1095                     ; 291 					cnt_time_shi_set1--;
1097  0043 3a00          	dec	_cnt_time_shi_set1
1099  0045 206a          	jra	L125
1100  0047               L144:
1101                     ; 292 				else if(flag_mode_current == 2)
1103  0047 a102          	cp	a,#2
1104  0049 2604          	jrne	L544
1105                     ; 293 					cnt_time_fen_set1--;
1107  004b 3a00          	dec	_cnt_time_fen_set1
1109  004d 2062          	jra	L125
1110  004f               L544:
1111                     ; 294 				else if(flag_mode_current == 3)
1113  004f a103          	cp	a,#3
1114  0051 2604          	jrne	L154
1115                     ; 295 					cnt_time_shi_set2--;
1117  0053 3a00          	dec	_cnt_time_shi_set2
1119  0055 205a          	jra	L125
1120  0057               L154:
1121                     ; 296 				else if(flag_mode_current == 4)
1123  0057 a104          	cp	a,#4
1124  0059 2604          	jrne	L554
1125                     ; 297 					cnt_time_fen_set2--;
1127  005b 3a00          	dec	_cnt_time_fen_set2
1129  005d 2052          	jra	L125
1130  005f               L554:
1131                     ; 298 				else if(flag_mode_current == 5)
1133  005f a105          	cp	a,#5
1134  0061 2604          	jrne	L164
1135                     ; 299 					cnt_time_shi_current--;
1137  0063 3a00          	dec	_cnt_time_shi_current
1139  0065 204a          	jra	L125
1140  0067               L164:
1141                     ; 300 				else if(flag_mode_current == 6)
1143  0067 a106          	cp	a,#6
1144  0069 2646          	jrne	L125
1145                     ; 301 					cnt_time_fen_current--;
1147  006b 3a00          	dec	_cnt_time_fen_current
1148                     ; 302 				IrKey_Value =0;
1149                     ; 303 				break;
1151  006d 2042          	jp	L125
1152  006f               L304:
1153                     ; 304 			case KEY_IR_UP:
1153                     ; 305 				if(flag_mode_current == 0)
1155  006f b600          	ld	a,_flag_mode_current
1156  0071 2604          	jrne	L764
1157                     ; 306 					cnt_vol_current ++;
1159  0073 3c00          	inc	_cnt_vol_current
1161  0075 203a          	jra	L125
1162  0077               L764:
1163                     ; 307 				else if(flag_mode_current == 1)
1165  0077 a101          	cp	a,#1
1166  0079 2604          	jrne	L374
1167                     ; 308 					cnt_time_shi_set1++;
1169  007b 3c00          	inc	_cnt_time_shi_set1
1171  007d 2032          	jra	L125
1172  007f               L374:
1173                     ; 309 				else if(flag_mode_current == 2)
1175  007f a102          	cp	a,#2
1176  0081 2604          	jrne	L774
1177                     ; 310 					cnt_time_fen_set1++;
1179  0083 3c00          	inc	_cnt_time_fen_set1
1181  0085 202a          	jra	L125
1182  0087               L774:
1183                     ; 311 				else if(flag_mode_current == 3)
1185  0087 a103          	cp	a,#3
1186  0089 2604          	jrne	L305
1187                     ; 312 					cnt_time_shi_set2++;
1189  008b 3c00          	inc	_cnt_time_shi_set2
1191  008d 2022          	jra	L125
1192  008f               L305:
1193                     ; 313 				else if(flag_mode_current == 4)
1195  008f a104          	cp	a,#4
1196  0091 2604          	jrne	L705
1197                     ; 314 					cnt_time_fen_set2++;
1199  0093 3c00          	inc	_cnt_time_fen_set2
1201  0095 201a          	jra	L125
1202  0097               L705:
1203                     ; 315 				else if(flag_mode_current == 5)
1205  0097 a105          	cp	a,#5
1206  0099 2604          	jrne	L315
1207                     ; 316 					cnt_time_shi_current++;
1209  009b 3c00          	inc	_cnt_time_shi_current
1211  009d 2012          	jra	L125
1212  009f               L315:
1213                     ; 317 				else if(flag_mode_current == 6)
1215  009f a106          	cp	a,#6
1216  00a1 260e          	jrne	L125
1217                     ; 318 					cnt_time_fen_current++;
1219  00a3 3c00          	inc	_cnt_time_fen_current
1220                     ; 319 				IrKey_Value = 0;
1221                     ; 320 				break;
1223  00a5 200a          	jp	L125
1224  00a7               L504:
1225                     ; 321 			case KEY_IR_MODE:
1225                     ; 322 				flag_mode_current++;
1227  00a7 3c00          	inc	_flag_mode_current
1228                     ; 323 				if(flag_mode_current == 7)
1230  00a9 b600          	ld	a,_flag_mode_current
1231  00ab a107          	cp	a,#7
1232  00ad 2602          	jrne	L125
1233                     ; 324 					flag_mode_current = 0;
1235  00af 3f00          	clr	_flag_mode_current
1236  00b1               L125:
1237                     ; 325 				IrKey_Value = 0;
1242  00b1 3f05          	clr	_IrKey_Value
1243                     ; 326 				break;
1245  00b3 2002          	jra	L334
1246  00b5               L704:
1247                     ; 327 			case KEY_IR_POWER:
1247                     ; 328 				IrKey_Value = 0;
1249  00b5 b705          	ld	_IrKey_Value,a
1250                     ; 329 				break;
1252  00b7               L334:
1253                     ; 336 		time_process();
1255  00b7 cd0000        	call	_time_process
1257  00ba               L324:
1258                     ; 339 }
1261  00ba 81            	ret	
1290                     ; 341 void time_process()
1290                     ; 342 {
1291                     .text:	section	.text,new
1292  0000               _time_process:
1296                     ; 343 	if(cnt_time_shi_set1 == 26)
1298  0000 b600          	ld	a,_cnt_time_shi_set1
1299  0002 a11a          	cp	a,#26
1300  0004 2602          	jrne	L335
1301                     ; 344 		cnt_time_shi_set1 = 0;
1303  0006 3f00          	clr	_cnt_time_shi_set1
1304  0008               L335:
1305                     ; 345 	if(cnt_time_shi_set2 == 26)
1307  0008 b600          	ld	a,_cnt_time_shi_set2
1308  000a a11a          	cp	a,#26
1309  000c 2602          	jrne	L535
1310                     ; 346 		cnt_time_shi_set2 = 0;
1312  000e 3f00          	clr	_cnt_time_shi_set2
1313  0010               L535:
1314                     ; 347 	if(cnt_time_shi_current == 25)
1316  0010 b600          	ld	a,_cnt_time_shi_current
1317  0012 a119          	cp	a,#25
1318  0014 2602          	jrne	L735
1319                     ; 348 		cnt_time_shi_current = 0;
1321  0016 3f00          	clr	_cnt_time_shi_current
1322  0018               L735:
1323                     ; 350 	if(cnt_time_fen_set1 == 61)
1325  0018 b600          	ld	a,_cnt_time_fen_set1
1326  001a a13d          	cp	a,#61
1327  001c 2602          	jrne	L145
1328                     ; 351 		cnt_time_fen_set1 = 0;
1330  001e 3f00          	clr	_cnt_time_fen_set1
1331  0020               L145:
1332                     ; 352 	if(cnt_time_fen_set2 == 61)
1334  0020 b600          	ld	a,_cnt_time_fen_set2
1335  0022 a13d          	cp	a,#61
1336  0024 2602          	jrne	L345
1337                     ; 353 		cnt_time_fen_set2 = 0;
1339  0026 3f00          	clr	_cnt_time_fen_set2
1340  0028               L345:
1341                     ; 354 	if(cnt_time_shi_current == 61)
1343  0028 b600          	ld	a,_cnt_time_shi_current
1344  002a a13d          	cp	a,#61
1345  002c 2602          	jrne	L545
1346                     ; 355 		cnt_time_fen_current = 0;
1348  002e 3f00          	clr	_cnt_time_fen_current
1349  0030               L545:
1350                     ; 357 	if(cnt_time_shi_set1 == 255)
1352  0030 b600          	ld	a,_cnt_time_shi_set1
1353  0032 4c            	inc	a
1354  0033 2604          	jrne	L745
1355                     ; 358 		cnt_time_shi_set1 = 25;
1357  0035 35190000      	mov	_cnt_time_shi_set1,#25
1358  0039               L745:
1359                     ; 359 	if(cnt_time_shi_set2 == 255)
1361  0039 b600          	ld	a,_cnt_time_shi_set2
1362  003b 4c            	inc	a
1363  003c 2604          	jrne	L155
1364                     ; 360 		cnt_time_shi_set2 = 25;
1366  003e 35190000      	mov	_cnt_time_shi_set2,#25
1367  0042               L155:
1368                     ; 361 	if(cnt_time_shi_current == 255)
1370  0042 b600          	ld	a,_cnt_time_shi_current
1371  0044 4c            	inc	a
1372  0045 2604          	jrne	L355
1373                     ; 362 		cnt_time_shi_current = 24;
1375  0047 35180000      	mov	_cnt_time_shi_current,#24
1376  004b               L355:
1377                     ; 364 	if(cnt_time_fen_set1 == 255)
1379  004b b600          	ld	a,_cnt_time_fen_set1
1380  004d 4c            	inc	a
1381  004e 2604          	jrne	L555
1382                     ; 365 		cnt_time_fen_set1 = 60;
1384  0050 353c0000      	mov	_cnt_time_fen_set1,#60
1385  0054               L555:
1386                     ; 366 	if(cnt_time_fen_set2 == 255)
1388  0054 b600          	ld	a,_cnt_time_fen_set2
1389  0056 4c            	inc	a
1390  0057 2604          	jrne	L755
1391                     ; 367 		cnt_time_fen_set2 = 60;
1393  0059 353c0000      	mov	_cnt_time_fen_set2,#60
1394  005d               L755:
1395                     ; 368 	if(cnt_time_shi_current == 255)
1397  005d b600          	ld	a,_cnt_time_shi_current
1398  005f 4c            	inc	a
1399  0060 2604          	jrne	L165
1400                     ; 369 		cnt_time_fen_current = 60;	
1402  0062 353c0000      	mov	_cnt_time_fen_current,#60
1403  0066               L165:
1404                     ; 371 }
1407  0066 81            	ret	
1478                     	xref.b	_cnt_vol_current
1479                     	xref.b	_cnt_time_shi_set2
1480                     	xref.b	_cnt_time_fen_set2
1481                     	xref.b	_cnt_time_shi_set1
1482                     	xref.b	_cnt_time_fen_set1
1483                     	xref.b	_cnt_time_shi_current
1484                     	xref.b	_cnt_time_fen_current
1485                     	xref.b	_flag_mode_current
1486                     	xref.b	_flag_system_power
1487                     	xdef	_no_key_press_counter
1488                     	xdef	_key_press_counter
1489                     	xdef	_key_status
1490                     	xdef	_IrKey_Value
1491                     	xdef	_time_process
1492                     	xdef	_Irkey_release
1493                     	xdef	_IrKey_Scan
1494                     	xdef	_Init_TIM2
1495                     	xdef	_Receive_IR_Dat
1496                     	xdef	_LowPulseWidth
1497                     	xdef	_HighPulseWidth
1498                     	xdef	_IR_data
1499                     	xdef	_flag_IR_read_over
1500                     	xref	_TIM2_GetCounter
1501                     	xref	_TIM2_SetCounter
1502                     	xref	_TIM2_Cmd
1503                     	xref	_TIM2_TimeBaseInit
1504                     	xref	_TIM2_DeInit
1505                     	xref	_GPIO_ReadInputPin
1524                     	end
