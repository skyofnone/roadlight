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
 140                     ; 35 uint32_t HighPulseWidth(void)
 140                     ; 36 {
 141                     .text:	section	.text,new
 142  0000               _HighPulseWidth:
 144  0000 5205          	subw	sp,#5
 145       00000005      OFST:	set	5
 148                     ; 37   uint32_t HW = 0;
 150                     ; 38   uint8_t Loop = 1;
 152  0002 a601          	ld	a,#1
 153  0004 6b05          	ld	(OFST+0,sp),a
 154                     ; 39   if(IR_IN_Status()) //¼ì²âµ½¸ßµçÆ½
 156  0006 ad36          	call	LC001
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
 172  0017 ad25          	call	LC001
 173  0019 2704          	jreq	L55
 175  001b b600          	ld	a,_flag_IR_read_over
 176  001d 2702          	jreq	L74
 177  001f               L55:
 180  001f 0f05          	clr	(OFST+0,sp)
 181  0021               L74:
 182                     ; 44   while(Loop) //µÈ´ý¸ßµçÆ½½áÊø
 184  0021 7b05          	ld	a,(OFST+0,sp)
 185  0023 26f2          	jrne	L54
 186                     ; 48   flag_IR_read_over = 0;
 188  0025 b700          	ld	_flag_IR_read_over,a
 189                     ; 49   HW = TIM2_GetCounter();
 191  0027 cd0000        	call	_TIM2_GetCounter
 193  002a cd0000        	call	c_uitolx
 195  002d 96            	ldw	x,sp
 196  002e 5c            	incw	x
 197  002f cd0000        	call	c_rtol
 199                     ; 50   TIM2_Cmd(DISABLE);
 201  0032 4f            	clr	a
 202  0033 cd0000        	call	_TIM2_Cmd
 204                     ; 51   return HW;
 206  0036 96            	ldw	x,sp
 207  0037 5c            	incw	x
 208  0038 cd0000        	call	c_ltor
 212  003b 5b05          	addw	sp,#5
 213  003d 81            	ret	
 214  003e               LC001:
 215  003e 4b01          	push	#1
 216  0040 ae5005        	ldw	x,#20485
 217  0043 cd0000        	call	_GPIO_ReadInputPin
 219  0046 5b01          	addw	sp,#1
 220  0048 4d            	tnz	a
 221  0049 81            	ret	
 269                     ; 60 uint32_t LowPulseWidth(void)
 269                     ; 61 {
 270                     .text:	section	.text,new
 271  0000               _LowPulseWidth:
 273  0000 5205          	subw	sp,#5
 274       00000005      OFST:	set	5
 277                     ; 62     uint32_t LW = 0;
 279                     ; 63     uint8_t Loop = 1;
 281  0002 a601          	ld	a,#1
 282  0004 6b05          	ld	(OFST+0,sp),a
 283                     ; 64     if(!IR_IN_Status()) //¼ì²âµ½µÍµçÆ½
 285  0006 ad36          	call	LC002
 286  0008 2617          	jrne	L501
 287                     ; 66         TIM2_SetCounter(1);
 289  000a ae0001        	ldw	x,#1
 290  000d cd0000        	call	_TIM2_SetCounter
 292                     ; 67         TIM2_Cmd(ENABLE);
 294  0010 a601          	ld	a,#1
 295  0012 cd0000        	call	_TIM2_Cmd
 297  0015 200a          	jra	L501
 298  0017               L301:
 299                     ; 71         if(IR_IN_Status() || flag_IR_read_over) Loop = 0; //¼ì²âµ½µÍµçÆ½»ò¶¨Ê±¼ÆÊýÒç³ö
 301  0017 ad25          	call	LC002
 302  0019 2604          	jrne	L311
 304  001b b600          	ld	a,_flag_IR_read_over
 305  001d 2702          	jreq	L501
 306  001f               L311:
 309  001f 0f05          	clr	(OFST+0,sp)
 310  0021               L501:
 311                     ; 69     while(Loop) //µÈ´ýµÍµçÆ½½áÊø
 313  0021 7b05          	ld	a,(OFST+0,sp)
 314  0023 26f2          	jrne	L301
 315                     ; 73     flag_IR_read_over = 0;
 317  0025 b700          	ld	_flag_IR_read_over,a
 318                     ; 74     LW = TIM2_GetCounter();
 320  0027 cd0000        	call	_TIM2_GetCounter
 322  002a cd0000        	call	c_uitolx
 324  002d 96            	ldw	x,sp
 325  002e 5c            	incw	x
 326  002f cd0000        	call	c_rtol
 328                     ; 75     TIM2_Cmd(DISABLE);
 330  0032 4f            	clr	a
 331  0033 cd0000        	call	_TIM2_Cmd
 333                     ; 76     return LW;
 335  0036 96            	ldw	x,sp
 336  0037 5c            	incw	x
 337  0038 cd0000        	call	c_ltor
 341  003b 5b05          	addw	sp,#5
 342  003d 81            	ret	
 343  003e               LC002:
 344  003e 4b01          	push	#1
 345  0040 ae5005        	ldw	x,#20485
 346  0043 cd0000        	call	_GPIO_ReadInputPin
 348  0046 5b01          	addw	sp,#1
 349  0048 4d            	tnz	a
 350  0049 81            	ret	
 442                     .const:	section	.text
 443  0000               L45:
 444  0000 000003e9      	dc.l	1001
 445  0004               L06:
 446  0004 00000033      	dc.l	51
 447  0008               L26:
 448  0008 00000258      	dc.l	600
 449  000c               L66:
 450  000c 000007d0      	dc.l	2000
 451                     ; 87 uint8_t Receive_IR_Dat(void)
 451                     ; 88 {
 452                     .text:	section	.text,new
 453  0000               _Receive_IR_Dat:
 455  0000 520d          	subw	sp,#13
 456       0000000d      OFST:	set	13
 459                     ; 90 	uint8_t loop = 1;
 461  0002 a601          	ld	a,#1
 462  0004 6b03          	ld	(OFST-10,sp),a
 463                     ; 91 	uint32_t bitcnt = 24;
 465  0006 ae0018        	ldw	x,#24
 466  0009 1f06          	ldw	(OFST-7,sp),x
 467  000b 5f            	clrw	x
 468  000c 1f04          	ldw	(OFST-9,sp),x
 469                     ; 92 	uint8_t error = 0;
 471  000e 0f02          	clr	(OFST-11,sp)
 472                     ; 93 	uint8_t value = 0;
 474  0010 0f01          	clr	(OFST-12,sp)
 475                     ; 94 	uint8_t i = 0,j = 0;
 477  0012 0f08          	clr	(OFST-5,sp)
 480  0014 0f09          	clr	(OFST-4,sp)
 481                     ; 96 	WL = LowPulseWidth();
 483  0016 cd0000        	call	_LowPulseWidth
 485  0019 96            	ldw	x,sp
 486  001a 1c000a        	addw	x,#OFST-3
 487  001d cd0000        	call	c_rtol
 489                     ; 98 	if(WL > 1000) //¼ì²âµ½µÄÊÇÒýµ¼ÂëµÍµçÆ½²¿·Ö
 491  0020 96            	ldw	x,sp
 492  0021 cd010d        	call	LC007
 494  0024 2403cc00f3    	jrult	L361
 496  0029 cc00ea        	jra	L761
 497  002c               L561:
 498                     ; 105 			WL = HighPulseWidth();
 500  002c cd0000        	call	_HighPulseWidth
 502  002f 96            	ldw	x,sp
 503  0030 1c000a        	addw	x,#OFST-3
 504  0033 cd0000        	call	c_rtol
 506                     ; 106 			if((WL > CODE_1_H_MIN) && (WL < CODE_1_H_MAX))
 508  0036 96            	ldw	x,sp
 509  0037 cd0119        	call	LC008
 511  003a 2548          	jrult	L371
 513  003c 96            	ldw	x,sp
 514  003d cd0125        	call	LC009
 516  0040 2442          	jruge	L371
 517                     ; 108 				WL = LowPulseWidth();
 519  0042 cd0000        	call	_LowPulseWidth
 521  0045 96            	ldw	x,sp
 522  0046 1c000a        	addw	x,#OFST-3
 523  0049 cd0000        	call	c_rtol
 525                     ; 109 				if((WL > CODE_1_L_MIN) && (WL < CODE_1_L_MAX))      //Êý¾Ý 0
 527  004c 96            	ldw	x,sp
 528  004d cd010d        	call	LC007
 530  0050 252c          	jrult	L571
 532  0052 96            	ldw	x,sp
 533  0053 cd0131        	call	LC010
 535  0056 2426          	jruge	L571
 536                     ; 111 					IR_data[i] &= ~(1<<(7 - j));
 538  0058 7b08          	ld	a,(OFST-5,sp)
 539  005a 5f            	clrw	x
 540  005b 97            	ld	xl,a
 541  005c a607          	ld	a,#7
 542  005e 1009          	sub	a,(OFST-4,sp)
 543  0060 905f          	clrw	y
 544  0062 9097          	ld	yl,a
 545  0064 a601          	ld	a,#1
 546  0066 905d          	tnzw	y
 547  0068 2705          	jreq	L07
 548  006a               L27:
 549  006a 48            	sll	a
 550  006b 905a          	decw	y
 551  006d 26fb          	jrne	L27
 552  006f               L07:
 553  006f 43            	cpl	a
 554  0070 e401          	and	a,(_IR_data,x)
 555  0072 e701          	ld	(_IR_data,x),a
 556                     ; 112 					++ j;
 558  0074 0c09          	inc	(OFST-4,sp)
 559                     ; 113 					if(j > 7) 
 561  0076 7b09          	ld	a,(OFST-4,sp)
 562  0078 a108          	cp	a,#8
 563  007a 2550          	jrult	L312
 564                     ; 115 						j = 0;
 565                     ; 116 						++ i;
 566                     ; 118 					-- bitcnt; 
 568                     ; 119 					if(!bitcnt)
 570                     ; 121 						value = 1;  
 571                     ; 122 						loop = 0;	 
 572  007c 204a          	jp	LC006
 573  007e               L571:
 574                     ; 125 				else error = 1;
 577  007e a601          	ld	a,#1
 578  0080 6b02          	ld	(OFST-11,sp),a
 579  0082 2066          	jra	L761
 580  0084               L371:
 581                     ; 127 			else if((WL > CODE_0_H_MIN) && (WL < CODE_0_H_MAX))
 583  0084 96            	ldw	x,sp
 584  0085 cd010d        	call	LC007
 586  0088 255a          	jrult	L702
 588  008a 96            	ldw	x,sp
 589  008b cd0131        	call	LC010
 591  008e 2454          	jruge	L702
 592                     ; 129 				WL = LowPulseWidth();
 594  0090 cd0000        	call	_LowPulseWidth
 596  0093 96            	ldw	x,sp
 597  0094 1c000a        	addw	x,#OFST-3
 598  0097 cd0000        	call	c_rtol
 600                     ; 130 				if((WL > CODE_0_L_MIN) && (WL < CODE_0_L_MAX))       //Êý¾Ý 1
 602  009a 96            	ldw	x,sp
 603  009b ad7c          	call	LC008
 605  009d 25df          	jrult	L571
 607  009f 96            	ldw	x,sp
 608  00a0 cd0125        	call	LC009
 610  00a3 24d9          	jruge	L571
 611                     ; 132 					IR_data[i] |= 1<<(7 - j);
 613  00a5 7b08          	ld	a,(OFST-5,sp)
 614  00a7 5f            	clrw	x
 615  00a8 97            	ld	xl,a
 616  00a9 a607          	ld	a,#7
 617  00ab 1009          	sub	a,(OFST-4,sp)
 618  00ad 905f          	clrw	y
 619  00af 9097          	ld	yl,a
 620  00b1 a601          	ld	a,#1
 621  00b3 905d          	tnzw	y
 622  00b5 2705          	jreq	L67
 623  00b7               L001:
 624  00b7 48            	sll	a
 625  00b8 905a          	decw	y
 626  00ba 26fb          	jrne	L001
 627  00bc               L67:
 628  00bc ea01          	or	a,(_IR_data,x)
 629  00be e701          	ld	(_IR_data,x),a
 630                     ; 133 					++ j;
 632  00c0 0c09          	inc	(OFST-4,sp)
 633                     ; 134 					if(j > 7) 
 635  00c2 7b09          	ld	a,(OFST-4,sp)
 636  00c4 a108          	cp	a,#8
 637  00c6 2504          	jrult	L312
 638                     ; 136 						j = 0;
 640                     ; 137 						++ i;
 642  00c8               LC006:
 644  00c8 0f09          	clr	(OFST-4,sp)
 646  00ca 0c08          	inc	(OFST-5,sp)
 647  00cc               L312:
 648                     ; 139 					-- bitcnt; 
 651                     ; 140 					if(!bitcnt)
 654                     ; 142 						value = 1;  
 657  00cc 96            	ldw	x,sp
 658  00cd 1c0004        	addw	x,#OFST-9
 659  00d0 a601          	ld	a,#1
 660  00d2 cd0000        	call	c_lgsbc
 662  00d5 96            	ldw	x,sp
 663  00d6 1c0004        	addw	x,#OFST-9
 664  00d9 cd0000        	call	c_lzmp
 665  00dc 260c          	jrne	L761
 667  00de a601          	ld	a,#1
 668  00e0 6b01          	ld	(OFST-12,sp),a
 669                     ; 143 						loop = 0;	 
 670  00e2 2004          	jp	LC003
 671                     ; 146 				else error = 1;
 672  00e4               L702:
 673                     ; 150 				error = 1;
 675  00e4 a601          	ld	a,#1
 676  00e6 6b02          	ld	(OFST-11,sp),a
 677                     ; 151 				loop = 0;
 679  00e8               LC003:
 682  00e8 0f03          	clr	(OFST-10,sp)
 683  00ea               L761:
 684                     ; 103 		while(loop)
 686  00ea 7b03          	ld	a,(OFST-10,sp)
 687  00ec 2703cc002c    	jrne	L561
 689  00f1 2004          	jra	L322
 690  00f3               L361:
 691                     ; 158 		error = 1; //Ã»¼ì²âµ½Òýµ¼ÂëµÍµçÆ½²¿·Ö
 693  00f3 a601          	ld	a,#1
 694  00f5 6b02          	ld	(OFST-11,sp),a
 695  00f7               L322:
 696                     ; 160 	if(error)
 698  00f7 7b02          	ld	a,(OFST-11,sp)
 699  00f9 270c          	jreq	L522
 700                     ; 162 		IR_data[0] = 0;
 702  00fb 3f01          	clr	_IR_data
 703                     ; 163 		IR_data[1] = 0;
 705  00fd 3f02          	clr	_IR_data+1
 706                     ; 164 		IR_data[2] = 0;
 708  00ff 3f03          	clr	_IR_data+2
 709                     ; 165 		IR_data[3] = 0;
 711  0101 3f04          	clr	_IR_data+3
 712                     ; 166 		value = 0;
 714  0103 0f01          	clr	(OFST-12,sp)
 716  0105 2001          	jra	L722
 717  0107               L522:
 718                     ; 170 		nop();
 721  0107 9d            	nop	
 723  0108               L722:
 724                     ; 172 	return value;
 726  0108 7b01          	ld	a,(OFST-12,sp)
 729  010a 5b0d          	addw	sp,#13
 730  010c 81            	ret	
 731  010d               LC007:
 732  010d 1c000a        	addw	x,#OFST-3
 733  0110 cd0000        	call	c_ltor
 735  0113 ae0000        	ldw	x,#L45
 736  0116 cc0000        	jp	c_lcmp
 737  0119               LC008:
 738  0119 1c000a        	addw	x,#OFST-3
 739  011c cd0000        	call	c_ltor
 741  011f ae0004        	ldw	x,#L06
 742  0122 cc0000        	jp	c_lcmp
 743  0125               LC009:
 744  0125 1c000a        	addw	x,#OFST-3
 745  0128 cd0000        	call	c_ltor
 747  012b ae0008        	ldw	x,#L26
 748  012e cc0000        	jp	c_lcmp
 749  0131               LC010:
 750  0131 1c000a        	addw	x,#OFST-3
 751  0134 cd0000        	call	c_ltor
 753  0137 ae000c        	ldw	x,#L66
 754  013a cc0000        	jp	c_lcmp
 757                     	bsct
 758  000b               L132_last_key:
 759  000b 00            	dc.b	0
 760  000c               L332_key_press_flag:
 761  000c 00            	dc.b	0
 835                     ; 175 void IrKey_Scan(void)    //IRæŒ‰é”®è¯†åˆ«
 835                     ; 176 {
 836                     .text:	section	.text,new
 837  0000               _IrKey_Scan:
 839       00000002      OFST:	set	2
 842                     ; 182     cur_key = NO_KEY;
 844                     ; 183 	IrKey_Value = NO_KEY;
 846  0000 3f05          	clr	_IrKey_Value
 847  0002 89            	pushw	x
 848                     ; 184     back_last_key = last_key;
 850                     ; 186     cur_key = IR_data[2];
 852  0003 b603          	ld	a,_IR_data+2
 853  0005 6b02          	ld	(OFST+0,sp),a
 854                     ; 187 	IrKey_Value = cur_key;
 856  0007 b705          	ld	_IrKey_Value,a
 857                     ; 188     key_press_counter++;
 859  0009 be07          	ldw	x,_key_press_counter
 860  000b 5c            	incw	x
 861  000c bf07          	ldw	_key_press_counter,x
 862                     ; 189 	no_key_press_counter = 0;
 864  000e 5f            	clrw	x
 865  000f bf09          	ldw	_no_key_press_counter,x
 866                     ; 190     if (key_press_counter == KEY_LONG_CNT)          //é•¿æŒ‰
 868  0011 be07          	ldw	x,_key_press_counter
 869  0013 a3000a        	cpw	x,#10
 870  0016 2618          	jrne	L762
 871                     ; 192 		key_status = KEY_LONG;
 873  0018 35010006      	mov	_key_status,#1
 874                     ; 193 		if(IrKey_Value == KEY_IR_MODE)
 876  001c a1a2          	cp	a,#162
 877  001e 2607          	jrne	L172
 878                     ; 195 			flag_system_power = TRUE;
 880  0020 35010000      	mov	_flag_system_power,#1
 882  0024 cc00c5        	jra	L772
 883  0027               L172:
 884                     ; 197 		else if(IrKey_Value == KEY_IR_POWER)
 886  0027 a1a1          	cp	a,#161
 887  0029 26f9          	jrne	L772
 888                     ; 199 			flag_system_power = FALSE;
 890  002b 3f00          	clr	_flag_system_power
 891  002d cc00c5        	jra	L772
 892  0030               L762:
 893                     ; 214     else if (key_press_counter == (KEY_LONG_CNT + KEY_HOLD_CNT))        //è¿žæŒ‰
 895  0030 a3000d        	cpw	x,#13
 896  0033 2703cc00be    	jrne	L103
 897                     ; 216         key_status = KEY_HOLD;
 899  0038 35020006      	mov	_key_status,#2
 900                     ; 217         key_press_counter = KEY_LONG_CNT;
 902  003c ae000a        	ldw	x,#10
 903  003f bf07          	ldw	_key_press_counter,x
 904                     ; 218 		if(IrKey_Value == KEY_IR_DOWM)
 906  0041 a1a4          	cp	a,#164
 907  0043 2638          	jrne	L303
 908                     ; 220 			if(flag_mode_current == 0)
 910  0045 b600          	ld	a,_flag_mode_current
 911  0047 2604          	jrne	L503
 912                     ; 221 				cnt_vol_current--;
 914  0049 3a00          	dec	_cnt_vol_current
 916  004b 206c          	jra	L733
 917  004d               L503:
 918                     ; 222 			else if(flag_mode_current == 1)
 920  004d a101          	cp	a,#1
 921  004f 2604          	jrne	L113
 922                     ; 223 				cnt_time_shi_set1--;
 924  0051 3a00          	dec	_cnt_time_shi_set1
 926  0053 2064          	jra	L733
 927  0055               L113:
 928                     ; 224 			else if(flag_mode_current == 2)
 930  0055 a102          	cp	a,#2
 931  0057 2604          	jrne	L513
 932                     ; 225 				cnt_time_fen_set1--;
 934  0059 3a00          	dec	_cnt_time_fen_set1
 936  005b 205c          	jra	L733
 937  005d               L513:
 938                     ; 226 			else if(flag_mode_current == 3)
 940  005d a103          	cp	a,#3
 941  005f 2604          	jrne	L123
 942                     ; 227 				cnt_time_shi_set2--;
 944  0061 3a00          	dec	_cnt_time_shi_set2
 946  0063 2054          	jra	L733
 947  0065               L123:
 948                     ; 228 			else if(flag_mode_current == 4)
 950  0065 a104          	cp	a,#4
 951  0067 2604          	jrne	L523
 952                     ; 229 				cnt_time_fen_set2--;
 954  0069 3a00          	dec	_cnt_time_fen_set2
 956  006b 204c          	jra	L733
 957  006d               L523:
 958                     ; 230 			else if(flag_mode_current == 5)
 960  006d a105          	cp	a,#5
 961  006f 2604          	jrne	L133
 962                     ; 231 				cnt_time_shi_current--;
 964  0071 3a00          	dec	_cnt_time_shi_current
 966  0073 2044          	jra	L733
 967  0075               L133:
 968                     ; 232 			else if(flag_mode_current == 6)
 970  0075 a106          	cp	a,#6
 971  0077 2640          	jrne	L733
 972                     ; 233 				cnt_time_fen_current--;
 974  0079 3a00          	dec	_cnt_time_fen_current
 975  007b 203c          	jra	L733
 976  007d               L303:
 977                     ; 235 		else if(IrKey_Value == KEY_IR_UP)
 979  007d a1a8          	cp	a,#168
 980  007f 2638          	jrne	L733
 981                     ; 237 			if(flag_mode_current == 0)
 983  0081 b600          	ld	a,_flag_mode_current
 984  0083 2604          	jrne	L343
 985                     ; 238 				cnt_vol_current ++;
 987  0085 3c00          	inc	_cnt_vol_current
 989  0087 202e          	jra	L543
 990  0089               L343:
 991                     ; 239 			else if(flag_mode_current == 1)
 993  0089 a101          	cp	a,#1
 994  008b 2604          	jrne	L743
 995                     ; 240 				cnt_time_shi_set1++;
 997  008d 3c00          	inc	_cnt_time_shi_set1
 999  008f 2026          	jra	L543
1000  0091               L743:
1001                     ; 241 			else if(flag_mode_current == 2)
1003  0091 a102          	cp	a,#2
1004  0093 2604          	jrne	L353
1005                     ; 242 				cnt_time_fen_set1++;
1007  0095 3c00          	inc	_cnt_time_fen_set1
1009  0097 201e          	jra	L543
1010  0099               L353:
1011                     ; 243 			else if(flag_mode_current == 3)
1013  0099 a103          	cp	a,#3
1014  009b 2604          	jrne	L753
1015                     ; 244 				cnt_time_shi_set2++;
1017  009d 3c00          	inc	_cnt_time_shi_set2
1019  009f 2016          	jra	L543
1020  00a1               L753:
1021                     ; 245 			else if(flag_mode_current == 4)
1023  00a1 a104          	cp	a,#4
1024  00a3 2604          	jrne	L363
1025                     ; 246 				cnt_time_fen_set2++;
1027  00a5 3c00          	inc	_cnt_time_fen_set2
1029  00a7 200e          	jra	L543
1030  00a9               L363:
1031                     ; 247 			else if(flag_mode_current == 5)
1033  00a9 a105          	cp	a,#5
1034  00ab 2604          	jrne	L763
1035                     ; 248 				cnt_time_shi_current++;
1037  00ad 3c00          	inc	_cnt_time_shi_current
1039  00af 2006          	jra	L543
1040  00b1               L763:
1041                     ; 249 			else if(flag_mode_current == 6)
1043  00b1 a106          	cp	a,#6
1044  00b3 2602          	jrne	L543
1045                     ; 250 				cnt_time_fen_current++;
1047  00b5 3c00          	inc	_cnt_time_fen_current
1048  00b7               L543:
1049                     ; 251 			IrKey_Value = 0;
1051  00b7 3f05          	clr	_IrKey_Value
1052  00b9               L733:
1053                     ; 262 		time_process();						
1055  00b9 cd0000        	call	_time_process
1058  00bc 2007          	jra	L772
1059  00be               L103:
1060                     ; 264     else if(key_press_counter < KEY_LONG_CNT)
1062  00be a3000a        	cpw	x,#10
1063  00c1 2402          	jruge	L772
1064                     ; 266    		key_status = KEY_SHORT_UP;
1066  00c3 3f06          	clr	_key_status
1067                     ; 267         return;
1069  00c5               L772:
1070                     ; 270 } 
1073  00c5 85            	popw	x
1074  00c6 81            	ret	
1110                     ; 272 void Irkey_release()
1110                     ; 273 {
1111                     .text:	section	.text,new
1112  0000               _Irkey_release:
1116                     ; 274 	no_key_press_counter++;
1118  0000 be09          	ldw	x,_no_key_press_counter
1119  0002 5c            	incw	x
1120  0003 bf09          	ldw	_no_key_press_counter,x
1121                     ; 275 	if(no_key_press_counter == 500)
1123  0005 a301f4        	cpw	x,#500
1124  0008 2703cc00ba    	jrne	L324
1125                     ; 277 		no_key_press_counter = 0;
1127  000d 5f            	clrw	x
1128  000e bf09          	ldw	_no_key_press_counter,x
1129                     ; 278 		key_press_counter = 0;
1131  0010 bf07          	ldw	_key_press_counter,x
1132                     ; 279 		if((key_status == KEY_LONG)||(key_status == KEY_HOLD))
1134  0012 b606          	ld	a,_key_status
1135  0014 a101          	cp	a,#1
1136  0016 2704          	jreq	L724
1138  0018 a102          	cp	a,#2
1139  001a 2603          	jrne	L524
1140  001c               L724:
1141                     ; 281 			IrKey_Value = NO_KEY;
1143  001c 3f05          	clr	_IrKey_Value
1144                     ; 282 			return;
1147  001e 81            	ret	
1148  001f               L524:
1149                     ; 284 		switch(IrKey_Value)
1151  001f b605          	ld	a,_IrKey_Value
1153                     ; 332 				break;
1154  0021 a0a1          	sub	a,#161
1155  0023 2603cc00b5    	jreq	L704
1156  0028 4a            	dec	a
1157  0029 277c          	jreq	L504
1158  002b a002          	sub	a,#2
1159  002d 2706          	jreq	L104
1160  002f a004          	sub	a,#4
1161  0031 273c          	jreq	L304
1162                     ; 330 			default:
1162                     ; 331 				IrKey_Value = 0;
1163                     ; 332 				break;
1165  0033 207c          	jp	L125
1166  0035               L104:
1167                     ; 286 			case KEY_IR_DOWM:
1167                     ; 287 				IrKey_Value = 0;
1169  0035 b705          	ld	_IrKey_Value,a
1170                     ; 288 				if(flag_mode_current == 0)
1172  0037 b600          	ld	a,_flag_mode_current
1173  0039 2604          	jrne	L534
1174                     ; 289 					cnt_vol_current--;
1176  003b 3a00          	dec	_cnt_vol_current
1178  003d 2072          	jra	L125
1179  003f               L534:
1180                     ; 290 				else if(flag_mode_current == 1)
1182  003f a101          	cp	a,#1
1183  0041 2604          	jrne	L144
1184                     ; 291 					cnt_time_shi_set1--;
1186  0043 3a00          	dec	_cnt_time_shi_set1
1188  0045 206a          	jra	L125
1189  0047               L144:
1190                     ; 292 				else if(flag_mode_current == 2)
1192  0047 a102          	cp	a,#2
1193  0049 2604          	jrne	L544
1194                     ; 293 					cnt_time_fen_set1--;
1196  004b 3a00          	dec	_cnt_time_fen_set1
1198  004d 2062          	jra	L125
1199  004f               L544:
1200                     ; 294 				else if(flag_mode_current == 3)
1202  004f a103          	cp	a,#3
1203  0051 2604          	jrne	L154
1204                     ; 295 					cnt_time_shi_set2--;
1206  0053 3a00          	dec	_cnt_time_shi_set2
1208  0055 205a          	jra	L125
1209  0057               L154:
1210                     ; 296 				else if(flag_mode_current == 4)
1212  0057 a104          	cp	a,#4
1213  0059 2604          	jrne	L554
1214                     ; 297 					cnt_time_fen_set2--;
1216  005b 3a00          	dec	_cnt_time_fen_set2
1218  005d 2052          	jra	L125
1219  005f               L554:
1220                     ; 298 				else if(flag_mode_current == 5)
1222  005f a105          	cp	a,#5
1223  0061 2604          	jrne	L164
1224                     ; 299 					cnt_time_shi_current--;
1226  0063 3a00          	dec	_cnt_time_shi_current
1228  0065 204a          	jra	L125
1229  0067               L164:
1230                     ; 300 				else if(flag_mode_current == 6)
1232  0067 a106          	cp	a,#6
1233  0069 2646          	jrne	L125
1234                     ; 301 					cnt_time_fen_current--;
1236  006b 3a00          	dec	_cnt_time_fen_current
1237                     ; 302 				IrKey_Value =0;
1238                     ; 303 				break;
1240  006d 2042          	jp	L125
1241  006f               L304:
1242                     ; 304 			case KEY_IR_UP:
1242                     ; 305 				if(flag_mode_current == 0)
1244  006f b600          	ld	a,_flag_mode_current
1245  0071 2604          	jrne	L764
1246                     ; 306 					cnt_vol_current ++;
1248  0073 3c00          	inc	_cnt_vol_current
1250  0075 203a          	jra	L125
1251  0077               L764:
1252                     ; 307 				else if(flag_mode_current == 1)
1254  0077 a101          	cp	a,#1
1255  0079 2604          	jrne	L374
1256                     ; 308 					cnt_time_shi_set1++;
1258  007b 3c00          	inc	_cnt_time_shi_set1
1260  007d 2032          	jra	L125
1261  007f               L374:
1262                     ; 309 				else if(flag_mode_current == 2)
1264  007f a102          	cp	a,#2
1265  0081 2604          	jrne	L774
1266                     ; 310 					cnt_time_fen_set1++;
1268  0083 3c00          	inc	_cnt_time_fen_set1
1270  0085 202a          	jra	L125
1271  0087               L774:
1272                     ; 311 				else if(flag_mode_current == 3)
1274  0087 a103          	cp	a,#3
1275  0089 2604          	jrne	L305
1276                     ; 312 					cnt_time_shi_set2++;
1278  008b 3c00          	inc	_cnt_time_shi_set2
1280  008d 2022          	jra	L125
1281  008f               L305:
1282                     ; 313 				else if(flag_mode_current == 4)
1284  008f a104          	cp	a,#4
1285  0091 2604          	jrne	L705
1286                     ; 314 					cnt_time_fen_set2++;
1288  0093 3c00          	inc	_cnt_time_fen_set2
1290  0095 201a          	jra	L125
1291  0097               L705:
1292                     ; 315 				else if(flag_mode_current == 5)
1294  0097 a105          	cp	a,#5
1295  0099 2604          	jrne	L315
1296                     ; 316 					cnt_time_shi_current++;
1298  009b 3c00          	inc	_cnt_time_shi_current
1300  009d 2012          	jra	L125
1301  009f               L315:
1302                     ; 317 				else if(flag_mode_current == 6)
1304  009f a106          	cp	a,#6
1305  00a1 260e          	jrne	L125
1306                     ; 318 					cnt_time_fen_current++;
1308  00a3 3c00          	inc	_cnt_time_fen_current
1309                     ; 319 				IrKey_Value = 0;
1310                     ; 320 				break;
1312  00a5 200a          	jp	L125
1313  00a7               L504:
1314                     ; 321 			case KEY_IR_MODE:
1314                     ; 322 				flag_mode_current++;
1316  00a7 3c00          	inc	_flag_mode_current
1317                     ; 323 				if(flag_mode_current == 7)
1319  00a9 b600          	ld	a,_flag_mode_current
1320  00ab a107          	cp	a,#7
1321  00ad 2602          	jrne	L125
1322                     ; 324 					flag_mode_current = 0;
1324  00af 3f00          	clr	_flag_mode_current
1325  00b1               L125:
1326                     ; 325 				IrKey_Value = 0;
1331  00b1 3f05          	clr	_IrKey_Value
1332                     ; 326 				break;
1334  00b3 2002          	jra	L334
1335  00b5               L704:
1336                     ; 327 			case KEY_IR_POWER:
1336                     ; 328 				IrKey_Value = 0;
1338  00b5 b705          	ld	_IrKey_Value,a
1339                     ; 329 				break;
1341  00b7               L334:
1342                     ; 336 		time_process();
1344  00b7 cd0000        	call	_time_process
1346  00ba               L324:
1347                     ; 339 }
1350  00ba 81            	ret	
1379                     ; 341 void time_process()
1379                     ; 342 {
1380                     .text:	section	.text,new
1381  0000               _time_process:
1385                     ; 343 	if(cnt_time_shi_set1 == 26)
1387  0000 b600          	ld	a,_cnt_time_shi_set1
1388  0002 a11a          	cp	a,#26
1389  0004 2602          	jrne	L335
1390                     ; 344 		cnt_time_shi_set1 = 0;
1392  0006 3f00          	clr	_cnt_time_shi_set1
1393  0008               L335:
1394                     ; 345 	if(cnt_time_shi_set2 == 26)
1396  0008 b600          	ld	a,_cnt_time_shi_set2
1397  000a a11a          	cp	a,#26
1398  000c 2602          	jrne	L535
1399                     ; 346 		cnt_time_shi_set2 = 0;
1401  000e 3f00          	clr	_cnt_time_shi_set2
1402  0010               L535:
1403                     ; 347 	if(cnt_time_shi_current == 25)
1405  0010 b600          	ld	a,_cnt_time_shi_current
1406  0012 a119          	cp	a,#25
1407  0014 2602          	jrne	L735
1408                     ; 348 		cnt_time_shi_current = 0;
1410  0016 3f00          	clr	_cnt_time_shi_current
1411  0018               L735:
1412                     ; 350 	if(cnt_time_fen_set1 == 61)
1414  0018 b600          	ld	a,_cnt_time_fen_set1
1415  001a a13d          	cp	a,#61
1416  001c 2602          	jrne	L145
1417                     ; 351 		cnt_time_fen_set1 = 0;
1419  001e 3f00          	clr	_cnt_time_fen_set1
1420  0020               L145:
1421                     ; 352 	if(cnt_time_fen_set2 == 61)
1423  0020 b600          	ld	a,_cnt_time_fen_set2
1424  0022 a13d          	cp	a,#61
1425  0024 2602          	jrne	L345
1426                     ; 353 		cnt_time_fen_set2 = 0;
1428  0026 3f00          	clr	_cnt_time_fen_set2
1429  0028               L345:
1430                     ; 354 	if(cnt_time_shi_current == 61)
1432  0028 b600          	ld	a,_cnt_time_shi_current
1433  002a a13d          	cp	a,#61
1434  002c 2602          	jrne	L545
1435                     ; 355 		cnt_time_fen_current = 0;
1437  002e 3f00          	clr	_cnt_time_fen_current
1438  0030               L545:
1439                     ; 357 	if(cnt_time_shi_set1 == 255)
1441  0030 b600          	ld	a,_cnt_time_shi_set1
1442  0032 4c            	inc	a
1443  0033 2604          	jrne	L745
1444                     ; 358 		cnt_time_shi_set1 = 25;
1446  0035 35190000      	mov	_cnt_time_shi_set1,#25
1447  0039               L745:
1448                     ; 359 	if(cnt_time_shi_set2 == 255)
1450  0039 b600          	ld	a,_cnt_time_shi_set2
1451  003b 4c            	inc	a
1452  003c 2604          	jrne	L155
1453                     ; 360 		cnt_time_shi_set2 = 25;
1455  003e 35190000      	mov	_cnt_time_shi_set2,#25
1456  0042               L155:
1457                     ; 361 	if(cnt_time_shi_current == 255)
1459  0042 b600          	ld	a,_cnt_time_shi_current
1460  0044 4c            	inc	a
1461  0045 2604          	jrne	L355
1462                     ; 362 		cnt_time_shi_current = 24;
1464  0047 35180000      	mov	_cnt_time_shi_current,#24
1465  004b               L355:
1466                     ; 364 	if(cnt_time_fen_set1 == 255)
1468  004b b600          	ld	a,_cnt_time_fen_set1
1469  004d 4c            	inc	a
1470  004e 2604          	jrne	L555
1471                     ; 365 		cnt_time_fen_set1 = 60;
1473  0050 353c0000      	mov	_cnt_time_fen_set1,#60
1474  0054               L555:
1475                     ; 366 	if(cnt_time_fen_set2 == 255)
1477  0054 b600          	ld	a,_cnt_time_fen_set2
1478  0056 4c            	inc	a
1479  0057 2604          	jrne	L755
1480                     ; 367 		cnt_time_fen_set2 = 60;
1482  0059 353c0000      	mov	_cnt_time_fen_set2,#60
1483  005d               L755:
1484                     ; 368 	if(cnt_time_shi_current == 255)
1486  005d b600          	ld	a,_cnt_time_shi_current
1487  005f 4c            	inc	a
1488  0060 2604          	jrne	L165
1489                     ; 369 		cnt_time_fen_current = 60;	
1491  0062 353c0000      	mov	_cnt_time_fen_current,#60
1492  0066               L165:
1493                     ; 371 }
1496  0066 81            	ret	
1567                     	xref.b	_cnt_vol_current
1568                     	xref.b	_cnt_time_shi_set2
1569                     	xref.b	_cnt_time_fen_set2
1570                     	xref.b	_cnt_time_shi_set1
1571                     	xref.b	_cnt_time_fen_set1
1572                     	xref.b	_cnt_time_shi_current
1573                     	xref.b	_cnt_time_fen_current
1574                     	xref.b	_flag_mode_current
1575                     	xref.b	_flag_system_power
1576                     	xdef	_no_key_press_counter
1577                     	xdef	_key_press_counter
1578                     	xdef	_key_status
1579                     	xdef	_IrKey_Value
1580                     	xdef	_time_process
1581                     	xdef	_Irkey_release
1582                     	xdef	_IrKey_Scan
1583                     	xdef	_Init_TIM2
1584                     	xdef	_Receive_IR_Dat
1585                     	xdef	_LowPulseWidth
1586                     	xdef	_HighPulseWidth
1587                     	xdef	_IR_data
1588                     	xdef	_flag_IR_read_over
1589                     	xref	_TIM2_GetCounter
1590                     	xref	_TIM2_SetCounter
1591                     	xref	_TIM2_Cmd
1592                     	xref	_TIM2_TimeBaseInit
1593                     	xref	_TIM2_DeInit
1594                     	xref	_GPIO_ReadInputPin
1613                     	xref	c_lzmp
1614                     	xref	c_lgsbc
1615                     	xref	c_lcmp
1616                     	xref	c_ltor
1617                     	xref	c_rtol
1618                     	xref	c_uitolx
1619                     	end
