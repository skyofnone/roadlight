   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  61                     ; 14 void delay1380(void)
  61                     ; 15 {
  63                     .text:	section	.text,new
  64  0000               _delay1380:
  66  0000 88            	push	a
  67       00000001      OFST:	set	1
  70                     ; 16 		u8 i = 0 ;
  72                     ; 18 		for(i=10;i>0;i--)
  74  0001 a60a          	ld	a,#10
  75  0003 6b01          	ld	(OFST+0,sp),a
  76  0005               L72:
  77                     ; 20 				_asm("nop");
  80  0005 9d            	nop	
  82                     ; 21 				_asm("nop");
  85  0006 9d            	nop	
  87                     ; 22 				_asm("nop");
  90  0007 9d            	nop	
  92                     ; 23 				_asm("nop");
  95  0008 9d            	nop	
  97                     ; 24 				_asm("nop");
 100  0009 9d            	nop	
 102                     ; 25 				_asm("nop");
 105  000a 9d            	nop	
 107                     ; 26 				_asm("nop");	
 110  000b 9d            	nop	
 112                     ; 18 		for(i=10;i>0;i--)
 114  000c 0a01          	dec	(OFST+0,sp)
 117  000e 26f5          	jrne	L72
 118                     ; 28 }
 121  0010 84            	pop	a
 122  0011 81            	ret	
 166                     ; 38 void HT1380WriteByte(u8 Dat)
 166                     ; 39 {
 167                     .text:	section	.text,new
 168  0000               _HT1380WriteByte:
 170  0000 88            	push	a
 171  0001 88            	push	a
 172       00000001      OFST:	set	1
 175                     ; 40 		u8 i = 0 ;
 177                     ; 42 		HT1380SLK_LOW ;
 179  0002 72195005      	bres	20485,#4
 180                     ; 43 		for(i=0;i<8;i++)
 182  0006 0f01          	clr	(OFST+0,sp)
 183  0008               L75:
 184                     ; 45 				if(Dat & 0x01)
 186  0008 7b02          	ld	a,(OFST+1,sp)
 187  000a a501          	bcp	a,#1
 188  000c 2706          	jreq	L56
 189                     ; 47 						HT1380DAT_HIGH ;
 191  000e 721a5005      	bset	20485,#5
 193  0012 2004          	jra	L76
 194  0014               L56:
 195                     ; 51 						HT1380DAT_LOW ;
 197  0014 721b5005      	bres	20485,#5
 198  0018               L76:
 199                     ; 53 				Dat >>= 1 ;
 201  0018 0402          	srl	(OFST+1,sp)
 202                     ; 55 				HT1380SLK_HIGH ;
 204  001a 72185005      	bset	20485,#4
 205                     ; 56 				delay1380();
 207  001e cd0000        	call	_delay1380
 209                     ; 57 				HT1380SLK_LOW ;
 211  0021 72195005      	bres	20485,#4
 212                     ; 58 				delay1380();	
 214  0025 cd0000        	call	_delay1380
 216                     ; 43 		for(i=0;i<8;i++)
 218  0028 0c01          	inc	(OFST+0,sp)
 221  002a 7b01          	ld	a,(OFST+0,sp)
 222  002c a108          	cp	a,#8
 223  002e 25d8          	jrult	L75
 224                     ; 61 }
 227  0030 85            	popw	x
 228  0031 81            	ret	
 272                     ; 71 u8 HT1380ReadByte(void)
 272                     ; 72 {
 273                     .text:	section	.text,new
 274  0000               _HT1380ReadByte:
 276  0000 89            	pushw	x
 277       00000002      OFST:	set	2
 280                     ; 73 		u8 i = 0 ;
 282                     ; 74 		u8 Dat=0 ;
 284  0001 0f02          	clr	(OFST+0,sp)
 285                     ; 76 		HT1380DAT_HIGH ; //数据置高后再读  双向口
 287  0003 721a5005      	bset	20485,#5
 288                     ; 77 		delay1380();
 290  0007 cd0000        	call	_delay1380
 292                     ; 79 		if(HT1380DatIn)
 294  000a c65006        	ld	a,20486
 295  000d a420          	and	a,#32
 296  000f c75006        	ld	20486,a
 297  0012 2706          	jreq	L311
 298                     ; 81 				Dat |= 0x80 ;	
 300  0014 7b02          	ld	a,(OFST+0,sp)
 301  0016 aa80          	or	a,#128
 302  0018 6b02          	ld	(OFST+0,sp),a
 303  001a               L311:
 304                     ; 84 		for(i=0;i<7;i++)
 306  001a 0f01          	clr	(OFST-1,sp)
 307  001c               L511:
 308                     ; 86 				HT1380SLK_HIGH ;
 310  001c 72185005      	bset	20485,#4
 311                     ; 87 				delay1380();
 313  0020 cd0000        	call	_delay1380
 315                     ; 88 				HT1380SLK_LOW ;
 317  0023 72195005      	bres	20485,#4
 318                     ; 89 				delay1380();
 320  0027 cd0000        	call	_delay1380
 322                     ; 91 				Dat >>= 1 ;					
 324  002a 0402          	srl	(OFST+0,sp)
 325                     ; 92 				if(HT1380DatIn)
 327  002c c65006        	ld	a,20486
 328  002f a420          	and	a,#32
 329  0031 c75006        	ld	20486,a
 330  0034 2706          	jreq	L321
 331                     ; 94 						Dat |= 0x80 ;	
 333  0036 7b02          	ld	a,(OFST+0,sp)
 334  0038 aa80          	or	a,#128
 335  003a 6b02          	ld	(OFST+0,sp),a
 336  003c               L321:
 337                     ; 84 		for(i=0;i<7;i++)
 339  003c 0c01          	inc	(OFST-1,sp)
 342  003e 7b01          	ld	a,(OFST-1,sp)
 343  0040 a107          	cp	a,#7
 344  0042 25d8          	jrult	L511
 345                     ; 99 		return Dat ;
 347  0044 7b02          	ld	a,(OFST+0,sp)
 350  0046 85            	popw	x
 351  0047 81            	ret	
 396                     ; 110 void HT1380WriteByteAddr(u8 ucAddr, u8 ucDa)
 396                     ; 111 {
 397                     .text:	section	.text,new
 398  0000               _HT1380WriteByteAddr:
 400       00000000      OFST:	set	0
 403                     ; 112 		HT1380RST_LOW;
 405  0000 721d5005      	bres	20485,#6
 406                     ; 113 		HT1380SLK_LOW;
 408  0004 72195005      	bres	20485,#4
 409  0008 89            	pushw	x
 410                     ; 114 		HT1380RST_HIGH;
 412  0009 721c5005      	bset	20485,#6
 413                     ; 115 		HT1380WriteByte(ucAddr); /* 地址,命令 */
 415  000d 9e            	ld	a,xh
 416  000e cd0000        	call	_HT1380WriteByte
 418                     ; 116 		HT1380WriteByte(ucDa); /* 写1Byte数据*/
 420  0011 7b02          	ld	a,(OFST+2,sp)
 421  0013 cd0000        	call	_HT1380WriteByte
 423                     ; 117 		HT1380SLK_HIGH;
 425  0016 72185005      	bset	20485,#4
 426                     ; 118 		HT1380RST_LOW;
 428                     ; 119 }
 431  001a 85            	popw	x
 432  001b 721d5005      	bres	20485,#6
 433  001f 81            	ret	
 478                     ; 129 u8 HT1380ReadByteAddr(u8 ucAddr)
 478                     ; 130 {
 479                     .text:	section	.text,new
 480  0000               _HT1380ReadByteAddr:
 482       00000001      OFST:	set	1
 485                     ; 132     HT1380RST_LOW;
 487  0000 721d5005      	bres	20485,#6
 488                     ; 133     HT1380SLK_LOW;
 490  0004 72195005      	bres	20485,#4
 491  0008 88            	push	a
 492                     ; 134     HT1380RST_HIGH;
 494  0009 721c5005      	bset	20485,#6
 495                     ; 135     HT1380WriteByte(ucAddr); /* 地址,命令 */
 497  000d cd0000        	call	_HT1380WriteByte
 499                     ; 136     ucDa = HT1380ReadByte(); /* 读1Byte数据 */
 501  0010 cd0000        	call	_HT1380ReadByte
 503  0013 6b01          	ld	(OFST+0,sp),a
 504                     ; 137     HT1380SLK_HIGH;
 506  0015 72185005      	bset	20485,#4
 507                     ; 138     HT1380RST_LOW;
 509                     ; 140     return(ucDa);
 513  0019 5b01          	addw	sp,#1
 514  001b 721d5005      	bres	20485,#6
 515  001f 81            	ret	
 569                     ; 153 void HT1380SetTime(uint8_t *pSecDa)
 569                     ; 154 {
 570                     .text:	section	.text,new
 571  0000               _HT1380SetTime:
 573  0000 89            	pushw	x
 574  0001 89            	pushw	x
 575       00000002      OFST:	set	2
 578                     ; 156 		u8 ucAddr = 0x80;
 580  0002 a680          	ld	a,#128
 581  0004 6b01          	ld	(OFST-1,sp),a
 582                     ; 158 		HT1380WriteByteAddr(0x8e,0x00); /* 控制命令,WP=0,写操作?*/
 584  0006 ae8e00        	ldw	x,#36352
 585  0009 cd0000        	call	_HT1380WriteByteAddr
 587                     ; 159 		for(i = Long_ReadData;i>0;i--)
 589  000c a603          	ld	a,#3
 590  000e 6b02          	ld	(OFST+0,sp),a
 591  0010               L712:
 592                     ; 161 				HT1380WriteByteAddr(ucAddr,*pSecDa); /* 秒 分 时 日 月 星期 年 */
 594  0010 1e03          	ldw	x,(OFST+1,sp)
 595  0012 f6            	ld	a,(x)
 596  0013 97            	ld	xl,a
 597  0014 7b01          	ld	a,(OFST-1,sp)
 598  0016 95            	ld	xh,a
 599  0017 cd0000        	call	_HT1380WriteByteAddr
 601                     ; 163 				pSecDa++;
 603  001a 1e03          	ldw	x,(OFST+1,sp)
 604  001c 5c            	incw	x
 605  001d 1f03          	ldw	(OFST+1,sp),x
 606                     ; 164 				ucAddr += 2;
 608  001f 0c01          	inc	(OFST-1,sp)
 609  0021 0c01          	inc	(OFST-1,sp)
 610                     ; 159 		for(i = Long_ReadData;i>0;i--)
 612  0023 0a02          	dec	(OFST+0,sp)
 615  0025 26e9          	jrne	L712
 616                     ; 166 		HT1380WriteByteAddr(0x8e,0x80); /* 控制命令,WP=1,写保护?*/
 618  0027 ae8e80        	ldw	x,#36480
 619  002a cd0000        	call	_HT1380WriteByteAddr
 621                     ; 167 }
 624  002d 5b04          	addw	sp,#4
 625  002f 81            	ret	
 679                     ; 178 void HT1380ReadTime(uint8_t *ucCurtime)
 679                     ; 179 {
 680                     .text:	section	.text,new
 681  0000               _HT1380ReadTime:
 683  0000 89            	pushw	x
 684  0001 89            	pushw	x
 685       00000002      OFST:	set	2
 688                     ; 181     u8 ucAddr = 0x81;
 690  0002 a681          	ld	a,#129
 691  0004 6b01          	ld	(OFST-1,sp),a
 692                     ; 183     for (i=0;i<Long_ReadData;i++)
 694  0006 0f02          	clr	(OFST+0,sp)
 695  0008               L352:
 696                     ; 185        *ucCurtime = HT1380ReadByteAddr(ucAddr);/*格式为: 秒 分 时 日 月 星期 年 */
 698  0008 7b01          	ld	a,(OFST-1,sp)
 699  000a cd0000        	call	_HT1380ReadByteAddr
 701  000d 1e03          	ldw	x,(OFST+1,sp)
 702  000f f7            	ld	(x),a
 703                     ; 186        ucCurtime ++;
 705  0010 5c            	incw	x
 706  0011 1f03          	ldw	(OFST+1,sp),x
 707                     ; 187        ucAddr += 2;
 709  0013 0c01          	inc	(OFST-1,sp)
 710  0015 0c01          	inc	(OFST-1,sp)
 711                     ; 183     for (i=0;i<Long_ReadData;i++)
 713  0017 0c02          	inc	(OFST+0,sp)
 716  0019 7b02          	ld	a,(OFST+0,sp)
 717  001b a103          	cp	a,#3
 718  001d 25e9          	jrult	L352
 719                     ; 189 }
 722  001f 5b04          	addw	sp,#4
 723  0021 81            	ret	
 747                     ; 197 void Init_TH1380(void)
 747                     ; 198 {
 748                     .text:	section	.text,new
 749  0000               _Init_TH1380:
 753                     ; 203 		HT1380WriteByteAddr(0x8e,0x00); /* 控制命令,WP=0,写操作?*/
 755  0000 ae8e00        	ldw	x,#36352
 756  0003 cd0000        	call	_HT1380WriteByteAddr
 758                     ; 205 		HT1380WriteByteAddr(0x80,HT1380OSC_ENB);//振荡允许
 760  0006 ae8000        	ldw	x,#32768
 761  0009 cd0000        	call	_HT1380WriteByteAddr
 763                     ; 206 		HT1380WriteByteAddr(0x84,MCLOCK24H);//24小时制
 765  000c ae8400        	ldw	x,#33792
 766  000f cd0000        	call	_HT1380WriteByteAddr
 768                     ; 208 		HT1380WriteByteAddr(0x8e,0x80); /* 控制命令,WP=1,写保护?*/
 770  0012 ae8e80        	ldw	x,#36480
 772                     ; 209 }
 775  0015 cc0000        	jp	_HT1380WriteByteAddr
 820                     ; 217 void ClockSwitchMCU(uint8_t *ClockDat,uint8_t *McuDat)
 820                     ; 218 {
 821                     .text:	section	.text,new
 822  0000               _ClockSwitchMCU:
 824  0000 89            	pushw	x
 825  0001 88            	push	a
 826       00000001      OFST:	set	1
 829                     ; 219 		*McuDat = ClockSwitch_TSEC(*ClockDat) ;
 831  0002 f6            	ld	a,(x)
 832  0003 a40f          	and	a,#15
 833  0005 6b01          	ld	(OFST+0,sp),a
 834  0007 ad3f          	call	LC001
 835  0009 1e06          	ldw	x,(OFST+5,sp)
 836  000b 1b01          	add	a,(OFST+0,sp)
 837  000d f7            	ld	(x),a
 838                     ; 220 		ClockDat ++ ; 
 840  000e 1e02          	ldw	x,(OFST+1,sp)
 841  0010 5c            	incw	x
 842  0011 1f02          	ldw	(OFST+1,sp),x
 843                     ; 221 		McuDat ++ ;
 845  0013 1e06          	ldw	x,(OFST+5,sp)
 846  0015 5c            	incw	x
 847  0016 1f06          	ldw	(OFST+5,sp),x
 848                     ; 222 		*McuDat = ClockSwitch_TMIN(*ClockDat) ;
 850  0018 1e02          	ldw	x,(OFST+1,sp)
 851  001a f6            	ld	a,(x)
 852  001b a40f          	and	a,#15
 853  001d 6b01          	ld	(OFST+0,sp),a
 854  001f ad27          	call	LC001
 855  0021 1e06          	ldw	x,(OFST+5,sp)
 856  0023 1b01          	add	a,(OFST+0,sp)
 857  0025 f7            	ld	(x),a
 858                     ; 223 		ClockDat ++ ; 
 860  0026 1e02          	ldw	x,(OFST+1,sp)
 861  0028 5c            	incw	x
 862  0029 1f02          	ldw	(OFST+1,sp),x
 863                     ; 224 		McuDat ++ ;
 865  002b 1e06          	ldw	x,(OFST+5,sp)
 866  002d 5c            	incw	x
 867  002e 1f06          	ldw	(OFST+5,sp),x
 868                     ; 225 		*McuDat = ClockSwitch_THOR(*ClockDat) ;	
 870  0030 1e02          	ldw	x,(OFST+1,sp)
 871  0032 f6            	ld	a,(x)
 872  0033 a40f          	and	a,#15
 873  0035 6b01          	ld	(OFST+0,sp),a
 874  0037 f6            	ld	a,(x)
 875  0038 4e            	swap	a
 876  0039 a403          	and	a,#3
 877  003b 97            	ld	xl,a
 878  003c a60a          	ld	a,#10
 879  003e 42            	mul	x,a
 880  003f 9f            	ld	a,xl
 881  0040 1e06          	ldw	x,(OFST+5,sp)
 882  0042 1b01          	add	a,(OFST+0,sp)
 883  0044 f7            	ld	(x),a
 884                     ; 227 }
 887  0045 5b03          	addw	sp,#3
 888  0047 81            	ret	
 889  0048               LC001:
 890  0048 f6            	ld	a,(x)
 891  0049 4e            	swap	a
 892  004a a407          	and	a,#7
 893  004c 97            	ld	xl,a
 894  004d a60a          	ld	a,#10
 895  004f 42            	mul	x,a
 896  0050 9f            	ld	a,xl
 897  0051 81            	ret	
 942                     ; 235 void MCUSwitchClock(uint8_t *McuDat,uint8_t *ClockDat)
 942                     ; 236 {
 943                     .text:	section	.text,new
 944  0000               _MCUSwitchClock:
 946  0000 89            	pushw	x
 947  0001 89            	pushw	x
 948       00000002      OFST:	set	2
 951                     ; 237 		*ClockDat = ClockSwitchB_TSEC(*McuDat) ;
 953  0002 ad52          	call	LC003
 955  0004 1f01          	ldw	(OFST-1,sp),x
 956  0006 1e03          	ldw	x,(OFST+1,sp)
 957  0008 ad3f          	call	LC002
 958  000a 72fb01        	addw	x,(OFST-1,sp)
 959  000d 1607          	ldw	y,(OFST+5,sp)
 960  000f 01            	rrwa	x,a
 961  0010 90f7          	ld	(y),a
 962                     ; 238 		ClockDat ++ ; 
 964  0012 1e07          	ldw	x,(OFST+5,sp)
 965  0014 5c            	incw	x
 966  0015 1f07          	ldw	(OFST+5,sp),x
 967                     ; 239 		McuDat ++ ;
 969  0017 1e03          	ldw	x,(OFST+1,sp)
 970  0019 5c            	incw	x
 971  001a 1f03          	ldw	(OFST+1,sp),x
 972                     ; 240 		*ClockDat = ClockSwitchB_TMIN(*McuDat) ;
 974  001c ad38          	call	LC003
 976  001e 1f01          	ldw	(OFST-1,sp),x
 977  0020 1e03          	ldw	x,(OFST+1,sp)
 978  0022 ad25          	call	LC002
 979  0024 72fb01        	addw	x,(OFST-1,sp)
 980  0027 1607          	ldw	y,(OFST+5,sp)
 981  0029 01            	rrwa	x,a
 982  002a 90f7          	ld	(y),a
 983                     ; 241 		ClockDat ++ ; 
 985  002c 1e07          	ldw	x,(OFST+5,sp)
 986  002e 5c            	incw	x
 987  002f 1f07          	ldw	(OFST+5,sp),x
 988                     ; 242 		McuDat ++ ;
 990  0031 1e03          	ldw	x,(OFST+1,sp)
 991  0033 5c            	incw	x
 992  0034 1f03          	ldw	(OFST+1,sp),x
 993                     ; 243 		*ClockDat = ClockSwitchB_THOR(*McuDat) ;	
 995  0036 ad1e          	call	LC003
 997  0038 1f01          	ldw	(OFST-1,sp),x
 998  003a 1e03          	ldw	x,(OFST+1,sp)
 999  003c ad0b          	call	LC002
1000  003e 72fb01        	addw	x,(OFST-1,sp)
1001  0041 1607          	ldw	y,(OFST+5,sp)
1002  0043 01            	rrwa	x,a
1003  0044 90f7          	ld	(y),a
1004                     ; 245 }
1007  0046 5b04          	addw	sp,#4
1008  0048 81            	ret	
1009  0049               LC002:
1010  0049 f6            	ld	a,(x)
1011  004a 5f            	clrw	x
1012  004b 97            	ld	xl,a
1013  004c a60a          	ld	a,#10
1014  004e cd0000        	call	c_sdivx
1016  0051 58            	sllw	x
1017  0052 58            	sllw	x
1018  0053 58            	sllw	x
1019  0054 58            	sllw	x
1020  0055 81            	ret	
1021  0056               LC003:
1022  0056 f6            	ld	a,(x)
1023  0057 5f            	clrw	x
1024  0058 97            	ld	xl,a
1025  0059 a60a          	ld	a,#10
1026  005b cc0000        	jp	c_smodx
1039                     	xdef	_HT1380ReadByteAddr
1040                     	xdef	_HT1380WriteByteAddr
1041                     	xdef	_HT1380ReadByte
1042                     	xdef	_HT1380WriteByte
1043                     	xdef	_delay1380
1044                     	xdef	_MCUSwitchClock
1045                     	xdef	_ClockSwitchMCU
1046                     	xdef	_Init_TH1380
1047                     	xdef	_HT1380ReadTime
1048                     	xdef	_HT1380SetTime
1049                     	xref.b	c_x
1068                     	xref	c_smodx
1069                     	xref	c_smody
1070                     	xref	c_sdivx
1071                     	end
