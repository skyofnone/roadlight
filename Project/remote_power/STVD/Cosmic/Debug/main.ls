   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  21                     	bsct
  22  0000               _Cnt_system_ms:
  23  0000 0000          	dc.w	0
  24  0002               _cnt_time_fen_current:
  25  0002 00            	dc.b	0
  26  0003               _cnt_time_shi_current:
  27  0003 00            	dc.b	0
  28  0004               _cnt_time_fen_set1:
  29  0004 00            	dc.b	0
  30  0005               _cnt_time_shi_set1:
  31  0005 00            	dc.b	0
  32  0006               _cnt_time_fen_set2:
  33  0006 00            	dc.b	0
  34  0007               _cnt_time_shi_set2:
  35  0007 00            	dc.b	0
  36  0008               _cnt_vol_current:
  37  0008 00            	dc.b	0
  38  0009               _cnt_elex_current:
  39  0009 0000          	dc.w	0
  40  000b               _ucDeftime:
  41  000b 01            	dc.b	1
  42  000c 01            	dc.b	1
  43  000d 01            	dc.b	1
  44  000e 01            	dc.b	1
  45  000f 01            	dc.b	1
  46  0010 01            	dc.b	1
  47  0011 12            	dc.b	18
  48  0012               _flag_mode_current:
  49  0012 00            	dc.b	0
  50  0013               _flag_system_power:
  51  0013 00            	dc.b	0
  52  0014               _flag_pwm_out:
  53  0014 01            	dc.b	1
  54  0015               _flag_motor_feedback_port:
  55  0015 00            	dc.b	0
  84                     ; 107 void TIMER1_Init(void)
  84                     ; 108 {
  86                     .text:	section	.text,new
  87  0000               _TIMER1_Init:
  91                     ; 109 	TIM1->EGR=0x01;//初始化TIM1 TIM1时基初始化
  93  0000 35015257      	mov	21079,#1
  94                     ; 110 	TIM1->EGR|=0x20;//重新初始化TIM1
  96  0004 721a5257      	bset	21079,#5
  97                     ; 111 	TIM1->PSCRH=0; //预分频 设置PWM频率
  99  0008 725f5260      	clr	21088
 100                     ; 112 	TIM1->PSCRL=0;
 102  000c 725f5261      	clr	21089
 103                     ; 113 	TIM1->ARRH=0x02; //设定重装载值
 105  0010 35025262      	mov	21090,#2
 106                     ; 114 	TIM1->ARRL=0x9F;
 108  0014 359f5263      	mov	21091,#159
 109                     ; 115 	TIM1->CR1=0x80;//边沿对齐,向上计数,带缓冲
 111  0018 35805250      	mov	21072,#128
 112                     ; 116 	TIM1->RCR=0x01;//重复计数器
 114  001c 35015264      	mov	21092,#1
 115                     ; 117 	TIM1->CCMR4=0x68;//PWM模式1 通道2PWM输出
 117  0020 3568525b      	mov	21083,#104
 118                     ; 118 	TIM1->CCER2=0x10;//高电平有效，开启输出
 120  0024 3510525d      	mov	21085,#16
 121                     ; 119 	TIM1->CCR4H=0;//设置占空比
 123  0028 725f526b      	clr	21099
 124                     ; 120 	TIM1->CCR4L=0X03;
 126  002c 3503526c      	mov	21100,#3
 127                     ; 122 	TIM1->BKR=0x80;//主使能
 129  0030 3580526d      	mov	21101,#128
 130                     ; 123 	TIM1->CR1|=0x01;//计数使能
 132  0034 72105250      	bset	21072,#0
 133                     ; 126 }
 136  0038 81            	ret	
 161                     ; 127 void GPIO_InitRemoterPower()
 161                     ; 128 {
 162                     .text:	section	.text,new
 163  0000               _GPIO_InitRemoterPower:
 167                     ; 129 	GPIO_Init(LED_GPIOC_PORT, (GPIO_Pin_TypeDef)LED_GPIOC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
 169  0000 4be0          	push	#224
 170  0002 4bfe          	push	#254
 171  0004 ae500a        	ldw	x,#20490
 172  0007 cd0000        	call	_GPIO_Init
 174  000a 85            	popw	x
 175                     ; 130 	GPIO_Init(LED_GPIOD_PORT, (GPIO_Pin_TypeDef)LED_GPIOD_PINS, GPIO_MODE_OUT_PP_LOW_FAST); //LED 初始化
 177  000b 4be0          	push	#224
 178  000d 4bed          	push	#237
 179  000f ae500f        	ldw	x,#20495
 180  0012 cd0000        	call	_GPIO_Init
 182  0015 85            	popw	x
 183                     ; 131 	GPIO_Init(RTC_GPIOB_PORT, (GPIO_Pin_TypeDef)RTC_GPIOB_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
 185  0016 4be0          	push	#224
 186  0018 4b50          	push	#80
 187  001a ae5005        	ldw	x,#20485
 188  001d cd0000        	call	_GPIO_Init
 190  0020 85            	popw	x
 191                     ; 132 	GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
 193  0021 4ba0          	push	#160
 194  0023 4b20          	push	#32
 195  0025 ae5005        	ldw	x,#20485
 196  0028 cd0000        	call	_GPIO_Init
 198  002b 85            	popw	x
 199                     ; 133 	GPIO_Init(IrInPort, IrInPin, GPIO_MODE_IN_PU_NO_IT);
 201  002c 4b40          	push	#64
 202  002e 4b20          	push	#32
 203  0030 ae500a        	ldw	x,#20490
 204  0033 cd0000        	call	_GPIO_Init
 206  0036 85            	popw	x
 207                     ; 134 	GPIO_Init(DATAOUT_GPIOB_PORT, DATAOUT_GPIOB_PIN, GPIO_MODE_OUT_PP_LOW_FAST); //数据输出初始化
 209  0037 4be0          	push	#224
 210  0039 4b01          	push	#1
 211  003b ae5005        	ldw	x,#20485
 212  003e cd0000        	call	_GPIO_Init
 214  0041 85            	popw	x
 215                     ; 135 }
 218  0042 81            	ret	
 243                     ; 138 void spi_gpio_init(void)
 243                     ; 139  {
 244                     .text:	section	.text,new
 245  0000               _spi_gpio_init:
 249                     ; 140 	 GPIO_DeInit(GPIOC);
 251  0000 ae500a        	ldw	x,#20490
 252  0003 cd0000        	call	_GPIO_DeInit
 254                     ; 141 	 GPIO_Init(GPIOC,GPIO_PIN_5|GPIO_PIN_6,GPIO_MODE_OUT_PP_LOW_FAST);
 256  0006 4be0          	push	#224
 257  0008 4b60          	push	#96
 258  000a ae500a        	ldw	x,#20490
 259  000d cd0000        	call	_GPIO_Init
 261  0010 85            	popw	x
 262                     ; 142 	 GPIO_DeInit(GPIOE);
 264  0011 ae5014        	ldw	x,#20500
 265  0014 cd0000        	call	_GPIO_DeInit
 267                     ; 143 	 GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST);
 269  0017 4be0          	push	#224
 270  0019 4b20          	push	#32
 271  001b ae5014        	ldw	x,#20500
 272  001e cd0000        	call	_GPIO_Init
 274  0021 85            	popw	x
 275                     ; 144  }
 278  0022 81            	ret	
 335                     ; 146 void main(void)
 335                     ; 147 {	
 336                     .text:	section	.text,new
 337  0000               _main:
 339  0000 5204          	subw	sp,#4
 340       00000004      OFST:	set	4
 343                     ; 149 	uint16_t temp = 0;
 345  0002 5f            	clrw	x
 346  0003 1f01          	ldw	(OFST-3,sp),x
 347                     ; 150 	CLK_HSIPrescalerConfig(CLK_PRESCALER_CPUDIV16);//设置为内部高速时钟
 349  0005 a684          	ld	a,#132
 350  0007 cd0000        	call	_CLK_HSIPrescalerConfig
 352                     ; 151 	GPIO_InitRemoterPower();
 354  000a cd0000        	call	_GPIO_InitRemoterPower
 356                     ; 152 	ucCurtime = ucDeftime;
 358  000d ae000b        	ldw	x,#_ucDeftime
 359  0010 1f03          	ldw	(OFST-1,sp),x
 360                     ; 153 	HT1380SetTime(ucCurtime);
 362  0012 cd0000        	call	_HT1380SetTime
 364                     ; 154 	Init_TIM2();
 366  0015 cd0000        	call	_Init_TIM2
 368                     ; 155 	TIMER1_Init(); //PWM输出
 370  0018 cd0000        	call	_TIMER1_Init
 372                     ; 156 	enableInterrupts();
 375  001b 9a            	rim	
 377  001c               L36:
 378                     ; 176 		Cnt_system_ms++;
 380  001c be00          	ldw	x,_Cnt_system_ms
 381  001e 5c            	incw	x
 382  001f bf00          	ldw	_Cnt_system_ms,x
 383                     ; 177 		System_Process_10uS();
 385  0021 cd0000        	call	_System_Process_10uS
 387                     ; 178 		System_Process_40uS();
 389  0024 cd0000        	call	_System_Process_40uS
 391                     ; 179 		System_Process_10MS();			
 393  0027 cd0000        	call	_System_Process_10MS
 395                     ; 180 		if(flag_system_power == TRUE)
 397  002a b613          	ld	a,_flag_system_power
 398  002c 4a            	dec	a
 399  002d 2605          	jrne	L76
 400                     ; 182 			Display_all_led();
 402  002f cd0000        	call	_Display_all_led
 405  0032 20e8          	jra	L36
 406  0034               L76:
 407                     ; 186 			SHOW_LED_BLACK;
 409  0034 7217500f      	bres	20495,#3
 412  0038 7211500f      	bres	20495,#0
 415  003c 7215500a      	bres	20490,#2
 418  0040 721d500a      	bres	20490,#6
 421  0044 721f500a      	bres	20490,#7
 424  0048 7215500f      	bres	20495,#2
 427  004c 7213500a      	bres	20490,#1
 430  0050 721b500a      	bres	20490,#5
 431  0054 20c6          	jra	L36
 477                     ; 198 void Delay (uint16_t nCount)
 477                     ; 199 {
 478                     .text:	section	.text,new
 479  0000               _Delay:
 481  0000 89            	pushw	x
 482  0001 89            	pushw	x
 483       00000002      OFST:	set	2
 486                     ; 201 	for(i= 0;i<nCount;i++)
 488  0002 5f            	clrw	x
 490  0003 2004          	jra	L121
 491  0005               L511:
 492                     ; 203 		nop();
 495  0005 9d            	nop	
 497                     ; 204 		nop();
 501  0006 9d            	nop	
 503                     ; 205 		nop();
 507  0007 9d            	nop	
 509                     ; 201 	for(i= 0;i<nCount;i++)
 512  0008 5c            	incw	x
 513  0009               L121:
 514  0009 1f01          	ldw	(OFST-1,sp),x
 517  000b 1303          	cpw	x,(OFST+1,sp)
 518  000d 25f6          	jrult	L511
 519                     ; 207 }
 522  000f 5b04          	addw	sp,#4
 523  0011 81            	ret	
 526                     	bsct
 527  0016               L521_t:
 528  0016 0000          	dc.w	0
 529  0018               L721_i:
 530  0018 0000          	dc.w	0
 531  001a               L131_Cnt_last10:
 532  001a 0000          	dc.w	0
 615                     ; 209 void System_Process_10MS()
 615                     ; 210 {	
 616                     .text:	section	.text,new
 617  0000               _System_Process_10MS:
 619  0000 5204          	subw	sp,#4
 620       00000004      OFST:	set	4
 623                     ; 213 	u16 k = 0;
 625  0002 5f            	clrw	x
 626  0003 1f01          	ldw	(OFST-3,sp),x
 627                     ; 222 	ucCurtime = ucDeftime;
 629  0005 ae000b        	ldw	x,#_ucDeftime
 630  0008 1f03          	ldw	(OFST-1,sp),x
 631                     ; 223 	if (Cnt_system_ms >= t)
 633  000a be00          	ldw	x,_Cnt_system_ms
 634  000c b316          	cpw	x,L521_t
 635  000e 2506          	jrult	L171
 636                     ; 225 		k = Cnt_system_ms -t;
 638  0010 72b00016      	subw	x,L521_t
 640  0014 200f          	jp	LC001
 641  0016               L171:
 642                     ; 227 	else if(Cnt_system_ms < t)
 644  0016 b316          	cpw	x,L521_t
 645  0018 240d          	jruge	L371
 646                     ; 229 		k = Cnt_system_ms + (0xffff - t);
 648  001a aeffff        	ldw	x,#65535
 649  001d 72b00016      	subw	x,L521_t
 650  0021 72bb0000      	addw	x,_Cnt_system_ms
 651  0025               LC001:
 652  0025 1f01          	ldw	(OFST-3,sp),x
 653  0027               L371:
 654                     ; 231 	if (k > 1000)
 656  0027 1e01          	ldw	x,(OFST-3,sp)
 657  0029 a303e9        	cpw	x,#1001
 658  002c 254c          	jrult	L112
 659                     ; 233 		k = 0;
 661                     ; 234 		t = Cnt_system_ms;
 663  002e be00          	ldw	x,_Cnt_system_ms
 664  0030 bf16          	ldw	L521_t,x
 665                     ; 235 		if((flag_mode_current == 5)||(flag_mode_current == 6))
 667  0032 b612          	ld	a,_flag_mode_current
 668  0034 a105          	cp	a,#5
 669  0036 2704          	jreq	L302
 671  0038 a106          	cp	a,#6
 672  003a 2629          	jrne	L102
 673  003c               L302:
 674                     ; 237 			ucCurtime[1] = cnt_time_fen_current;
 676  003c 1e03          	ldw	x,(OFST-1,sp)
 677  003e b602          	ld	a,_cnt_time_fen_current
 678  0040 e701          	ld	(1,x),a
 679                     ; 238 			ucCurtime[2] = cnt_time_shi_current;
 681  0042 b603          	ld	a,_cnt_time_shi_current
 682  0044 e702          	ld	(2,x),a
 683                     ; 239 			HT1380SetTime(ucCurtime);
 685  0046 cd0000        	call	_HT1380SetTime
 688  0049               L502:
 689                     ; 243 		cnt_time_shi_current = ucCurtime[2];
 691  0049 1e03          	ldw	x,(OFST-1,sp)
 692  004b e602          	ld	a,(2,x)
 693  004d b703          	ld	_cnt_time_shi_current,a
 694                     ; 244 		cnt_time_fen_current = ucCurtime[1];
 696  004f e601          	ld	a,(1,x)
 697  0051 b702          	ld	_cnt_time_fen_current,a
 698                     ; 245 		if((cnt_time_shi_current == cnt_time_shi_set1)&&(cnt_time_fen_current == cnt_time_fen_set1))
 700  0053 b603          	ld	a,_cnt_time_shi_current
 701  0055 b105          	cp	a,_cnt_time_shi_set1
 702  0057 2613          	jrne	L702
 704  0059 b602          	ld	a,_cnt_time_fen_current
 705  005b b104          	cp	a,_cnt_time_fen_set1
 706  005d 260d          	jrne	L702
 707                     ; 247 			flag_pwm_out = TRUE;
 709  005f 35010014      	mov	_flag_pwm_out,#1
 710  0063 2007          	jra	L702
 711  0065               L102:
 712                     ; 242 			HT1380ReadTime(ucCurtime);
 714  0065 1e03          	ldw	x,(OFST-1,sp)
 715  0067 cd0000        	call	_HT1380ReadTime
 717  006a 20dd          	jra	L502
 718  006c               L702:
 719                     ; 250 		if((cnt_time_shi_current == cnt_time_shi_set2)&&(cnt_time_fen_current == cnt_time_fen_set2))
 721  006c b603          	ld	a,_cnt_time_shi_current
 722  006e b107          	cp	a,_cnt_time_shi_set2
 723  0070 2608          	jrne	L112
 725  0072 b602          	ld	a,_cnt_time_fen_current
 726  0074 b106          	cp	a,_cnt_time_fen_set2
 727  0076 2602          	jrne	L112
 728                     ; 252 			flag_pwm_out = FALSE;
 730  0078 3f14          	clr	_flag_pwm_out
 731  007a               L112:
 732                     ; 255 		if((flag_system_power == TRUE)&&(flag_pwm_out == TRUE))
 736                     ; 268 }
 739  007a 5b04          	addw	sp,#4
 740  007c 81            	ret	
 743                     	bsct
 744  001c               L712_t:
 745  001c 0000          	dc.w	0
 746  001e               L122_i:
 747  001e 0000          	dc.w	0
 748  0020               L322_Cnt_last10:
 749  0020 0000          	dc.w	0
 833                     ; 270 void System_Process_40uS()
 833                     ; 271 {	
 834                     .text:	section	.text,new
 835  0000               _System_Process_40uS:
 837  0000 5204          	subw	sp,#4
 838       00000004      OFST:	set	4
 841                     ; 274 	u16 k = 0;
 843  0002 5f            	clrw	x
 844  0003 1f03          	ldw	(OFST-1,sp),x
 845                     ; 277 	uint8_t volt1 = 0;
 847  0005 0f01          	clr	(OFST-3,sp)
 848                     ; 278 	uint8_t volt3 = 0;
 850                     ; 285 	if (Cnt_system_ms >= t)
 852  0007 be00          	ldw	x,_Cnt_system_ms
 853  0009 b31c          	cpw	x,L712_t
 854  000b 2506          	jrult	L762
 855                     ; 287 		k = Cnt_system_ms -t;
 857  000d 72b0001c      	subw	x,L712_t
 859  0011 200f          	jp	LC002
 860  0013               L762:
 861                     ; 289 	else if(Cnt_system_ms < t)
 863  0013 b31c          	cpw	x,L712_t
 864  0015 240d          	jruge	L172
 865                     ; 291 		k = Cnt_system_ms + (0xffff - t);
 867  0017 aeffff        	ldw	x,#65535
 868  001a 72b0001c      	subw	x,L712_t
 869  001e 72bb0000      	addw	x,_Cnt_system_ms
 870  0022               LC002:
 871  0022 1f03          	ldw	(OFST-1,sp),x
 872  0024               L172:
 873                     ; 293 	if (k >4)
 875  0024 1e03          	ldw	x,(OFST-1,sp)
 876  0026 a30005        	cpw	x,#5
 877  0029 2512          	jrult	L572
 878                     ; 296 		k = 0;
 880                     ; 297 		t = Cnt_system_ms;
 882  002b be00          	ldw	x,_Cnt_system_ms
 883  002d bf1c          	ldw	L712_t,x
 884                     ; 298 			Init_ADC1();
 886  002f cd0000        	call	_Init_ADC1
 888                     ; 299 		cnt_elex_current = Get_Ad1();
 890  0032 cd0000        	call	_Get_Ad1
 892  0035 bf09          	ldw	_cnt_elex_current,x
 893                     ; 300 			Init_ADC3();
 895  0037 cd0000        	call	_Init_ADC3
 897                     ; 301 		volt3 = Get_Ad3();
 899  003a cd0000        	call	_Get_Ad3
 901  003d               L572:
 902                     ; 305 }
 905  003d 5b04          	addw	sp,#4
 906  003f 81            	ret	
 909                     	bsct
 910  0022               L772_t:
 911  0022 0000          	dc.w	0
 912  0024               L103_i:
 913  0024 0000          	dc.w	0
 914  0026               L303_Cnt_last10:
 915  0026 0000          	dc.w	0
 979                     ; 307 void System_Process_10uS()
 979                     ; 308 {	
 980                     .text:	section	.text,new
 981  0000               _System_Process_10uS:
 983  0000 89            	pushw	x
 984       00000002      OFST:	set	2
 987                     ; 311 	u16 k = 0;
 989  0001 5f            	clrw	x
 990  0002 1f01          	ldw	(OFST-1,sp),x
 991                     ; 320 	if (Cnt_system_ms >= t)
 993  0004 be00          	ldw	x,_Cnt_system_ms
 994  0006 b322          	cpw	x,L772_t
 995  0008 2506          	jrult	L733
 996                     ; 322 		k = Cnt_system_ms -t;
 998  000a 72b00022      	subw	x,L772_t
1000  000e 200f          	jp	LC003
1001  0010               L733:
1002                     ; 324 	else if(Cnt_system_ms < t)
1004  0010 b322          	cpw	x,L772_t
1005  0012 240d          	jruge	L143
1006                     ; 326 		k = Cnt_system_ms + (0xffff - t);
1008  0014 aeffff        	ldw	x,#65535
1009  0017 72b00022      	subw	x,L772_t
1010  001b 72bb0000      	addw	x,_Cnt_system_ms
1011  001f               LC003:
1012  001f 1f01          	ldw	(OFST-1,sp),x
1013  0021               L143:
1014                     ; 328 	if (k >1)
1016  0021 1e01          	ldw	x,(OFST-1,sp)
1017  0023 a30002        	cpw	x,#2
1018  0026 2512          	jrult	L543
1019                     ; 331 		k = 0;
1021                     ; 332 		t = Cnt_system_ms;
1023  0028 be00          	ldw	x,_Cnt_system_ms
1024  002a bf22          	ldw	L772_t,x
1025                     ; 333 		if(Receive_IR_Dat())
1027  002c cd0000        	call	_Receive_IR_Dat
1029  002f 4d            	tnz	a
1030  0030 2705          	jreq	L743
1031                     ; 334 			IrKey_Scan();
1033  0032 cd0000        	call	_IrKey_Scan
1036  0035 2003          	jra	L543
1037  0037               L743:
1038                     ; 336 			Irkey_release();
1040  0037 cd0000        	call	_Irkey_release
1042  003a               L543:
1043                     ; 340 }
1046  003a 85            	popw	x
1047  003b 81            	ret	
1079                     ; 344 void Display_all_led()
1079                     ; 345 {
1080                     .text:	section	.text,new
1081  0000               _Display_all_led:
1085                     ; 347 	switch(flag_mode_current&0x0F)	  //0--电压 1--定时1时 2--定时1分 3--定时2时 4--定时2分 5--校时时 6--校时分
1087  0000 b612          	ld	a,_flag_mode_current
1088  0002 a40f          	and	a,#15
1090                     ; 371 		default:
1090                     ; 372 			break;
1091  0004 2713          	jreq	L353
1092  0006 4a            	dec	a
1093  0007 2719          	jreq	L553
1094  0009 4a            	dec	a
1095  000a 271f          	jreq	L753
1096  000c 4a            	dec	a
1097  000d 2725          	jreq	L163
1098  000f 4a            	dec	a
1099  0010 272b          	jreq	L363
1100  0012 4a            	dec	a
1101  0013 2731          	jreq	L563
1102  0015 4a            	dec	a
1103  0016 2737          	jreq	L763
1105  0018 81            	ret	
1106  0019               L353:
1107                     ; 349 		case 0x00:
1107                     ; 350 			Display_Digital_Led(cnt_vol_current+1000);
1109  0019 b608          	ld	a,_cnt_vol_current
1110  001b 5f            	clrw	x
1111  001c 97            	ld	xl,a
1112  001d 1c03e8        	addw	x,#1000
1114                     ; 351 			break;
1116  0020 2034          	jp	LC004
1117  0022               L553:
1118                     ; 352 		case 0x01:
1118                     ; 353 			Display_Digital_Led(cnt_time_shi_set1+100);
1120  0022 b605          	ld	a,_cnt_time_shi_set1
1121  0024 5f            	clrw	x
1122  0025 97            	ld	xl,a
1123  0026 1c0064        	addw	x,#100
1125                     ; 354 			break;
1127  0029 202b          	jp	LC004
1128  002b               L753:
1129                     ; 355 		case 0x02:
1129                     ; 356 			Display_Digital_Led(cnt_time_fen_set1+200);
1131  002b b604          	ld	a,_cnt_time_fen_set1
1132  002d 5f            	clrw	x
1133  002e 97            	ld	xl,a
1134  002f 1c00c8        	addw	x,#200
1136                     ; 357 			break;
1138  0032 2022          	jp	LC004
1139  0034               L163:
1140                     ; 358 		case 0x03:
1140                     ; 359 			Display_Digital_Led(cnt_time_shi_set2+300);
1142  0034 b607          	ld	a,_cnt_time_shi_set2
1143  0036 5f            	clrw	x
1144  0037 97            	ld	xl,a
1145  0038 1c012c        	addw	x,#300
1147                     ; 360 			break;
1149  003b 2019          	jp	LC004
1150  003d               L363:
1151                     ; 361 		case 0x04:
1151                     ; 362 			Display_Digital_Led(cnt_time_fen_set2+400);
1153  003d b606          	ld	a,_cnt_time_fen_set2
1154  003f 5f            	clrw	x
1155  0040 97            	ld	xl,a
1156  0041 1c0190        	addw	x,#400
1158                     ; 363 			break;
1160  0044 2010          	jp	LC004
1161  0046               L563:
1162                     ; 364 		case 0x05:
1162                     ; 365 			Display_Digital_Led(cnt_time_shi_current+500);
1164  0046 b603          	ld	a,_cnt_time_shi_current
1165  0048 5f            	clrw	x
1166  0049 97            	ld	xl,a
1167  004a 1c01f4        	addw	x,#500
1169                     ; 366 			break;
1171  004d 2007          	jp	LC004
1172  004f               L763:
1173                     ; 367 		case 0x06:
1173                     ; 368 			Display_Digital_Led(cnt_time_fen_current+600);
1175  004f b602          	ld	a,_cnt_time_fen_current
1176  0051 5f            	clrw	x
1177  0052 97            	ld	xl,a
1178  0053 1c0258        	addw	x,#600
1179  0056               LC004:
1181                     ; 369 			break;
1183                     ; 371 		default:
1183                     ; 372 			break;
1185                     ; 374 }
1188  0056 cc0000        	jp	_Display_Digital_Led
1242                     ; 461 void Display_Digital_Led(u16 cnt_receive)
1242                     ; 462 {
1243                     .text:	section	.text,new
1244  0000               _Display_Digital_Led:
1246  0000 89            	pushw	x
1247  0001 89            	pushw	x
1248       00000002      OFST:	set	2
1251                     ; 463 	uint8_t temp=0;
1253                     ; 464 	uint8_t i=0;
1255                     ; 465 	DATA_OUT_1;
1257  0002 72105005      	bset	20485,#0
1258                     ; 466 	Delay(200);
1260  0006 ae00c8        	ldw	x,#200
1261  0009 cd0000        	call	_Delay
1263                     ; 467 	DATA_OUT_0;
1265  000c 72115005      	bres	20485,#0
1266                     ; 468 	for(i=0;i<16;i++)
1268  0010 0f02          	clr	(OFST+0,sp)
1269  0012               L534:
1270                     ; 470 		temp = cnt_receive && 0x01;   
1272  0012 1e03          	ldw	x,(OFST+1,sp)
1273  0014 2704          	jreq	L041
1274  0016 a601          	ld	a,#1
1275  0018 2001          	jra	L241
1276  001a               L041:
1277  001a 4f            	clr	a
1278  001b               L241:
1279  001b 6b01          	ld	(OFST-1,sp),a
1280                     ; 471     	cnt_receive <<= 1;  // 
1282  001d 0804          	sll	(OFST+2,sp)
1283  001f 0903          	rlc	(OFST+1,sp)
1284                     ; 472 		if(temp == 0x01)
1286  0021 4a            	dec	a
1287  0022 2613          	jrne	L344
1288                     ; 474 			DATA_OUT_1;
1290  0024 72105005      	bset	20485,#0
1291                     ; 475 			Delay(50);
1293  0028 ae0032        	ldw	x,#50
1294  002b cd0000        	call	_Delay
1296                     ; 476 			DATA_OUT_0;
1298  002e 72115005      	bres	20485,#0
1299                     ; 477 			Delay(10);
1301  0032 ae000a        	ldw	x,#10
1304  0035 2011          	jra	L544
1305  0037               L344:
1306                     ; 481 			DATA_OUT_1;
1308  0037 72105005      	bset	20485,#0
1309                     ; 482 			Delay(10);
1311  003b ae000a        	ldw	x,#10
1312  003e cd0000        	call	_Delay
1314                     ; 483 			DATA_OUT_0;
1316  0041 72115005      	bres	20485,#0
1317                     ; 484 			Delay(50);
1319  0045 ae0032        	ldw	x,#50
1321  0048               L544:
1322  0048 cd0000        	call	_Delay
1323                     ; 468 	for(i=0;i<16;i++)
1325  004b 0c02          	inc	(OFST+0,sp)
1328  004d 7b02          	ld	a,(OFST+0,sp)
1329  004f a110          	cp	a,#16
1330  0051 25bf          	jrult	L534
1331                     ; 488 }
1334  0053 5b04          	addw	sp,#4
1335  0055 81            	ret	
1370                     ; 502 void assert_failed(u8* file, u32 line)
1370                     ; 503 { 
1371                     .text:	section	.text,new
1372  0000               _assert_failed:
1376                     ; 510 }
1379  0000 81            	ret	
1577                     	xdef	_main
1578                     	xdef	_spi_gpio_init
1579                     	xdef	_TIMER1_Init
1580                     	xdef	_GPIO_InitRemoterPower
1581                     	xdef	_System_Process_10uS
1582                     	xdef	_System_Process_40uS
1583                     	xdef	_Delay
1584                     	xdef	_Display_all_led
1585                     	xdef	_System_Process_10MS
1586                     	xdef	_flag_motor_feedback_port
1587                     	xdef	_flag_pwm_out
1588                     	xdef	_flag_system_power
1589                     	xdef	_flag_mode_current
1590                     	xdef	_ucDeftime
1591                     	switch	.ubsct
1592  0000               _ucCurtime_set:
1593  0000 0000          	ds.b	2
1594                     	xdef	_ucCurtime_set
1595                     	xdef	_cnt_elex_current
1596                     	xdef	_cnt_vol_current
1597                     	xdef	_cnt_time_shi_set2
1598                     	xdef	_cnt_time_fen_set2
1599                     	xdef	_cnt_time_shi_set1
1600                     	xdef	_cnt_time_fen_set1
1601                     	xdef	_cnt_time_shi_current
1602                     	xdef	_cnt_time_fen_current
1603                     	xdef	_Cnt_system_ms
1604                     	xdef	_Display_Digital_Led
1605                     	xref	_Irkey_release
1606                     	xref	_IrKey_Scan
1607                     	xref	_Init_TIM2
1608                     	xref	_Receive_IR_Dat
1609                     	xref	_HT1380ReadTime
1610                     	xref	_HT1380SetTime
1611                     	xref	_Get_Ad3
1612                     	xref	_Init_ADC3
1613                     	xref	_Get_Ad1
1614                     	xref	_Init_ADC1
1615                     	xdef	_assert_failed
1616                     	xref	_GPIO_Init
1617                     	xref	_GPIO_DeInit
1618                     	xref	_CLK_HSIPrescalerConfig
1638                     	end
