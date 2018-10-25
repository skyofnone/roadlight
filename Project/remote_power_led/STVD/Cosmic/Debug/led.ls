   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  50                     ; 5 void led_gpio_init(void)
  50                     ; 6 {
  52                     .text:	section	.text,new
  53  0000               _led_gpio_init:
  57                     ; 7     GPIO_Init(LED_GPIOC_PORT, (GPIO_Pin_TypeDef)LED_GPIOC_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
  59  0000 4be0          	push	#224
  60  0002 4be6          	push	#230
  61  0004 ae500a        	ldw	x,#20490
  62  0007 cd0000        	call	_GPIO_Init
  64  000a 85            	popw	x
  65                     ; 8     GPIO_Init(LED_GPIOD_PORT, (GPIO_Pin_TypeDef)LED_GPIOD_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
  67  000b 4be0          	push	#224
  68  000d 4b8d          	push	#141
  69  000f ae500f        	ldw	x,#20495
  70  0012 cd0000        	call	_GPIO_Init
  72  0015 85            	popw	x
  73                     ; 9     GPIO_Init(LED_GPIOA_PORT, (GPIO_Pin_TypeDef)LED_GPIOA_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
  75  0016 4be0          	push	#224
  76  0018 4b08          	push	#8
  77  001a ae5000        	ldw	x,#20480
  78  001d cd0000        	call	_GPIO_Init
  80  0020 85            	popw	x
  81                     ; 10     GPIO_Init(LED_GPIOF_PORT, (GPIO_Pin_TypeDef)LED_GPIOF_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
  83  0021 4be0          	push	#224
  84  0023 4b10          	push	#16
  85  0025 ae5019        	ldw	x,#20505
  86  0028 cd0000        	call	_GPIO_Init
  88  002b 85            	popw	x
  89                     ; 11 }
  92  002c 81            	ret	
 128                     ; 12 void dig_ctl_1(uint8_t on)
 128                     ; 13 {
 129                     .text:	section	.text,new
 130  0000               _dig_ctl_1:
 134                     ; 14 	if(on)
 136  0000 4d            	tnz	a
 137  0001 270a          	jreq	L73
 138                     ; 15 		GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_7); 
 140  0003 4b80          	push	#128
 141  0005 ae500f        	ldw	x,#20495
 142  0008 cd0000        	call	_GPIO_WriteHigh
 145  000b 2008          	jra	L14
 146  000d               L73:
 147                     ; 17 		GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_7); 
 149  000d 4b80          	push	#128
 150  000f ae500f        	ldw	x,#20495
 151  0012 cd0000        	call	_GPIO_WriteLow
 153  0015               L14:
 154  0015 84            	pop	a
 155                     ; 18 }
 158  0016 81            	ret	
 194                     ; 20 void dig_ctl_2(uint8_t on)
 194                     ; 21 {
 195                     .text:	section	.text,new
 196  0000               _dig_ctl_2:
 200                     ; 22 	if(on)
 202  0000 4d            	tnz	a
 203  0001 270a          	jreq	L16
 204                     ; 23 		GPIO_WriteHigh(LED_GPIOA_PORT, GPIO_PIN_3); 
 206  0003 4b08          	push	#8
 207  0005 ae5000        	ldw	x,#20480
 208  0008 cd0000        	call	_GPIO_WriteHigh
 211  000b 2008          	jra	L36
 212  000d               L16:
 213                     ; 25 		GPIO_WriteLow(LED_GPIOA_PORT, GPIO_PIN_3); 
 215  000d 4b08          	push	#8
 216  000f ae5000        	ldw	x,#20480
 217  0012 cd0000        	call	_GPIO_WriteLow
 219  0015               L36:
 220  0015 84            	pop	a
 221                     ; 26 }
 224  0016 81            	ret	
 260                     ; 28 void dig_ctl_3(uint8_t on)
 260                     ; 29 {
 261                     .text:	section	.text,new
 262  0000               _dig_ctl_3:
 266                     ; 30 	if(on)
 268  0000 4d            	tnz	a
 269  0001 270a          	jreq	L301
 270                     ; 31 		GPIO_WriteHigh(LED_GPIOF_PORT, GPIO_PIN_4); 
 272  0003 4b10          	push	#16
 273  0005 ae5019        	ldw	x,#20505
 274  0008 cd0000        	call	_GPIO_WriteHigh
 277  000b 2008          	jra	L501
 278  000d               L301:
 279                     ; 33 		GPIO_WriteLow(LED_GPIOF_PORT, GPIO_PIN_4); 
 281  000d 4b10          	push	#16
 282  000f ae5019        	ldw	x,#20505
 283  0012 cd0000        	call	_GPIO_WriteLow
 285  0015               L501:
 286  0015 84            	pop	a
 287                     ; 34 }
 290  0016 81            	ret	
 315                     ; 36 void show_0(void)
 315                     ; 37 {//L_A_0;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_1;L_DP_1
 316                     .text:	section	.text,new
 317  0000               _show_0:
 321                     ; 38 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
 323  0000 4b08          	push	#8
 324  0002 ae500f        	ldw	x,#20495
 325  0005 cd0000        	call	_GPIO_WriteHigh
 327  0008 84            	pop	a
 328                     ; 39 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
 330  0009 4b01          	push	#1
 331  000b ae500f        	ldw	x,#20495
 332  000e cd0000        	call	_GPIO_WriteHigh
 334  0011 84            	pop	a
 335                     ; 40 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
 337  0012 4b04          	push	#4
 338  0014 ae500a        	ldw	x,#20490
 339  0017 cd0000        	call	_GPIO_WriteHigh
 341  001a 84            	pop	a
 342                     ; 41 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
 344  001b 4b40          	push	#64
 345  001d ae500a        	ldw	x,#20490
 346  0020 cd0000        	call	_GPIO_WriteHigh
 348  0023 84            	pop	a
 349                     ; 42 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
 351  0024 4b80          	push	#128
 352  0026 ae500a        	ldw	x,#20490
 353  0029 cd0000        	call	_GPIO_WriteHigh
 355  002c 84            	pop	a
 356                     ; 43 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
 358  002d 4b04          	push	#4
 359  002f ae500f        	ldw	x,#20495
 360  0032 cd0000        	call	_GPIO_WriteHigh
 362  0035 84            	pop	a
 363                     ; 44 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
 365  0036 4b02          	push	#2
 366  0038 ae500a        	ldw	x,#20490
 367  003b cd0000        	call	_GPIO_WriteLow
 369  003e 84            	pop	a
 370                     ; 45 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
 372  003f 4b20          	push	#32
 373  0041 ae500a        	ldw	x,#20490
 374  0044 cd0000        	call	_GPIO_WriteLow
 376  0047 84            	pop	a
 377                     ; 46 }
 380  0048 81            	ret	
 405                     ; 47 void show_1(void)
 405                     ; 48 {//L_A_1;L_B_0;L_C_0;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
 406                     .text:	section	.text,new
 407  0000               _show_1:
 411                     ; 49 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
 413  0000 4b08          	push	#8
 414  0002 ae500f        	ldw	x,#20495
 415  0005 cd0000        	call	_GPIO_WriteLow
 417  0008 84            	pop	a
 418                     ; 50 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
 420  0009 4b01          	push	#1
 421  000b ae500f        	ldw	x,#20495
 422  000e cd0000        	call	_GPIO_WriteHigh
 424  0011 84            	pop	a
 425                     ; 51 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
 427  0012 4b04          	push	#4
 428  0014 ae500a        	ldw	x,#20490
 429  0017 cd0000        	call	_GPIO_WriteHigh
 431  001a 84            	pop	a
 432                     ; 52 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
 434  001b 4b40          	push	#64
 435  001d ae500a        	ldw	x,#20490
 436  0020 cd0000        	call	_GPIO_WriteLow
 438  0023 84            	pop	a
 439                     ; 53 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
 441  0024 4b80          	push	#128
 442  0026 ae500a        	ldw	x,#20490
 443  0029 cd0000        	call	_GPIO_WriteLow
 445  002c 84            	pop	a
 446                     ; 54 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
 448  002d 4b04          	push	#4
 449  002f ae500f        	ldw	x,#20495
 450  0032 cd0000        	call	_GPIO_WriteLow
 452  0035 84            	pop	a
 453                     ; 55 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
 455  0036 4b02          	push	#2
 456  0038 ae500a        	ldw	x,#20490
 457  003b cd0000        	call	_GPIO_WriteLow
 459  003e 84            	pop	a
 460                     ; 56 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
 462  003f 4b20          	push	#32
 463  0041 ae500a        	ldw	x,#20490
 464  0044 cd0000        	call	_GPIO_WriteLow
 466  0047 84            	pop	a
 467                     ; 57 }
 470  0048 81            	ret	
 495                     ; 58 void show_2(void)
 495                     ; 59 {//L_A_0;L_B_0;L_C_1;L_D_0;L_E_0;L_F_1;L_G_0;L_DP_1
 496                     .text:	section	.text,new
 497  0000               _show_2:
 501                     ; 60 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
 503  0000 4b08          	push	#8
 504  0002 ae500f        	ldw	x,#20495
 505  0005 cd0000        	call	_GPIO_WriteHigh
 507  0008 84            	pop	a
 508                     ; 61 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
 510  0009 4b01          	push	#1
 511  000b ae500f        	ldw	x,#20495
 512  000e cd0000        	call	_GPIO_WriteHigh
 514  0011 84            	pop	a
 515                     ; 62 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
 517  0012 4b04          	push	#4
 518  0014 ae500a        	ldw	x,#20490
 519  0017 cd0000        	call	_GPIO_WriteLow
 521  001a 84            	pop	a
 522                     ; 63 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
 524  001b 4b40          	push	#64
 525  001d ae500a        	ldw	x,#20490
 526  0020 cd0000        	call	_GPIO_WriteHigh
 528  0023 84            	pop	a
 529                     ; 64 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
 531  0024 4b80          	push	#128
 532  0026 ae500a        	ldw	x,#20490
 533  0029 cd0000        	call	_GPIO_WriteHigh
 535  002c 84            	pop	a
 536                     ; 65 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
 538  002d 4b04          	push	#4
 539  002f ae500f        	ldw	x,#20495
 540  0032 cd0000        	call	_GPIO_WriteLow
 542  0035 84            	pop	a
 543                     ; 66 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
 545  0036 4b02          	push	#2
 546  0038 ae500a        	ldw	x,#20490
 547  003b cd0000        	call	_GPIO_WriteHigh
 549  003e 84            	pop	a
 550                     ; 67 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
 552  003f 4b20          	push	#32
 553  0041 ae500a        	ldw	x,#20490
 554  0044 cd0000        	call	_GPIO_WriteLow
 556  0047 84            	pop	a
 557                     ; 68 }
 560  0048 81            	ret	
 585                     ; 69 void show_3(void)
 585                     ; 70 {//L_A_0;L_B_0;L_C_0;L_D_0;L_E_1;L_F_1;L_G_0;L_DP_1
 586                     .text:	section	.text,new
 587  0000               _show_3:
 591                     ; 71 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
 593  0000 4b08          	push	#8
 594  0002 ae500f        	ldw	x,#20495
 595  0005 cd0000        	call	_GPIO_WriteHigh
 597  0008 84            	pop	a
 598                     ; 72 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
 600  0009 4b01          	push	#1
 601  000b ae500f        	ldw	x,#20495
 602  000e cd0000        	call	_GPIO_WriteHigh
 604  0011 84            	pop	a
 605                     ; 73 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
 607  0012 4b04          	push	#4
 608  0014 ae500a        	ldw	x,#20490
 609  0017 cd0000        	call	_GPIO_WriteHigh
 611  001a 84            	pop	a
 612                     ; 74 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
 614  001b 4b40          	push	#64
 615  001d ae500a        	ldw	x,#20490
 616  0020 cd0000        	call	_GPIO_WriteHigh
 618  0023 84            	pop	a
 619                     ; 75 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);   //E   PC7
 621  0024 4b80          	push	#128
 622  0026 ae500a        	ldw	x,#20490
 623  0029 cd0000        	call	_GPIO_WriteLow
 625  002c 84            	pop	a
 626                     ; 76 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
 628  002d 4b04          	push	#4
 629  002f ae500f        	ldw	x,#20495
 630  0032 cd0000        	call	_GPIO_WriteLow
 632  0035 84            	pop	a
 633                     ; 77 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
 635  0036 4b02          	push	#2
 636  0038 ae500a        	ldw	x,#20490
 637  003b cd0000        	call	_GPIO_WriteHigh
 639  003e 84            	pop	a
 640                     ; 78 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);   //DOT PC5
 642  003f 4b20          	push	#32
 643  0041 ae500a        	ldw	x,#20490
 644  0044 cd0000        	call	_GPIO_WriteLow
 646  0047 84            	pop	a
 647                     ; 79 }
 650  0048 81            	ret	
 675                     ; 81 void show_4(void)
 675                     ; 82 {//L_A_1;L_B_0;L_C_0;L_D_1;L_E_1;L_F_0;L_G_0;L_DP_1
 676                     .text:	section	.text,new
 677  0000               _show_4:
 681                     ; 83 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
 683  0000 4b08          	push	#8
 684  0002 ae500f        	ldw	x,#20495
 685  0005 cd0000        	call	_GPIO_WriteLow
 687  0008 84            	pop	a
 688                     ; 84 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
 690  0009 4b01          	push	#1
 691  000b ae500f        	ldw	x,#20495
 692  000e cd0000        	call	_GPIO_WriteHigh
 694  0011 84            	pop	a
 695                     ; 85 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
 697  0012 4b04          	push	#4
 698  0014 ae500a        	ldw	x,#20490
 699  0017 cd0000        	call	_GPIO_WriteHigh
 701  001a 84            	pop	a
 702                     ; 86 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
 704  001b 4b40          	push	#64
 705  001d ae500a        	ldw	x,#20490
 706  0020 cd0000        	call	_GPIO_WriteLow
 708  0023 84            	pop	a
 709                     ; 87 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
 711  0024 4b80          	push	#128
 712  0026 ae500a        	ldw	x,#20490
 713  0029 cd0000        	call	_GPIO_WriteLow
 715  002c 84            	pop	a
 716                     ; 88 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
 718  002d 4b04          	push	#4
 719  002f ae500f        	ldw	x,#20495
 720  0032 cd0000        	call	_GPIO_WriteHigh
 722  0035 84            	pop	a
 723                     ; 89 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
 725  0036 4b02          	push	#2
 726  0038 ae500a        	ldw	x,#20490
 727  003b cd0000        	call	_GPIO_WriteHigh
 729  003e 84            	pop	a
 730                     ; 90 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
 732  003f 4b20          	push	#32
 733  0041 ae500a        	ldw	x,#20490
 734  0044 cd0000        	call	_GPIO_WriteLow
 736  0047 84            	pop	a
 737                     ; 91 }
 740  0048 81            	ret	
 765                     ; 93 void show_5(void)
 765                     ; 94 {//L_A_0;L_B_1;L_C_0;L_D_0;L_E_1;L_F_0;L_G_0;L_DP_1
 766                     .text:	section	.text,new
 767  0000               _show_5:
 771                     ; 95 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
 773  0000 4b08          	push	#8
 774  0002 ae500f        	ldw	x,#20495
 775  0005 cd0000        	call	_GPIO_WriteHigh
 777  0008 84            	pop	a
 778                     ; 96 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
 780  0009 4b01          	push	#1
 781  000b ae500f        	ldw	x,#20495
 782  000e cd0000        	call	_GPIO_WriteLow
 784  0011 84            	pop	a
 785                     ; 97 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
 787  0012 4b04          	push	#4
 788  0014 ae500a        	ldw	x,#20490
 789  0017 cd0000        	call	_GPIO_WriteHigh
 791  001a 84            	pop	a
 792                     ; 98 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
 794  001b 4b40          	push	#64
 795  001d ae500a        	ldw	x,#20490
 796  0020 cd0000        	call	_GPIO_WriteHigh
 798  0023 84            	pop	a
 799                     ; 99 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
 801  0024 4b80          	push	#128
 802  0026 ae500a        	ldw	x,#20490
 803  0029 cd0000        	call	_GPIO_WriteLow
 805  002c 84            	pop	a
 806                     ; 100 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
 808  002d 4b04          	push	#4
 809  002f ae500f        	ldw	x,#20495
 810  0032 cd0000        	call	_GPIO_WriteHigh
 812  0035 84            	pop	a
 813                     ; 101 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
 815  0036 4b02          	push	#2
 816  0038 ae500a        	ldw	x,#20490
 817  003b cd0000        	call	_GPIO_WriteHigh
 819  003e 84            	pop	a
 820                     ; 102 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
 822  003f 4b20          	push	#32
 823  0041 ae500a        	ldw	x,#20490
 824  0044 cd0000        	call	_GPIO_WriteLow
 826  0047 84            	pop	a
 827                     ; 103 }
 830  0048 81            	ret	
 855                     ; 105 void show_6(void)
 855                     ; 106 {//L_A_0;L_B_1;L_C_0;L_D_0;L_E_0;L_F_0;L_G_0;L_DP_1
 856                     .text:	section	.text,new
 857  0000               _show_6:
 861                     ; 107 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
 863  0000 4b08          	push	#8
 864  0002 ae500f        	ldw	x,#20495
 865  0005 cd0000        	call	_GPIO_WriteHigh
 867  0008 84            	pop	a
 868                     ; 108 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
 870  0009 4b01          	push	#1
 871  000b ae500f        	ldw	x,#20495
 872  000e cd0000        	call	_GPIO_WriteLow
 874  0011 84            	pop	a
 875                     ; 109 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
 877  0012 4b04          	push	#4
 878  0014 ae500a        	ldw	x,#20490
 879  0017 cd0000        	call	_GPIO_WriteHigh
 881  001a 84            	pop	a
 882                     ; 110 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
 884  001b 4b40          	push	#64
 885  001d ae500a        	ldw	x,#20490
 886  0020 cd0000        	call	_GPIO_WriteHigh
 888  0023 84            	pop	a
 889                     ; 111 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
 891  0024 4b80          	push	#128
 892  0026 ae500a        	ldw	x,#20490
 893  0029 cd0000        	call	_GPIO_WriteHigh
 895  002c 84            	pop	a
 896                     ; 112 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
 898  002d 4b04          	push	#4
 899  002f ae500f        	ldw	x,#20495
 900  0032 cd0000        	call	_GPIO_WriteHigh
 902  0035 84            	pop	a
 903                     ; 113 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
 905  0036 4b02          	push	#2
 906  0038 ae500a        	ldw	x,#20490
 907  003b cd0000        	call	_GPIO_WriteHigh
 909  003e 84            	pop	a
 910                     ; 114 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
 912  003f 4b20          	push	#32
 913  0041 ae500a        	ldw	x,#20490
 914  0044 cd0000        	call	_GPIO_WriteLow
 916  0047 84            	pop	a
 917                     ; 115 }
 920  0048 81            	ret	
 945                     ; 117 void show_7(void)
 945                     ; 118 {//L_A_0;L_B_0;L_C_0;L_D_1;L_E_1;L_F_1;L_G_1;L_DP_1
 946                     .text:	section	.text,new
 947  0000               _show_7:
 951                     ; 119 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
 953  0000 4b08          	push	#8
 954  0002 ae500f        	ldw	x,#20495
 955  0005 cd0000        	call	_GPIO_WriteHigh
 957  0008 84            	pop	a
 958                     ; 120 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
 960  0009 4b01          	push	#1
 961  000b ae500f        	ldw	x,#20495
 962  000e cd0000        	call	_GPIO_WriteHigh
 964  0011 84            	pop	a
 965                     ; 121 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
 967  0012 4b04          	push	#4
 968  0014 ae500a        	ldw	x,#20490
 969  0017 cd0000        	call	_GPIO_WriteHigh
 971  001a 84            	pop	a
 972                     ; 122 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
 974  001b 4b40          	push	#64
 975  001d ae500a        	ldw	x,#20490
 976  0020 cd0000        	call	_GPIO_WriteLow
 978  0023 84            	pop	a
 979                     ; 123 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
 981  0024 4b80          	push	#128
 982  0026 ae500a        	ldw	x,#20490
 983  0029 cd0000        	call	_GPIO_WriteLow
 985  002c 84            	pop	a
 986                     ; 124 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
 988  002d 4b04          	push	#4
 989  002f ae500f        	ldw	x,#20495
 990  0032 cd0000        	call	_GPIO_WriteLow
 992  0035 84            	pop	a
 993                     ; 125 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
 995  0036 4b02          	push	#2
 996  0038 ae500a        	ldw	x,#20490
 997  003b cd0000        	call	_GPIO_WriteLow
 999  003e 84            	pop	a
1000                     ; 126 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
1002  003f 4b20          	push	#32
1003  0041 ae500a        	ldw	x,#20490
1004  0044 cd0000        	call	_GPIO_WriteLow
1006  0047 84            	pop	a
1007                     ; 127 }
1010  0048 81            	ret	
1035                     ; 129 void show_8(void)
1035                     ; 130 {//L_A_0;L_B_0;L_C_0;L_D_0;L_E_0;L_F_0;L_G_0;L_DP_1
1036                     .text:	section	.text,new
1037  0000               _show_8:
1041                     ; 131 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
1043  0000 4b08          	push	#8
1044  0002 ae500f        	ldw	x,#20495
1045  0005 cd0000        	call	_GPIO_WriteHigh
1047  0008 84            	pop	a
1048                     ; 132 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
1050  0009 4b01          	push	#1
1051  000b ae500f        	ldw	x,#20495
1052  000e cd0000        	call	_GPIO_WriteHigh
1054  0011 84            	pop	a
1055                     ; 133 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
1057  0012 4b04          	push	#4
1058  0014 ae500a        	ldw	x,#20490
1059  0017 cd0000        	call	_GPIO_WriteHigh
1061  001a 84            	pop	a
1062                     ; 134 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
1064  001b 4b40          	push	#64
1065  001d ae500a        	ldw	x,#20490
1066  0020 cd0000        	call	_GPIO_WriteHigh
1068  0023 84            	pop	a
1069                     ; 135 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
1071  0024 4b80          	push	#128
1072  0026 ae500a        	ldw	x,#20490
1073  0029 cd0000        	call	_GPIO_WriteHigh
1075  002c 84            	pop	a
1076                     ; 136 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
1078  002d 4b04          	push	#4
1079  002f ae500f        	ldw	x,#20495
1080  0032 cd0000        	call	_GPIO_WriteHigh
1082  0035 84            	pop	a
1083                     ; 137 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
1085  0036 4b02          	push	#2
1086  0038 ae500a        	ldw	x,#20490
1087  003b cd0000        	call	_GPIO_WriteHigh
1089  003e 84            	pop	a
1090                     ; 138 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
1092  003f 4b20          	push	#32
1093  0041 ae500a        	ldw	x,#20490
1094  0044 cd0000        	call	_GPIO_WriteLow
1096  0047 84            	pop	a
1097                     ; 139 }
1100  0048 81            	ret	
1125                     ; 141 void show_9(void)
1125                     ; 142 {//L_A_0;L_B_0;L_C_0;L_D_0;L_E_1;L_F_0;L_G_0;L_DP_1
1126                     .text:	section	.text,new
1127  0000               _show_9:
1131                     ; 143 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
1133  0000 4b08          	push	#8
1134  0002 ae500f        	ldw	x,#20495
1135  0005 cd0000        	call	_GPIO_WriteHigh
1137  0008 84            	pop	a
1138                     ; 144 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
1140  0009 4b01          	push	#1
1141  000b ae500f        	ldw	x,#20495
1142  000e cd0000        	call	_GPIO_WriteHigh
1144  0011 84            	pop	a
1145                     ; 145 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
1147  0012 4b04          	push	#4
1148  0014 ae500a        	ldw	x,#20490
1149  0017 cd0000        	call	_GPIO_WriteHigh
1151  001a 84            	pop	a
1152                     ; 146 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
1154  001b 4b40          	push	#64
1155  001d ae500a        	ldw	x,#20490
1156  0020 cd0000        	call	_GPIO_WriteHigh
1158  0023 84            	pop	a
1159                     ; 147 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
1161  0024 4b80          	push	#128
1162  0026 ae500a        	ldw	x,#20490
1163  0029 cd0000        	call	_GPIO_WriteLow
1165  002c 84            	pop	a
1166                     ; 148 	GPIO_WriteHigh(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
1168  002d 4b04          	push	#4
1169  002f ae500f        	ldw	x,#20495
1170  0032 cd0000        	call	_GPIO_WriteHigh
1172  0035 84            	pop	a
1173                     ; 149 	GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_1);  //G   PC1
1175  0036 4b02          	push	#2
1176  0038 ae500a        	ldw	x,#20490
1177  003b cd0000        	call	_GPIO_WriteHigh
1179  003e 84            	pop	a
1180                     ; 150 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
1182  003f 4b20          	push	#32
1183  0041 ae500a        	ldw	x,#20490
1184  0044 cd0000        	call	_GPIO_WriteLow
1186  0047 84            	pop	a
1187                     ; 151 }
1190  0048 81            	ret	
1226                     ; 153 void show_dot(uint8_t on)
1226                     ; 154 {//
1227                     .text:	section	.text,new
1228  0000               _show_dot:
1232                     ; 155 	if(on)
1234  0000 4d            	tnz	a
1235  0001 270a          	jreq	L542
1236                     ; 156 		GPIO_WriteHigh(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
1238  0003 4b20          	push	#32
1239  0005 ae500a        	ldw	x,#20490
1240  0008 cd0000        	call	_GPIO_WriteHigh
1243  000b 2008          	jra	L742
1244  000d               L542:
1245                     ; 158 		GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);  //DOT PC5
1247  000d 4b20          	push	#32
1248  000f ae500a        	ldw	x,#20490
1249  0012 cd0000        	call	_GPIO_WriteLow
1251  0015               L742:
1252  0015 84            	pop	a
1253                     ; 159 }
1256  0016 81            	ret	
1280                     ; 161 void show_black(void)
1280                     ; 162 {//L_A_0;L_B_0;L_C_0;L_D_0;L_E_1;L_F_0;L_G_0;L_DP_1
1281                     .text:	section	.text,new
1282  0000               _show_black:
1286                     ; 163 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_3);   //A   PD3
1288  0000 4b08          	push	#8
1289  0002 ae500f        	ldw	x,#20495
1290  0005 cd0000        	call	_GPIO_WriteLow
1292  0008 84            	pop	a
1293                     ; 164 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_0);  //B   PD0
1295  0009 4b01          	push	#1
1296  000b ae500f        	ldw	x,#20495
1297  000e cd0000        	call	_GPIO_WriteLow
1299  0011 84            	pop	a
1300                     ; 165 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_2);  //C   PC2
1302  0012 4b04          	push	#4
1303  0014 ae500a        	ldw	x,#20490
1304  0017 cd0000        	call	_GPIO_WriteLow
1306  001a 84            	pop	a
1307                     ; 166 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_6);  //D   PC6
1309  001b 4b40          	push	#64
1310  001d ae500a        	ldw	x,#20490
1311  0020 cd0000        	call	_GPIO_WriteLow
1313  0023 84            	pop	a
1314                     ; 167 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_7);  //E   PC7
1316  0024 4b80          	push	#128
1317  0026 ae500a        	ldw	x,#20490
1318  0029 cd0000        	call	_GPIO_WriteLow
1320  002c 84            	pop	a
1321                     ; 168 	GPIO_WriteLow(LED_GPIOD_PORT, GPIO_PIN_2);	 //F   PD2
1323  002d 4b04          	push	#4
1324  002f ae500f        	ldw	x,#20495
1325  0032 cd0000        	call	_GPIO_WriteLow
1327  0035 84            	pop	a
1328                     ; 169 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_1);   //G   PC1
1330  0036 4b02          	push	#2
1331  0038 ae500a        	ldw	x,#20490
1332  003b cd0000        	call	_GPIO_WriteLow
1334  003e 84            	pop	a
1335                     ; 170 	GPIO_WriteLow(LED_GPIOC_PORT, GPIO_PIN_5);   //DOT PC5
1337  003f 4b20          	push	#32
1338  0041 ae500a        	ldw	x,#20490
1339  0044 cd0000        	call	_GPIO_WriteLow
1341  0047 84            	pop	a
1342                     ; 171 }
1345  0048 81            	ret	
1391                     .const:	section	.text
1392  0000               L214:
1393  0000 000b          	dc.w	L162
1394  0002 000e          	dc.w	L362
1395  0004 0011          	dc.w	L562
1396  0006 0014          	dc.w	L762
1397  0008 0017          	dc.w	L172
1398  000a 001a          	dc.w	L372
1399  000c 001d          	dc.w	L572
1400  000e 0020          	dc.w	L772
1401  0010 0023          	dc.w	L103
1402  0012 0026          	dc.w	L303
1403  0014 0029          	dc.w	L503
1404  0016 002d          	dc.w	L703
1405  0018 0031          	dc.w	L113
1406                     ; 173 void show_led(uint8_t num)
1406                     ; 174 {		
1407                     .text:	section	.text,new
1408  0000               _show_led:
1412                     ; 175 	switch (num){
1415                     ; 214 			break;
1416  0000 a10d          	cp	a,#13
1417  0002 2430          	jruge	L333
1418  0004 5f            	clrw	x
1419  0005 97            	ld	xl,a
1420  0006 58            	sllw	x
1421  0007 de0000        	ldw	x,(L214,x)
1422  000a fc            	jp	(x)
1423  000b               L162:
1424                     ; 176 		case 0:
1424                     ; 177 			show_0();
1427                     ; 178 			break;
1430  000b cc0000        	jp	_show_0
1431  000e               L362:
1432                     ; 179 		case 1:
1432                     ; 180 			show_1();
1435                     ; 181 			break;
1438  000e cc0000        	jp	_show_1
1439  0011               L562:
1440                     ; 182 		case 2:
1440                     ; 183 			show_2();
1443                     ; 184 			break;
1446  0011 cc0000        	jp	_show_2
1447  0014               L762:
1448                     ; 185 		case 3:
1448                     ; 186 			show_3();
1451                     ; 187 			break;
1454  0014 cc0000        	jp	_show_3
1455  0017               L172:
1456                     ; 188 		case 4:
1456                     ; 189 			show_4();
1459                     ; 190 			break;
1462  0017 cc0000        	jp	_show_4
1463  001a               L372:
1464                     ; 191 		case 5:
1464                     ; 192 			show_5();
1467                     ; 193 			break;
1470  001a cc0000        	jp	_show_5
1471  001d               L572:
1472                     ; 194 		case 6:
1472                     ; 195 			show_6();
1475                     ; 196 			break;
1478  001d cc0000        	jp	_show_6
1479  0020               L772:
1480                     ; 197 		case 7:
1480                     ; 198 			show_7();
1483                     ; 199 			break;
1486  0020 cc0000        	jp	_show_7
1487  0023               L103:
1488                     ; 200 		case 8:
1488                     ; 201 			show_8();
1491                     ; 202 			break;
1494  0023 cc0000        	jp	_show_8
1495  0026               L303:
1496                     ; 203 		case 9:
1496                     ; 204 			show_9();
1499                     ; 205 			break;
1502  0026 cc0000        	jp	_show_9
1503  0029               L503:
1504                     ; 206 		case 10:
1504                     ; 207 			show_dot(1);
1506  0029 a601          	ld	a,#1
1508                     ; 208 			break;
1510  002b 2001          	jp	LC001
1511  002d               L703:
1512                     ; 209 		case 11:
1512                     ; 210 			show_dot(0);
1514  002d 4f            	clr	a
1515  002e               LC001:
1517                     ; 211 			break;
1520  002e cc0000        	jp	_show_dot
1521  0031               L113:
1522                     ; 212 		case 12:
1522                     ; 213 			show_black();
1524  0031 cd0000        	call	_show_black
1526                     ; 214 			break;
1528  0034               L333:
1529                     ; 216 }
1532  0034 81            	ret	
1545                     	xdef	_show_led
1546                     	xdef	_show_black
1547                     	xdef	_show_dot
1548                     	xdef	_show_9
1549                     	xdef	_show_8
1550                     	xdef	_show_7
1551                     	xdef	_show_6
1552                     	xdef	_show_5
1553                     	xdef	_show_4
1554                     	xdef	_show_3
1555                     	xdef	_show_2
1556                     	xdef	_show_1
1557                     	xdef	_show_0
1558                     	xdef	_dig_ctl_3
1559                     	xdef	_dig_ctl_2
1560                     	xdef	_dig_ctl_1
1561                     	xdef	_led_gpio_init
1562                     	xref	_GPIO_WriteLow
1563                     	xref	_GPIO_WriteHigh
1564                     	xref	_GPIO_Init
1583                     	end
