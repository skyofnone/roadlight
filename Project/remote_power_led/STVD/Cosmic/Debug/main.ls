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
  40  000b               _DISP_BUF:
  41  000b 00            	dc.b	0
  42  000c 01            	dc.b	1
  43  000d 02            	dc.b	2
  44  000e               _DISP_TAB:
  45  000e 14            	dc.b	20
  46  000f d7            	dc.b	215
  47  0010 4c            	dc.b	76
  48  0011 45            	dc.b	69
  49  0012 87            	dc.b	135
  50  0013 25            	dc.b	37
  51  0014 24            	dc.b	36
  52  0015 57            	dc.b	87
  53  0016 04            	dc.b	4
  54  0017 05            	dc.b	5
  55  0018 06            	dc.b	6
  56  0019 a4            	dc.b	164
  57  001a 3c            	dc.b	60
  58  001b               _ucDeftime:
  59  001b 01            	dc.b	1
  60  001c 01            	dc.b	1
  61  001d 01            	dc.b	1
  62  001e 01            	dc.b	1
  63  001f 01            	dc.b	1
  64  0020 01            	dc.b	1
  65  0021 12            	dc.b	18
  66  0022               _flag_mode_current:
  67  0022 00            	dc.b	0
  68  0023               _flag_system_power:
  69  0023 00            	dc.b	0
  70  0024               _flag_pwm_out:
  71  0024 01            	dc.b	1
  72  0025               _flag_motor_feedback_port:
  73  0025 00            	dc.b	0
 102                     ; 107 void TIMER1_Init(void)
 102                     ; 108 {
 104                     .text:	section	.text,new
 105  0000               _TIMER1_Init:
 109                     ; 109 	TIM1->EGR=0x01;//初始化TIM1 TIM1时基初始化
 111  0000 35015257      	mov	21079,#1
 112                     ; 110 	TIM1->EGR|=0x20;//重新初始化TIM1
 114  0004 721a5257      	bset	21079,#5
 115                     ; 111 	TIM1->PSCRH=0; //预分频 设置PWM频率
 117  0008 725f5260      	clr	21088
 118                     ; 112 	TIM1->PSCRL=0;
 120  000c 725f5261      	clr	21089
 121                     ; 113 	TIM1->ARRH=0x02; //设定重装载值
 123  0010 35025262      	mov	21090,#2
 124                     ; 114 	TIM1->ARRL=0x9F;
 126  0014 359f5263      	mov	21091,#159
 127                     ; 115 	TIM1->CR1=0x80;//边沿对齐,向上计数,带缓冲
 129  0018 35805250      	mov	21072,#128
 130                     ; 116 	TIM1->RCR=0x01;//重复计数器
 132  001c 35015264      	mov	21092,#1
 133                     ; 117 	TIM1->CCMR4=0x68;//PWM模式1 通道2PWM输出
 135  0020 3568525b      	mov	21083,#104
 136                     ; 118 	TIM1->CCER2=0x10;//高电平有效，开启输出
 138  0024 3510525d      	mov	21085,#16
 139                     ; 119 	TIM1->CCR4H=0;//设置占空比
 141  0028 725f526b      	clr	21099
 142                     ; 120 	TIM1->CCR4L=0X03;
 144  002c 3503526c      	mov	21100,#3
 145                     ; 122 	TIM1->BKR=0x80;//主使能
 147  0030 3580526d      	mov	21101,#128
 148                     ; 123 	TIM1->CR1|=0x01;//计数使能
 150  0034 72105250      	bset	21072,#0
 151                     ; 126 }
 154  0038 81            	ret	
 179                     ; 127 void GPIO_InitRemoterPower()
 179                     ; 128 {
 180                     .text:	section	.text,new
 181  0000               _GPIO_InitRemoterPower:
 185                     ; 129 	GPIO_Init(LED_GPIOA_PORT, (GPIO_Pin_TypeDef)LED_GPIOA_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
 187  0000 4be0          	push	#224
 188  0002 4b08          	push	#8
 189  0004 ae5000        	ldw	x,#20480
 190  0007 cd0000        	call	_GPIO_Init
 192  000a 85            	popw	x
 193                     ; 130 	GPIO_Init(LED_GPIOC_PORT, (GPIO_Pin_TypeDef)LED_GPIOC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
 195  000b 4be0          	push	#224
 196  000d 4be6          	push	#230
 197  000f ae500a        	ldw	x,#20490
 198  0012 cd0000        	call	_GPIO_Init
 200  0015 85            	popw	x
 201                     ; 131 	GPIO_Init(LED_GPIOD_PORT, (GPIO_Pin_TypeDef)LED_GPIOD_PINS, GPIO_MODE_OUT_PP_LOW_FAST); //LED 初始化
 203  0016 4be0          	push	#224
 204  0018 4b8d          	push	#141
 205  001a ae500f        	ldw	x,#20495
 206  001d cd0000        	call	_GPIO_Init
 208  0020 85            	popw	x
 209                     ; 132 	GPIO_Init(LED_GPIOF_PORT, (GPIO_Pin_TypeDef)LED_GPIOF_PINS, GPIO_MODE_OUT_PP_LOW_FAST); //LED 初始化
 211  0021 4be0          	push	#224
 212  0023 4b10          	push	#16
 213  0025 ae5019        	ldw	x,#20505
 214  0028 cd0000        	call	_GPIO_Init
 216  002b 85            	popw	x
 217                     ; 133 	GPIO_Init(RTC_GPIOB_PORT, (GPIO_Pin_TypeDef)RTC_GPIOB_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
 219  002c 4be0          	push	#224
 220  002e 4b50          	push	#80
 221  0030 ae5005        	ldw	x,#20485
 222  0033 cd0000        	call	_GPIO_Init
 224  0036 85            	popw	x
 225                     ; 134 	GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)GPIO_PIN_5, GPIO_MODE_OUT_OD_LOW_FAST);
 227  0037 4ba0          	push	#160
 228  0039 4b20          	push	#32
 229  003b ae5005        	ldw	x,#20485
 230  003e cd0000        	call	_GPIO_Init
 232  0041 85            	popw	x
 233                     ; 135 	GPIO_Init(IrInPort, IrInPin, GPIO_MODE_IN_PU_NO_IT);
 235  0042 4b40          	push	#64
 236  0044 4b20          	push	#32
 237  0046 ae500a        	ldw	x,#20490
 238  0049 cd0000        	call	_GPIO_Init
 240  004c 85            	popw	x
 241                     ; 136 }
 244  004d 81            	ret	
 269                     ; 139 void spi_gpio_init(void)
 269                     ; 140  {
 270                     .text:	section	.text,new
 271  0000               _spi_gpio_init:
 275                     ; 141 	 GPIO_DeInit(GPIOC);
 277  0000 ae500a        	ldw	x,#20490
 278  0003 cd0000        	call	_GPIO_DeInit
 280                     ; 142 	 GPIO_Init(GPIOC,GPIO_PIN_5|GPIO_PIN_6,GPIO_MODE_OUT_PP_LOW_FAST);
 282  0006 4be0          	push	#224
 283  0008 4b60          	push	#96
 284  000a ae500a        	ldw	x,#20490
 285  000d cd0000        	call	_GPIO_Init
 287  0010 85            	popw	x
 288                     ; 143 	 GPIO_DeInit(GPIOE);
 290  0011 ae5014        	ldw	x,#20500
 291  0014 cd0000        	call	_GPIO_DeInit
 293                     ; 144 	 GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST);
 295  0017 4be0          	push	#224
 296  0019 4b20          	push	#32
 297  001b ae5014        	ldw	x,#20500
 298  001e cd0000        	call	_GPIO_Init
 300  0021 85            	popw	x
 301                     ; 145  }
 304  0022 81            	ret	
 331                     ; 148 void spi_init(void)
 331                     ; 149 {
 332                     .text:	section	.text,new
 333  0000               _spi_init:
 337                     ; 150 	 SPI_DeInit();
 339  0000 cd0000        	call	_SPI_DeInit
 341                     ; 151 	 CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
 343  0003 ae0101        	ldw	x,#257
 344  0006 cd0000        	call	_CLK_PeripheralClockConfig
 346                     ; 153 	 SPI_Init(SPI_FIRSTBIT_LSB, SPI_BAUDRATEPRESCALER_256, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_1LINE_TX, SPI_NSS_SOFT, 0x07);
 348  0009 4b07          	push	#7
 349  000b 4b02          	push	#2
 350  000d 4bc0          	push	#192
 351  000f 4b00          	push	#0
 352  0011 4b00          	push	#0
 353  0013 4b04          	push	#4
 354  0015 ae8038        	ldw	x,#32824
 355  0018 cd0000        	call	_SPI_Init
 357  001b 5b06          	addw	sp,#6
 358                     ; 154 	 SPI_Cmd(ENABLE);
 360  001d a601          	ld	a,#1
 362                     ; 155  }
 365  001f cc0000        	jp	_SPI_Cmd
 368                     	bsct
 369  0026               L15_cnt_receive_rec:
 370  0026 0000          	dc.w	0
 371  0028               L35_cnt_bit:
 372  0028 00            	dc.b	0
 373  0029               L55_flag_cal_point_end:
 374  0029 00            	dc.b	0
 470                     ; 157 void DISP595_Display(u16 cnt_receive)
 470                     ; 158 {
 471                     .text:	section	.text,new
 472  0000               _DISP595_Display:
 474  0000 89            	pushw	x
 475  0001 88            	push	a
 476       00000001      OFST:	set	1
 479                     ; 162 	u8 temp = 0;
 481                     ; 163 	GPIO_WriteLow(GPIOE,GPIO_PIN_5);
 483  0002 4b20          	push	#32
 484  0004 ae5014        	ldw	x,#20500
 485  0007 cd0000        	call	_GPIO_WriteLow
 487  000a be26          	ldw	x,L15_cnt_receive_rec
 488  000c 84            	pop	a
 489                     ; 164 	if(cnt_receive_rec == 0)
 491  000d 2606          	jrne	L361
 492                     ; 166 		cnt_receive_rec = cnt_receive;
 494  000f 1e02          	ldw	x,(OFST+1,sp)
 495  0011 bf26          	ldw	L15_cnt_receive_rec,x
 496                     ; 167 		cnt_bit = 0;
 498  0013 3f28          	clr	L35_cnt_bit
 499  0015               L361:
 500                     ; 169     temp = cnt_receive_rec % 10;   // 取出data的最低位
 502  0015 90ae000a      	ldw	y,#10
 503  0019 65            	divw	x,y
 504  001a 93            	ldw	x,y
 505  001b 01            	rrwa	x,a
 506  001c 6b01          	ld	(OFST+0,sp),a
 507                     ; 170     cnt_receive_rec /= 10;  // 将去掉data的最低位，次低位变为最低位
 509  001e 90ae000a      	ldw	y,#10
 510  0022 be26          	ldw	x,L15_cnt_receive_rec
 511  0024 65            	divw	x,y
 512  0025 bf26          	ldw	L15_cnt_receive_rec,x
 513                     ; 171     cnt_bit ++;
 515  0027 3c28          	inc	L35_cnt_bit
 516                     ; 172 	if((cnt_bit == 3)&&(flag_mode_current == 0))
 518  0029 b628          	ld	a,L35_cnt_bit
 519  002b a103          	cp	a,#3
 520  002d 260b          	jrne	L561
 522  002f 3d22          	tnz	_flag_mode_current
 523  0031 2607          	jrne	L561
 524                     ; 173 		cnt_receive_rec /= 10;  //过滤千位
 526  0033 90ae000a      	ldw	y,#10
 527  0037 65            	divw	x,y
 528  0038 bf26          	ldw	L15_cnt_receive_rec,x
 529  003a               L561:
 530                     ; 174 	switch(cnt_bit)
 533                     ; 200 		default:
 533                     ; 201 			return;
 534  003a 4a            	dec	a
 535  003b 2708          	jreq	L75
 536  003d 4a            	dec	a
 537  003e 2729          	jreq	L16
 538  0040 4a            	dec	a
 539  0041 2744          	jreq	L36
 542  0043 2021          	jra	L021
 543  0045               L75:
 544                     ; 176 		case 1:
 544                     ; 177 			SWITCH_TO_595_GE;
 546  0045 a6c0          	ld	a,#192
 547  0047 cd0000        	call	_SPI_SendData
 549                     ; 178 			if(((cnt_time_shi_set1 == 25)&&(flag_mode_current == 1))||((cnt_time_shi_set2 == 25)&&(flag_mode_current == 3)))
 551  004a b605          	ld	a,_cnt_time_shi_set1
 552  004c a119          	cp	a,#25
 553  004e 2605          	jrne	L771
 555  0050 b622          	ld	a,_flag_mode_current
 556  0052 4a            	dec	a
 557  0053 270c          	jreq	L571
 558  0055               L771:
 560  0055 b607          	ld	a,_cnt_time_shi_set2
 561  0057 a119          	cp	a,#25
 562  0059 2646          	jrne	L171
 564  005b b622          	ld	a,_flag_mode_current
 565  005d a103          	cp	a,#3
 566  005f 2640          	jrne	L171
 567  0061               L571:
 568                     ; 180 				SHOW_595_N;
 570  0061 a619          	ld	a,#25
 571  0063               LC001:
 572  0063 cd0000        	call	_SPI_SendData
 574                     ; 181 				return;
 575  0066               L021:
 578  0066 5b03          	addw	sp,#3
 579  0068 81            	ret	
 580  0069               L16:
 581                     ; 184 		case 2:
 581                     ; 185 			SWITCH_TO_595_SHI;
 583  0069 a6a0          	ld	a,#160
 584  006b cd0000        	call	_SPI_SendData
 586                     ; 186 			if(((cnt_time_shi_set1 == 25)&&(flag_mode_current == 1))||((cnt_time_shi_set2 == 25)&&(flag_mode_current == 3)))
 588  006e b605          	ld	a,_cnt_time_shi_set1
 589  0070 a119          	cp	a,#25
 590  0072 2605          	jrne	L502
 592  0074 b622          	ld	a,_flag_mode_current
 593  0076 4a            	dec	a
 594  0077 2724          	jreq	LC002
 595  0079               L502:
 597  0079 b607          	ld	a,_cnt_time_shi_set2
 598  007b a119          	cp	a,#25
 599  007d 2622          	jrne	L171
 601  007f b622          	ld	a,_flag_mode_current
 602  0081 a103          	cp	a,#3
 603  0083 261c          	jrne	L171
 604                     ; 188 				SHOW_595_BLACK;
 606                     ; 189 				return;
 608  0085 2016          	jp	LC002
 609  0087               L36:
 610                     ; 192 		case 3:
 610                     ; 193 			SWITCH_TO_595_BAI;
 612  0087 a660          	ld	a,#96
 613  0089 cd0000        	call	_SPI_SendData
 615                     ; 194 			if((Cnt_system_ms%3000 <= 1500)&&(flag_mode_current != 0))
 617  008c be00          	ldw	x,_Cnt_system_ms
 618  008e 90ae0bb8      	ldw	y,#3000
 619  0092 65            	divw	x,y
 620  0093 93            	ldw	x,y
 621  0094 a305dd        	cpw	x,#1501
 622  0097 2408          	jruge	L171
 624  0099 b622          	ld	a,_flag_mode_current
 625  009b 2704          	jreq	L171
 626                     ; 196 				SHOW_595_BLACK;
 628  009d               LC002:
 630  009d a6ff          	ld	a,#255
 632                     ; 197 				return;
 634  009f 20c2          	jp	LC001
 635  00a1               L171:
 636                     ; 203     switch(temp)
 638  00a1 7b01          	ld	a,(OFST+0,sp)
 640                     ; 235 		default:
 640                     ; 236 			break;
 641  00a3 271d          	jreq	L76
 642  00a5 4a            	dec	a
 643  00a6 271e          	jreq	L17
 644  00a8 4a            	dec	a
 645  00a9 271f          	jreq	L37
 646  00ab 4a            	dec	a
 647  00ac 2720          	jreq	L57
 648  00ae 4a            	dec	a
 649  00af 2721          	jreq	L77
 650  00b1 4a            	dec	a
 651  00b2 2722          	jreq	L101
 652  00b4 4a            	dec	a
 653  00b5 2723          	jreq	L301
 654  00b7 4a            	dec	a
 655  00b8 2724          	jreq	L501
 656  00ba 4a            	dec	a
 657  00bb 2725          	jreq	L701
 658  00bd 4a            	dec	a
 659  00be 2725          	jreq	L111
 660  00c0 2028          	jra	L312
 661  00c2               L76:
 662                     ; 205 		case 0:
 662                     ; 206 			SHOW_595_0;
 664  00c2 a603          	ld	a,#3
 666                     ; 207 			break;
 668  00c4 2021          	jp	LC003
 669  00c6               L17:
 670                     ; 208 		case 1:
 670                     ; 209 			SHOW_595_1;
 672  00c6 a69f          	ld	a,#159
 674                     ; 210 			break;
 676  00c8 201d          	jp	LC003
 677  00ca               L37:
 678                     ; 211 		case 2:
 678                     ; 212 			SHOW_595_2;
 680  00ca a625          	ld	a,#37
 682                     ; 213 			break;
 684  00cc 2019          	jp	LC003
 685  00ce               L57:
 686                     ; 214 		case 3:
 686                     ; 215 			SHOW_595_3;
 688  00ce a60c          	ld	a,#12
 690                     ; 216 			break;
 692  00d0 2015          	jp	LC003
 693  00d2               L77:
 694                     ; 217 		case 4:
 694                     ; 218 			SHOW_595_4;
 696  00d2 a699          	ld	a,#153
 698                     ; 219 			break;
 700  00d4 2011          	jp	LC003
 701  00d6               L101:
 702                     ; 220 		case 5:
 702                     ; 221 			SHOW_595_5;
 704  00d6 a649          	ld	a,#73
 706                     ; 222 			break;
 708  00d8 200d          	jp	LC003
 709  00da               L301:
 710                     ; 223 		case 6:
 710                     ; 224 			SHOW_595_6;
 712  00da a641          	ld	a,#65
 714                     ; 225 			break;
 716  00dc 2009          	jp	LC003
 717  00de               L501:
 718                     ; 226 		case 7:
 718                     ; 227 			SHOW_595_7;
 720  00de a61f          	ld	a,#31
 722                     ; 228 			break;
 724  00e0 2005          	jp	LC003
 725  00e2               L701:
 726                     ; 229 		case 8:
 726                     ; 230 			SHOW_595_8;
 728  00e2 4c            	inc	a
 730                     ; 231 			break;
 732  00e3 2002          	jp	LC003
 733  00e5               L111:
 734                     ; 232 		case 9:
 734                     ; 233 			SHOW_595_9;
 736  00e5 a609          	ld	a,#9
 737  00e7               LC003:
 738  00e7 cd0000        	call	_SPI_SendData
 740                     ; 234 			break;	
 742                     ; 235 		default:
 742                     ; 236 			break;
 744  00ea               L312:
 745                     ; 241 	GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
 747  00ea 4b20          	push	#32
 748  00ec ae5014        	ldw	x,#20500
 749  00ef cd0000        	call	_GPIO_WriteHigh
 751  00f2 84            	pop	a
 752                     ; 244 }
 754  00f3 cc0066        	jra	L021
 799                     ; 245 void receive_data()
 799                     ; 246 {
 800                     .text:	section	.text,new
 801  0000               _receive_data:
 803  0000 89            	pushw	x
 804       00000002      OFST:	set	2
 807                     ; 247 		uint8_t temp =0;
 809                     ; 248 		uint8_t i =0;
 811                     ; 249 		if(DATADataIn)
 813  0001 ad3e          	call	LC004
 814  0003 2706          	jreq	L732
 815                     ; 250 				Delay(190);
 817  0005 ae00be        	ldw	x,#190
 818  0008 cd0000        	call	_Delay
 820  000b               L732:
 821                     ; 251 		if(DATADataIn == 1)
 823  000b ad34          	call	LC004
 824  000d 2730          	jreq	L142
 825                     ; 253 				temp = 0;
 827  000f 0f02          	clr	(OFST+0,sp)
 828                     ; 254 				for(i=0;i<24;i++)
 830  0011 0f01          	clr	(OFST-1,sp)
 831  0013               L342:
 832                     ; 256 						Delay(30);
 834  0013 ae001e        	ldw	x,#30
 835  0016 cd0000        	call	_Delay
 837                     ; 257 						if(DATADataIn == 1)
 839  0019 ad26          	call	LC004
 840  001b 2706          	jreq	L152
 841                     ; 258 							temp |= 1;
 843  001d 7b02          	ld	a,(OFST+0,sp)
 844  001f aa01          	or	a,#1
 846  0021 2004          	jra	L352
 847  0023               L152:
 848                     ; 260 							temp &= 0xfe;
 850  0023 7b02          	ld	a,(OFST+0,sp)
 851  0025 a4fe          	and	a,#254
 852  0027               L352:
 853  0027 48            	sll	a
 854  0028 6b02          	ld	(OFST+0,sp),a
 855                     ; 261 						temp <<= 1;
 857                     ; 262 						Delay(30);
 859  002a ae001e        	ldw	x,#30
 860  002d cd0000        	call	_Delay
 862                     ; 254 				for(i=0;i<24;i++)
 864  0030 0c01          	inc	(OFST-1,sp)
 867  0032 7b01          	ld	a,(OFST-1,sp)
 868  0034 a118          	cp	a,#24
 869  0036 25db          	jrult	L342
 870                     ; 264 				Display_Digital_Led(temp);
 872  0038 7b02          	ld	a,(OFST+0,sp)
 873  003a 5f            	clrw	x
 874  003b 97            	ld	xl,a
 875  003c cd0000        	call	_Display_Digital_Led
 877  003f               L142:
 878                     ; 267 }
 881  003f 85            	popw	x
 882  0040 81            	ret	
 883  0041               LC004:
 884  0041 c65006        	ld	a,20486
 885  0044 a401          	and	a,#1
 886  0046 c75006        	ld	20486,a
 887  0049 81            	ret	
 912                     ; 276 void ADC_Initializes(void)
 912                     ; 277 {
 913                     .text:	section	.text,new
 914  0000               _ADC_Initializes:
 918                     ; 278     ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, \
 918                     ; 279             ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3,\
 918                     ; 280             DISABLE);
 920  0000 4b00          	push	#0
 921  0002 4b03          	push	#3
 922  0004 4b08          	push	#8
 923  0006 4b00          	push	#0
 924  0008 4b00          	push	#0
 925  000a 4b00          	push	#0
 926  000c ae0103        	ldw	x,#259
 927  000f cd0000        	call	_ADC1_Init
 929  0012 5b06          	addw	sp,#6
 930                     ; 282     ADC1_Cmd(ENABLE);                              //使能ADC
 932  0014 a601          	ld	a,#1
 934                     ; 283 }
 937  0016 cc0000        	jp	_ADC1_Cmd
 992                     .const:	section	.text
 993  0000               L251:
 994  0000 00000ce4      	dc.l	3300
 995                     ; 292 uint32_t ADC_Read(void)
 995                     ; 293 {
 996                     .text:	section	.text,new
 997  0000               _ADC_Read:
 999  0000 5207          	subw	sp,#7
1000       00000007      OFST:	set	7
1003                     ; 295   uint16_t adc_value = 0;
1005  0002 5f            	clrw	x
1006  0003 1f01          	ldw	(OFST-6,sp),x
1007                     ; 296   uint32_t adc_voltage = 0;
1009                     ; 298   for(i=0; i<4; i++)
1011  0005 0f07          	clr	(OFST+0,sp)
1012  0007               L323:
1013                     ; 300     while(RESET == ADC1_GetFlagStatus(ADC1_FLAG_EOC));
1015  0007 a680          	ld	a,#128
1016  0009 cd0000        	call	_ADC1_GetFlagStatus
1018  000c 4d            	tnz	a
1019  000d 27f8          	jreq	L323
1020                     ; 301     ADC1_ClearFlag(ADC1_FLAG_EOC);               //等待转换完成，并清除标志
1022  000f a680          	ld	a,#128
1023  0011 cd0000        	call	_ADC1_ClearFlag
1025                     ; 303     adc_value += ADC1_GetConversionValue();      //读取转换结果
1027  0014 cd0000        	call	_ADC1_GetConversionValue
1029  0017 72fb01        	addw	x,(OFST-6,sp)
1030  001a 1f01          	ldw	(OFST-6,sp),x
1031                     ; 298   for(i=0; i<4; i++)
1033  001c 0c07          	inc	(OFST+0,sp)
1036  001e 7b07          	ld	a,(OFST+0,sp)
1037  0020 a104          	cp	a,#4
1038  0022 25e3          	jrult	L323
1039                     ; 306   adc_voltage = adc_value >> 2;                  //求平均
1041  0024 54            	srlw	x
1042  0025 54            	srlw	x
1043  0026 cd0000        	call	c_uitolx
1045  0029 96            	ldw	x,sp
1046  002a 1c0003        	addw	x,#OFST-4
1047  002d cd0000        	call	c_rtol
1049                     ; 307   adc_voltage = (adc_voltage*3300) >> 10;        //1000倍电压值
1051  0030 96            	ldw	x,sp
1052  0031 1c0003        	addw	x,#OFST-4
1053  0034 cd0000        	call	c_ltor
1055  0037 ae0000        	ldw	x,#L251
1056  003a cd0000        	call	c_lmul
1058  003d a60a          	ld	a,#10
1059  003f cd0000        	call	c_lursh
1061  0042 96            	ldw	x,sp
1062  0043 1c0003        	addw	x,#OFST-4
1063  0046 cd0000        	call	c_rtol
1065                     ; 309   return adc_voltage;
1067  0049 96            	ldw	x,sp
1068  004a 1c0003        	addw	x,#OFST-4
1069  004d cd0000        	call	c_ltor
1073  0050 5b07          	addw	sp,#7
1074  0052 81            	ret	
1137                     ; 312 void main(void)
1137                     ; 313 {	
1138                     .text:	section	.text,new
1139  0000               _main:
1141  0000 5205          	subw	sp,#5
1142       00000005      OFST:	set	5
1145                     ; 315 	uint16_t temp = 0;
1147                     ; 316 	uint8_t RxBuffer = 0;
1149  0002 0f01          	clr	(OFST-4,sp)
1150                     ; 318 	CLK_HSIPrescalerConfig(CLK_PRESCALER_CPUDIV16);//设置为内部高速时�?
1152  0004 a684          	ld	a,#132
1153  0006 cd0000        	call	_CLK_HSIPrescalerConfig
1155                     ; 320 	led_gpio_init();
1157  0009 cd0000        	call	_led_gpio_init
1159                     ; 321 	ucCurtime = ucDeftime;
1161  000c ae001b        	ldw	x,#_ucDeftime
1162  000f 1f02          	ldw	(OFST-3,sp),x
1163                     ; 322 	HT1380SetTime(ucCurtime);
1165  0011 cd0000        	call	_HT1380SetTime
1167                     ; 323 	Init_TIM2();
1169  0014 cd0000        	call	_Init_TIM2
1171                     ; 324 	TIMER1_Init(); //PWM输出	
1173  0017 cd0000        	call	_TIMER1_Init
1175                     ; 325 	enableInterrupts();
1178  001a 9a            	rim	
1180                     ; 326 	UART1_Init((uint32_t)4800, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
1180                     ; 327 				UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
1183  001b 4b0c          	push	#12
1184  001d 4b80          	push	#128
1185  001f 4b00          	push	#0
1186  0021 4b00          	push	#0
1187  0023 4b00          	push	#0
1188  0025 ae12c0        	ldw	x,#4800
1189  0028 89            	pushw	x
1190  0029 5f            	clrw	x
1191  002a 89            	pushw	x
1192  002b cd0000        	call	_UART1_Init
1194  002e 5b09          	addw	sp,#9
1195                     ; 328 	UART1_Cmd(ENABLE);
1197  0030 a601          	ld	a,#1
1198  0032 cd0000        	call	_UART1_Cmd
1200  0035               L553:
1201                     ; 333 		temp = Receive_IR_Dat();		
1203  0035 cd0000        	call	_Receive_IR_Dat
1206  0038 20fb          	jra	L553
1252                     ; 337 void Delay (uint16_t nCount)
1252                     ; 338 {
1253                     .text:	section	.text,new
1254  0000               _Delay:
1256  0000 89            	pushw	x
1257  0001 89            	pushw	x
1258       00000002      OFST:	set	2
1261                     ; 340 	for(i= 0;i<nCount;i++)
1263  0002 5f            	clrw	x
1265  0003 2004          	jra	L704
1266  0005               L304:
1267                     ; 342 		nop();
1270  0005 9d            	nop	
1272                     ; 343 		nop();
1276  0006 9d            	nop	
1278                     ; 344 		nop();
1282  0007 9d            	nop	
1284                     ; 340 	for(i= 0;i<nCount;i++)
1287  0008 5c            	incw	x
1288  0009               L704:
1289  0009 1f01          	ldw	(OFST-1,sp),x
1292  000b 1303          	cpw	x,(OFST+1,sp)
1293  000d 25f6          	jrult	L304
1294                     ; 346 }
1297  000f 5b04          	addw	sp,#4
1298  0011 81            	ret	
1301                     	bsct
1302  002a               L314_t:
1303  002a 0000          	dc.w	0
1304  002c               L514_i:
1305  002c 0000          	dc.w	0
1306  002e               L714_Cnt_last10:
1307  002e 0000          	dc.w	0
1390                     ; 348 void System_Process_10MS()
1390                     ; 349 {	
1391                     .text:	section	.text,new
1392  0000               _System_Process_10MS:
1394  0000 5204          	subw	sp,#4
1395       00000004      OFST:	set	4
1398                     ; 352 	u16 k = 0;
1400  0002 5f            	clrw	x
1401  0003 1f01          	ldw	(OFST-3,sp),x
1402                     ; 361 	ucCurtime = ucDeftime;
1404  0005 ae001b        	ldw	x,#_ucDeftime
1405  0008 1f03          	ldw	(OFST-1,sp),x
1406                     ; 362 	if (Cnt_system_ms >= t)
1408  000a be00          	ldw	x,_Cnt_system_ms
1409  000c b32a          	cpw	x,L314_t
1410  000e 2506          	jrult	L754
1411                     ; 364 		k = Cnt_system_ms -t;
1413  0010 72b0002a      	subw	x,L314_t
1415  0014 200f          	jp	LC005
1416  0016               L754:
1417                     ; 366 	else if(Cnt_system_ms < t)
1419  0016 b32a          	cpw	x,L314_t
1420  0018 240d          	jruge	L164
1421                     ; 368 		k = Cnt_system_ms + (0xffff - t);
1423  001a aeffff        	ldw	x,#65535
1424  001d 72b0002a      	subw	x,L314_t
1425  0021 72bb0000      	addw	x,_Cnt_system_ms
1426  0025               LC005:
1427  0025 1f01          	ldw	(OFST-3,sp),x
1428  0027               L164:
1429                     ; 370 	if (k > 1000)
1431  0027 1e01          	ldw	x,(OFST-3,sp)
1432  0029 a303e9        	cpw	x,#1001
1433  002c 254c          	jrult	L774
1434                     ; 372 		k = 0;
1436                     ; 373 		t = Cnt_system_ms;
1438  002e be00          	ldw	x,_Cnt_system_ms
1439  0030 bf2a          	ldw	L314_t,x
1440                     ; 374 		if((flag_mode_current == 5)||(flag_mode_current == 6))
1442  0032 b622          	ld	a,_flag_mode_current
1443  0034 a105          	cp	a,#5
1444  0036 2704          	jreq	L174
1446  0038 a106          	cp	a,#6
1447  003a 2629          	jrne	L764
1448  003c               L174:
1449                     ; 376 			ucCurtime[1] = cnt_time_fen_current;
1451  003c 1e03          	ldw	x,(OFST-1,sp)
1452  003e b602          	ld	a,_cnt_time_fen_current
1453  0040 e701          	ld	(1,x),a
1454                     ; 377 			ucCurtime[2] = cnt_time_shi_current;
1456  0042 b603          	ld	a,_cnt_time_shi_current
1457  0044 e702          	ld	(2,x),a
1458                     ; 378 			HT1380SetTime(ucCurtime);
1460  0046 cd0000        	call	_HT1380SetTime
1463  0049               L374:
1464                     ; 382 		cnt_time_shi_current = ucCurtime[2];
1466  0049 1e03          	ldw	x,(OFST-1,sp)
1467  004b e602          	ld	a,(2,x)
1468  004d b703          	ld	_cnt_time_shi_current,a
1469                     ; 383 		cnt_time_fen_current = ucCurtime[1];
1471  004f e601          	ld	a,(1,x)
1472  0051 b702          	ld	_cnt_time_fen_current,a
1473                     ; 384 		if((cnt_time_shi_current == cnt_time_shi_set1)&&(cnt_time_fen_current == cnt_time_fen_set1))
1475  0053 b603          	ld	a,_cnt_time_shi_current
1476  0055 b105          	cp	a,_cnt_time_shi_set1
1477  0057 2613          	jrne	L574
1479  0059 b602          	ld	a,_cnt_time_fen_current
1480  005b b104          	cp	a,_cnt_time_fen_set1
1481  005d 260d          	jrne	L574
1482                     ; 386 			flag_pwm_out = TRUE;
1484  005f 35010024      	mov	_flag_pwm_out,#1
1485  0063 2007          	jra	L574
1486  0065               L764:
1487                     ; 381 			HT1380ReadTime(ucCurtime);
1489  0065 1e03          	ldw	x,(OFST-1,sp)
1490  0067 cd0000        	call	_HT1380ReadTime
1492  006a 20dd          	jra	L374
1493  006c               L574:
1494                     ; 389 		if((cnt_time_shi_current == cnt_time_shi_set2)&&(cnt_time_fen_current == cnt_time_fen_set2))
1496  006c b603          	ld	a,_cnt_time_shi_current
1497  006e b107          	cp	a,_cnt_time_shi_set2
1498  0070 2608          	jrne	L774
1500  0072 b602          	ld	a,_cnt_time_fen_current
1501  0074 b106          	cp	a,_cnt_time_fen_set2
1502  0076 2602          	jrne	L774
1503                     ; 391 			flag_pwm_out = FALSE;
1505  0078 3f24          	clr	_flag_pwm_out
1506  007a               L774:
1507                     ; 394 		if((flag_system_power == TRUE)&&(flag_pwm_out == TRUE))
1511                     ; 407 }
1514  007a 5b04          	addw	sp,#4
1515  007c 81            	ret	
1518                     	bsct
1519  0030               L505_t:
1520  0030 0000          	dc.w	0
1521  0032               L705_i:
1522  0032 0000          	dc.w	0
1523  0034               L115_Cnt_last10:
1524  0034 0000          	dc.w	0
1590                     ; 409 void System_Process_40uS()
1590                     ; 410 {	
1591                     .text:	section	.text,new
1592  0000               _System_Process_40uS:
1594  0000 89            	pushw	x
1595       00000002      OFST:	set	2
1598                     ; 413 	u16 k = 0;
1600  0001 5f            	clrw	x
1601  0002 1f01          	ldw	(OFST-1,sp),x
1602                     ; 422 	if (Cnt_system_ms >= t)
1604  0004 be00          	ldw	x,_Cnt_system_ms
1605  0006 b330          	cpw	x,L505_t
1606  0008 2506          	jrult	L545
1607                     ; 424 		k = Cnt_system_ms -t;
1609  000a 72b00030      	subw	x,L505_t
1611  000e 200f          	jp	LC006
1612  0010               L545:
1613                     ; 426 	else if(Cnt_system_ms < t)
1615  0010 b330          	cpw	x,L505_t
1616  0012 240d          	jruge	L745
1617                     ; 428 		k = Cnt_system_ms + (0xffff - t);
1619  0014 aeffff        	ldw	x,#65535
1620  0017 72b00030      	subw	x,L505_t
1621  001b 72bb0000      	addw	x,_Cnt_system_ms
1622  001f               LC006:
1623  001f 1f01          	ldw	(OFST-1,sp),x
1624  0021               L745:
1625                     ; 430 	if (k >4)
1627  0021 1e01          	ldw	x,(OFST-1,sp)
1628  0023 a30005        	cpw	x,#5
1629  0026 2512          	jrult	L355
1630                     ; 433 		k = 0;
1632                     ; 434 		t = Cnt_system_ms;
1634  0028 be00          	ldw	x,_Cnt_system_ms
1635  002a bf30          	ldw	L505_t,x
1636                     ; 435 			Init_ADC1();
1638  002c cd0000        	call	_Init_ADC1
1640                     ; 436 		cnt_elex_current = Get_Ad1();
1642  002f cd0000        	call	_Get_Ad1
1644  0032 bf09          	ldw	_cnt_elex_current,x
1645                     ; 437 			Init_ADC3();
1647  0034 cd0000        	call	_Init_ADC3
1649                     ; 438 		Get_Ad3();
1651  0037 cd0000        	call	_Get_Ad3
1653  003a               L355:
1654                     ; 442 }
1657  003a 85            	popw	x
1658  003b 81            	ret	
1661                     	bsct
1662  0036               L555_t:
1663  0036 0000          	dc.w	0
1664  0038               L755_i:
1665  0038 0000          	dc.w	0
1666  003a               L165_Cnt_last10:
1667  003a 0000          	dc.w	0
1731                     ; 444 void System_Process_10uS()
1731                     ; 445 {	
1732                     .text:	section	.text,new
1733  0000               _System_Process_10uS:
1735  0000 89            	pushw	x
1736       00000002      OFST:	set	2
1739                     ; 448 	u16 k = 0;
1741  0001 5f            	clrw	x
1742  0002 1f01          	ldw	(OFST-1,sp),x
1743                     ; 457 	if (Cnt_system_ms >= t)
1745  0004 be00          	ldw	x,_Cnt_system_ms
1746  0006 b336          	cpw	x,L555_t
1747  0008 2506          	jrult	L516
1748                     ; 459 		k = Cnt_system_ms -t;
1750  000a 72b00036      	subw	x,L555_t
1752  000e 200f          	jp	LC007
1753  0010               L516:
1754                     ; 461 	else if(Cnt_system_ms < t)
1756  0010 b336          	cpw	x,L555_t
1757  0012 240d          	jruge	L716
1758                     ; 463 		k = Cnt_system_ms + (0xffff - t);
1760  0014 aeffff        	ldw	x,#65535
1761  0017 72b00036      	subw	x,L555_t
1762  001b 72bb0000      	addw	x,_Cnt_system_ms
1763  001f               LC007:
1764  001f 1f01          	ldw	(OFST-1,sp),x
1765  0021               L716:
1766                     ; 465 	if (k >1)
1768  0021 1e01          	ldw	x,(OFST-1,sp)
1769  0023 a30002        	cpw	x,#2
1770  0026 2512          	jrult	L326
1771                     ; 468 		k = 0;
1773                     ; 469 		t = Cnt_system_ms;
1775  0028 be00          	ldw	x,_Cnt_system_ms
1776  002a bf36          	ldw	L555_t,x
1777                     ; 470 		if(Receive_IR_Dat())
1779  002c cd0000        	call	_Receive_IR_Dat
1781  002f 4d            	tnz	a
1782  0030 2705          	jreq	L526
1783                     ; 471 			IrKey_Scan();
1785  0032 cd0000        	call	_IrKey_Scan
1788  0035 2003          	jra	L326
1789  0037               L526:
1790                     ; 473 			Irkey_release();
1792  0037 cd0000        	call	_Irkey_release
1794  003a               L326:
1795                     ; 477 }
1798  003a 85            	popw	x
1799  003b 81            	ret	
1831                     ; 481 void Display_all_led()
1831                     ; 482 {
1832                     .text:	section	.text,new
1833  0000               _Display_all_led:
1837                     ; 484 	switch(flag_mode_current&0x0F)	  //0--电压 1--定时1时 2--定时1分 3--定时2时 4--定时2分 5--校时时 6--校时分
1839  0000 b622          	ld	a,_flag_mode_current
1840  0002 a40f          	and	a,#15
1842                     ; 508 		default:
1842                     ; 509 			break;
1843  0004 2713          	jreq	L136
1844  0006 4a            	dec	a
1845  0007 2719          	jreq	L336
1846  0009 4a            	dec	a
1847  000a 271f          	jreq	L536
1848  000c 4a            	dec	a
1849  000d 2725          	jreq	L736
1850  000f 4a            	dec	a
1851  0010 272b          	jreq	L146
1852  0012 4a            	dec	a
1853  0013 2731          	jreq	L346
1854  0015 4a            	dec	a
1855  0016 2737          	jreq	L546
1857  0018 81            	ret	
1858  0019               L136:
1859                     ; 486 		case 0x00:
1859                     ; 487 			Display_Digital_Led(cnt_vol_current+1000);
1861  0019 b608          	ld	a,_cnt_vol_current
1862  001b 5f            	clrw	x
1863  001c 97            	ld	xl,a
1864  001d 1c03e8        	addw	x,#1000
1866                     ; 488 			break;
1868  0020 2034          	jp	LC008
1869  0022               L336:
1870                     ; 489 		case 0x01:
1870                     ; 490 			Display_Digital_Led(cnt_time_shi_set1+100);
1872  0022 b605          	ld	a,_cnt_time_shi_set1
1873  0024 5f            	clrw	x
1874  0025 97            	ld	xl,a
1875  0026 1c0064        	addw	x,#100
1877                     ; 491 			break;
1879  0029 202b          	jp	LC008
1880  002b               L536:
1881                     ; 492 		case 0x02:
1881                     ; 493 			Display_Digital_Led(cnt_time_fen_set1+200);
1883  002b b604          	ld	a,_cnt_time_fen_set1
1884  002d 5f            	clrw	x
1885  002e 97            	ld	xl,a
1886  002f 1c00c8        	addw	x,#200
1888                     ; 494 			break;
1890  0032 2022          	jp	LC008
1891  0034               L736:
1892                     ; 495 		case 0x03:
1892                     ; 496 			Display_Digital_Led(cnt_time_shi_set2+300);
1894  0034 b607          	ld	a,_cnt_time_shi_set2
1895  0036 5f            	clrw	x
1896  0037 97            	ld	xl,a
1897  0038 1c012c        	addw	x,#300
1899                     ; 497 			break;
1901  003b 2019          	jp	LC008
1902  003d               L146:
1903                     ; 498 		case 0x04:
1903                     ; 499 			Display_Digital_Led(cnt_time_fen_set2+400);
1905  003d b606          	ld	a,_cnt_time_fen_set2
1906  003f 5f            	clrw	x
1907  0040 97            	ld	xl,a
1908  0041 1c0190        	addw	x,#400
1910                     ; 500 			break;
1912  0044 2010          	jp	LC008
1913  0046               L346:
1914                     ; 501 		case 0x05:
1914                     ; 502 			Display_Digital_Led(cnt_time_shi_current+500);
1916  0046 b603          	ld	a,_cnt_time_shi_current
1917  0048 5f            	clrw	x
1918  0049 97            	ld	xl,a
1919  004a 1c01f4        	addw	x,#500
1921                     ; 503 			break;
1923  004d 2007          	jp	LC008
1924  004f               L546:
1925                     ; 504 		case 0x06:
1925                     ; 505 			Display_Digital_Led(cnt_time_fen_current+600);
1927  004f b602          	ld	a,_cnt_time_fen_current
1928  0051 5f            	clrw	x
1929  0052 97            	ld	xl,a
1930  0053 1c0258        	addw	x,#600
1931  0056               LC008:
1933                     ; 506 			break;
1935                     ; 508 		default:
1935                     ; 509 			break;
1937                     ; 541 }
1940  0056 cc0000        	jp	_Display_Digital_Led
1943                     	bsct
1944  003c               L566_cnt_receive_rec:
1945  003c 0000          	dc.w	0
1946  003e               L766_cnt_bit:
1947  003e 00            	dc.b	0
1948  003f               L176_flag_cal_point_end:
1949  003f 00            	dc.b	0
2023                     ; 542 void Display_Digital_Led(u16 cnt_receive)
2023                     ; 543 {
2024                     .text:	section	.text,new
2025  0000               _Display_Digital_Led:
2027  0000 89            	pushw	x
2028  0001 88            	push	a
2029       00000001      OFST:	set	1
2032                     ; 547 	u8 temp = 0;
2034                     ; 548 	if(cnt_receive_rec == 0)
2036  0002 be3c          	ldw	x,L566_cnt_receive_rec
2037  0004 2606          	jrne	L767
2038                     ; 550 		cnt_receive_rec = cnt_receive;
2040  0006 1e02          	ldw	x,(OFST+1,sp)
2041  0008 bf3c          	ldw	L566_cnt_receive_rec,x
2042                     ; 551 		cnt_bit = 0;
2044  000a 3f3e          	clr	L766_cnt_bit
2045  000c               L767:
2046                     ; 553     temp = cnt_receive_rec % 10;   // 取出data的最低位
2048  000c 90ae000a      	ldw	y,#10
2049  0010 65            	divw	x,y
2050  0011 93            	ldw	x,y
2051  0012 01            	rrwa	x,a
2052  0013 6b01          	ld	(OFST+0,sp),a
2053                     ; 554     cnt_receive_rec /= 10;  // 将去掉data的最低位，次低位变为最低位
2055  0015 90ae000a      	ldw	y,#10
2056  0019 be3c          	ldw	x,L566_cnt_receive_rec
2057  001b 65            	divw	x,y
2058  001c bf3c          	ldw	L566_cnt_receive_rec,x
2059                     ; 555     cnt_bit ++;
2061  001e 3c3e          	inc	L766_cnt_bit
2062                     ; 556 	if((cnt_bit == 3)&&(flag_mode_current == 0))
2064  0020 b63e          	ld	a,L766_cnt_bit
2065  0022 a103          	cp	a,#3
2066  0024 260b          	jrne	L177
2068  0026 3d22          	tnz	_flag_mode_current
2069  0028 2607          	jrne	L177
2070                     ; 557 		cnt_receive_rec /= 10;  //过滤千位
2072  002a 90ae000a      	ldw	y,#10
2073  002e 65            	divw	x,y
2074  002f bf3c          	ldw	L566_cnt_receive_rec,x
2075  0031               L177:
2076                     ; 558 	switch(cnt_bit)
2079                     ; 584 		default:
2079                     ; 585 			return;
2080  0031 4a            	dec	a
2081  0032 2708          	jreq	L376
2082  0034 4a            	dec	a
2083  0035 2742          	jreq	L576
2084  0037 4a            	dec	a
2085  0038 2764          	jreq	L776
2088  003a 203a          	jra	L252
2089  003c               L376:
2090                     ; 560 		case 1:
2090                     ; 561 			SWITCH_TO_LED_GE;
2092  003c 72195019      	bres	20505,#4
2095  0040 72175000      	bres	20480,#3
2098  0044 721a500f      	bset	20495,#5
2099                     ; 562 			if(((cnt_time_shi_set1 == 25)&&(flag_mode_current == 1))||((cnt_time_shi_set2 == 25)&&(flag_mode_current == 3)))
2101  0048 b605          	ld	a,_cnt_time_shi_set1
2102  004a a119          	cp	a,#25
2103  004c 2605          	jrne	L3001
2105  004e b622          	ld	a,_flag_mode_current
2106  0050 4a            	dec	a
2107  0051 270c          	jreq	L1001
2108  0053               L3001:
2110  0053 b607          	ld	a,_cnt_time_shi_set2
2111  0055 a119          	cp	a,#25
2112  0057 267c          	jrne	L577
2114  0059 b622          	ld	a,_flag_mode_current
2115  005b a103          	cp	a,#3
2116  005d 2676          	jrne	L577
2117  005f               L1001:
2118                     ; 564 				SHOW_LED_N;
2120  005f cd01b6        	call	LC020
2123  0062 721d500a      	bres	20490,#6
2126  0066 721e500a      	bset	20490,#7
2129  006a 7214500f      	bset	20495,#2
2134  006e               LC009:
2137  006e 7213500a      	bres	20490,#1
2140  0072 721b500a      	bres	20490,#5
2141                     ; 565 				return;
2142  0076               L252:
2145  0076 5b03          	addw	sp,#3
2146  0078 81            	ret	
2147  0079               L576:
2148                     ; 568 		case 2:
2148                     ; 569 			SWITCH_TO_LED_SHI;
2150  0079 72195019      	bres	20505,#4
2153  007d 72165000      	bset	20480,#3
2156  0081 721b500f      	bres	20495,#5
2157                     ; 570 			if(((cnt_time_shi_set1 == 25)&&(flag_mode_current == 1))||((cnt_time_shi_set2 == 25)&&(flag_mode_current == 3)))
2159  0085 b605          	ld	a,_cnt_time_shi_set1
2160  0087 a119          	cp	a,#25
2161  0089 2605          	jrne	L1101
2163  008b b622          	ld	a,_flag_mode_current
2164  008d 4a            	dec	a
2165  008e 272b          	jreq	LC010
2166  0090               L1101:
2168  0090 b607          	ld	a,_cnt_time_shi_set2
2169  0092 a119          	cp	a,#25
2170  0094 263f          	jrne	L577
2172  0096 b622          	ld	a,_flag_mode_current
2173  0098 a103          	cp	a,#3
2174  009a 2639          	jrne	L577
2175                     ; 572 				SHOW_LED_BLACK;
2183                     ; 573 				return;
2185  009c 201d          	jp	LC010
2186  009e               L776:
2187                     ; 576 		case 3:
2187                     ; 577 			SWITCH_TO_LED_BAI;
2189  009e 72185019      	bset	20505,#4
2192  00a2 72175000      	bres	20480,#3
2195  00a6 721b500f      	bres	20495,#5
2196                     ; 578 			if((Cnt_system_ms%3000 <= 1500)&&(flag_mode_current != 0))
2198  00aa 90ae0bb8      	ldw	y,#3000
2199  00ae be00          	ldw	x,_Cnt_system_ms
2200  00b0 65            	divw	x,y
2201  00b1 93            	ldw	x,y
2202  00b2 a305dd        	cpw	x,#1501
2203  00b5 241e          	jruge	L577
2205  00b7 b622          	ld	a,_flag_mode_current
2206  00b9 271a          	jreq	L577
2207                     ; 580 				SHOW_LED_BLACK;
2219  00bb               LC010:
2221  00bb 7217500f      	bres	20495,#3
2223  00bf 7211500f      	bres	20495,#0
2225  00c3 7215500a      	bres	20490,#2
2227  00c7 721d500a      	bres	20490,#6
2229  00cb 721f500a      	bres	20490,#7
2231  00cf 7215500f      	bres	20495,#2
2234                     ; 581 				return;
2236  00d3 2099          	jp	LC009
2237  00d5               L577:
2238                     ; 587     switch(temp)
2240  00d5 7b01          	ld	a,(OFST+0,sp)
2242                     ; 619 		default:
2242                     ; 620 			break;
2243  00d7 2724          	jreq	L307
2244  00d9 4a            	dec	a
2245  00da 2732          	jreq	L507
2246  00dc 4a            	dec	a
2247  00dd 2735          	jreq	L707
2248  00df 4a            	dec	a
2249  00e0 274c          	jreq	L117
2250  00e2 4a            	dec	a
2251  00e3 2756          	jreq	L317
2252  00e5 4a            	dec	a
2253  00e6 275c          	jreq	L517
2254  00e8 4a            	dec	a
2255  00e9 2763          	jreq	L717
2256  00eb 4a            	dec	a
2257  00ec 2776          	jreq	L127
2258  00ee 4a            	dec	a
2259  00ef 2603cc0178    	jreq	L327
2260  00f4 4a            	dec	a
2261  00f5 2603cc0182    	jreq	L527
2262  00fa cc01a2        	jra	L7101
2263  00fd               L307:
2264                     ; 589 		case 0:
2264                     ; 590 			SHOW_LED_0;
2266  00fd cd01b6        	call	LC020
2269  0100 721c500a      	bset	20490,#6
2272  0104 721e500a      	bset	20490,#7
2275  0108 7214500f      	bset	20495,#2
2278                     ; 591 			break;
2280  010c 2064          	jp	LC018
2281  010e               L507:
2282                     ; 592 		case 1:
2282                     ; 593 			SHOW_LED_1;
2284  010e 7217500f      	bres	20495,#3
2292                     ; 594 			break;
2294  0112 2054          	jp	LC019
2295  0114               L707:
2296                     ; 595 		case 2:
2296                     ; 596 			SHOW_LED_2;
2298  0114 7216500f      	bset	20495,#3
2301  0118 7210500f      	bset	20495,#0
2304  011c 7215500a      	bres	20490,#2
2307  0120 721c500a      	bset	20490,#6
2310  0124 721e500a      	bset	20490,#7
2313  0128               LC017:
2315  0128 7215500f      	bres	20495,#2
2318                     ; 597 			break;
2320  012c 206c          	jp	LC012
2321  012e               L117:
2322                     ; 598 		case 3:
2322                     ; 599 			SHOW_LED_3;
2324  012e cd01b6        	call	LC020
2327  0131 721c500a      	bset	20490,#6
2330  0135 721f500a      	bres	20490,#7
2334                     ; 600 			break;
2336  0139 20ed          	jp	LC017
2337  013b               L317:
2338                     ; 601 		case 4:
2338                     ; 602 			SHOW_LED_4;
2340  013b 7217500f      	bres	20495,#3
2343  013f cd01c3        	call	LC021
2348                     ; 603 			break;
2350  0142 204e          	jp	LC014
2351  0144               L517:
2352                     ; 604 		case 5:
2352                     ; 605 			SHOW_LED_5;
2354  0144 7216500f      	bset	20495,#3
2357  0148 7211500f      	bres	20495,#0
2364                     ; 606 			break;
2366  014c 203c          	jp	LC015
2367  014e               L717:
2368                     ; 607 		case 6:
2368                     ; 608 			SHOW_LED_6;
2370  014e 7216500f      	bset	20495,#3
2373  0152 7211500f      	bres	20495,#0
2380  0156               LC016:
2382  0156 7214500a      	bset	20490,#2
2384  015a 721c500a      	bset	20490,#6
2386  015e 721e500a      	bset	20490,#7
2390                     ; 609 			break;
2392  0162 2032          	jp	LC013
2393  0164               L127:
2394                     ; 610 		case 7:
2394                     ; 611 			SHOW_LED_7;
2396  0164 7216500f      	bset	20495,#3
2407  0168               LC019:
2409  0168 ad59          	call	LC021
2411  016a 721f500a      	bres	20490,#7
2413  016e 7215500f      	bres	20495,#2
2416  0172               LC018:
2419  0172 7213500a      	bres	20490,#1
2421                     ; 612 			break;
2423  0176 2026          	jp	LC011
2424  0178               L327:
2425                     ; 613 		case 8:
2425                     ; 614 			SHOW_LED_8;
2427  0178 7216500f      	bset	20495,#3
2430  017c 7210500f      	bset	20495,#0
2437                     ; 615 			break;
2439  0180 20d4          	jp	LC016
2440  0182               L527:
2441                     ; 616 		case 9:
2441                     ; 617 			SHOW_LED_9;
2443  0182 7216500f      	bset	20495,#3
2446  0186 7210500f      	bset	20495,#0
2451  018a               LC015:
2453  018a 7214500a      	bset	20490,#2
2455  018e 721c500a      	bset	20490,#6
2458  0192               LC014:
2461  0192 721f500a      	bres	20490,#7
2464  0196               LC013:
2469  0196 7214500f      	bset	20495,#2
2472  019a               LC012:
2479  019a 7212500a      	bset	20490,#1
2482  019e               LC011:
2492  019e 721b500a      	bres	20490,#5
2493                     ; 618 			break;	
2495                     ; 619 		default:
2495                     ; 620 			break;
2497  01a2               L7101:
2498                     ; 622 	if((flag_mode_current == 0)&&(cnt_bit == 2))
2500  01a2 b622          	ld	a,_flag_mode_current
2501  01a4 2703cc0076    	jrne	L252
2503  01a9 b63e          	ld	a,L766_cnt_bit
2504  01ab a102          	cp	a,#2
2505  01ad 26f7          	jrne	L252
2506                     ; 623 		SHOW_LED_DIAN;
2508  01af 721a500a      	bset	20490,#5
2509                     ; 625 }
2511  01b3 cc0076        	jra	L252
2512  01b6               LC020:
2513  01b6 7216500f      	bset	20495,#3
2514                     ; 599 			SHOW_LED_3;
2516  01ba 7210500f      	bset	20495,#0
2519  01be 7214500a      	bset	20490,#2
2520  01c2 81            	ret	
2521  01c3               LC021:
2522  01c3 7210500f      	bset	20495,#0
2524  01c7 7214500a      	bset	20490,#2
2526  01cb 721d500a      	bres	20490,#6
2527  01cf 81            	ret	
2562                     ; 638 void assert_failed(u8* file, u32 line)
2562                     ; 639 { 
2563                     .text:	section	.text,new
2564  0000               _assert_failed:
2568                     ; 646 }
2571  0000 81            	ret	
2769                     	xdef	_main
2770                     	xdef	_ADC_Read
2771                     	xdef	_ADC_Initializes
2772                     	xdef	_TIMER1_Init
2773                     	xdef	_receive_data
2774                     	xdef	_DISP595_Display
2775                     	xdef	_spi_init
2776                     	xdef	_spi_gpio_init
2777                     	xdef	_GPIO_InitRemoterPower
2778                     	xdef	_System_Process_10uS
2779                     	xdef	_System_Process_40uS
2780                     	xdef	_Delay
2781                     	xdef	_Display_all_led
2782                     	xdef	_System_Process_10MS
2783                     	xdef	_flag_motor_feedback_port
2784                     	xdef	_flag_pwm_out
2785                     	xdef	_flag_system_power
2786                     	xdef	_flag_mode_current
2787                     	xdef	_ucDeftime
2788                     	switch	.ubsct
2789  0000               _ucCurtime_set:
2790  0000 0000          	ds.b	2
2791                     	xdef	_ucCurtime_set
2792                     	xdef	_DISP_TAB
2793                     	xdef	_DISP_BUF
2794                     	xdef	_cnt_elex_current
2795                     	xdef	_cnt_vol_current
2796                     	xdef	_cnt_time_shi_set2
2797                     	xdef	_cnt_time_fen_set2
2798                     	xdef	_cnt_time_shi_set1
2799                     	xdef	_cnt_time_fen_set1
2800                     	xdef	_cnt_time_shi_current
2801                     	xdef	_cnt_time_fen_current
2802                     	xdef	_Cnt_system_ms
2803                     	xref	_led_gpio_init
2804                     	xdef	_Display_Digital_Led
2805                     	xref	_Irkey_release
2806                     	xref	_IrKey_Scan
2807                     	xref	_Init_TIM2
2808                     	xref	_Receive_IR_Dat
2809                     	xref	_HT1380ReadTime
2810                     	xref	_HT1380SetTime
2811                     	xref	_Get_Ad3
2812                     	xref	_Init_ADC3
2813                     	xref	_Get_Ad1
2814                     	xref	_Init_ADC1
2815                     	xdef	_assert_failed
2816                     	xref	_UART1_Cmd
2817                     	xref	_UART1_Init
2818                     	xref	_SPI_SendData
2819                     	xref	_SPI_Cmd
2820                     	xref	_SPI_Init
2821                     	xref	_SPI_DeInit
2822                     	xref	_GPIO_WriteLow
2823                     	xref	_GPIO_WriteHigh
2824                     	xref	_GPIO_Init
2825                     	xref	_GPIO_DeInit
2826                     	xref	_CLK_HSIPrescalerConfig
2827                     	xref	_CLK_PeripheralClockConfig
2828                     	xref	_ADC1_ClearFlag
2829                     	xref	_ADC1_GetFlagStatus
2830                     	xref	_ADC1_GetConversionValue
2831                     	xref	_ADC1_Cmd
2832                     	xref	_ADC1_Init
2833                     	xref.b	c_x
2853                     	xref	c_lursh
2854                     	xref	c_lmul
2855                     	xref	c_ltor
2856                     	xref	c_rtol
2857                     	xref	c_uitolx
2858                     	end
