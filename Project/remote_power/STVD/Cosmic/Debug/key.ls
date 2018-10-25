   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  21                     	bsct
  22  0000               _value1:
  23  0000 0000          	dc.w	0
  24  0002               _value3:
  25  0002 0000          	dc.w	0
  58                     ; 8 void Init_ADC1(void)
  58                     ; 9 {
  60                     .text:	section	.text,new
  61  0000               _Init_ADC1:
  65                     ; 10   	GPIO_Init(GPIOB, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);      //引脚初始化  初始化ADC通道引脚
  67  0000 4b00          	push	#0
  68  0002 4b02          	push	#2
  69  0004 ae5005        	ldw	x,#20485
  70  0007 cd0000        	call	_GPIO_Init
  72  000a 85            	popw	x
  73                     ; 11 	ADC1_DeInit();
  75  000b cd0000        	call	_ADC1_DeInit
  77                     ; 12         ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,      //单次转换
  77                     ; 13                   ADC1_CHANNEL_1,                  //通道
  77                     ; 14                   ADC1_PRESSEL_FCPU_D2,            //预定标器选择 分频器  fMASTER 可以被分频 2 到 18
  77                     ; 15                   ADC1_EXTTRIG_TIM,                //从内部的TIM1 TRGO事件转换
  77                     ; 16                   DISABLE,                         //是否使能该触发方式
  77                     ; 17                   ADC1_ALIGN_RIGHT,                //对齐方式（可以左右对齐）
  77                     ; 18                   ADC1_SCHMITTTRIG_CHANNEL1,       //指定触发通道
  77                     ; 19                   ENABLE);                         //是否使能指定触发通道
  79  000e 4b01          	push	#1
  80  0010 4b01          	push	#1
  81  0012 4b08          	push	#8
  82  0014 4b00          	push	#0
  83  0016 4b00          	push	#0
  84  0018 4b00          	push	#0
  85  001a ae0001        	ldw	x,#1
  86  001d cd0000        	call	_ADC1_Init
  88  0020 5b06          	addw	sp,#6
  89                     ; 20         ADC1_Cmd(ENABLE);                          //使能ADC
  91  0022 a601          	ld	a,#1
  93                     ; 21 }
  96  0024 cc0000        	jp	_ADC1_Cmd
 124                     ; 23 uint16_t Get_Ad1(void)
 124                     ; 24 {
 125                     .text:	section	.text,new
 126  0000               _Get_Ad1:
 130                     ; 26   ADC1_StartConversion();                      //启动AD转换
 132  0000 cd0000        	call	_ADC1_StartConversion
 135  0003               L33:
 136                     ; 27   while(RESET == ADC1_GetFlagStatus(ADC1_FLAG_EOC));   //等待转换完成
 138  0003 a680          	ld	a,#128
 139  0005 cd0000        	call	_ADC1_GetFlagStatus
 141  0008 4d            	tnz	a
 142  0009 27f8          	jreq	L33
 143                     ; 28   ADC1_ClearFlag(ADC1_FLAG_EOC);               //清除标志
 145  000b a680          	ld	a,#128
 146  000d cd0000        	call	_ADC1_ClearFlag
 148                     ; 29   value1 = ADC1_GetConversionValue();            //读取AD值 
 150  0010 cd0000        	call	_ADC1_GetConversionValue
 152  0013 bf00          	ldw	_value1,x
 153                     ; 30   return value1;
 157  0015 81            	ret	
 184                     ; 33 void Init_ADC3(void)
 184                     ; 34 {
 185                     .text:	section	.text,new
 186  0000               _Init_ADC3:
 190                     ; 35   	GPIO_Init(GPIOB, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT);      //引脚初始化  初始化ADC通道引脚
 192  0000 4b00          	push	#0
 193  0002 4b02          	push	#2
 194  0004 ae5005        	ldw	x,#20485
 195  0007 cd0000        	call	_GPIO_Init
 197  000a 85            	popw	x
 198                     ; 36 	ADC1_DeInit();
 200  000b cd0000        	call	_ADC1_DeInit
 202                     ; 37         ADC1_Init(ADC1_CONVERSIONMODE_SINGLE,      //单次转换
 202                     ; 38                   ADC1_CHANNEL_3,                  //通道
 202                     ; 39                   ADC1_PRESSEL_FCPU_D2,            //预定标器选择 分频器  fMASTER 可以被分频 2 到 18
 202                     ; 40                   ADC1_EXTTRIG_TIM,                //从内部的TIM1 TRGO事件转换
 202                     ; 41                   DISABLE,                         //是否使能该触发方式
 202                     ; 42                   ADC1_ALIGN_RIGHT,                //对齐方式（可以左右对齐）
 202                     ; 43                   ADC1_SCHMITTTRIG_CHANNEL3,       //指定触发通道
 202                     ; 44                   ENABLE);                         //是否使能指定触发通道
 204  000e 4b01          	push	#1
 205  0010 4b03          	push	#3
 206  0012 4b08          	push	#8
 207  0014 4b00          	push	#0
 208  0016 4b00          	push	#0
 209  0018 4b00          	push	#0
 210  001a ae0003        	ldw	x,#3
 211  001d cd0000        	call	_ADC1_Init
 213  0020 5b06          	addw	sp,#6
 214                     ; 45         ADC1_Cmd(ENABLE);                          //使能ADC
 216  0022 a601          	ld	a,#1
 218                     ; 46 }
 221  0024 cc0000        	jp	_ADC1_Cmd
 249                     ; 48 uint16_t Get_Ad3(void)
 249                     ; 49 {
 250                     .text:	section	.text,new
 251  0000               _Get_Ad3:
 255                     ; 51   ADC1_StartConversion();                      //启动AD转换
 257  0000 cd0000        	call	_ADC1_StartConversion
 260  0003               L16:
 261                     ; 52   while(RESET == ADC1_GetFlagStatus(ADC1_FLAG_EOC));   //等待转换完成
 263  0003 a680          	ld	a,#128
 264  0005 cd0000        	call	_ADC1_GetFlagStatus
 266  0008 4d            	tnz	a
 267  0009 27f8          	jreq	L16
 268                     ; 53   ADC1_ClearFlag(ADC1_FLAG_EOC);               //清除标志
 270  000b a680          	ld	a,#128
 271  000d cd0000        	call	_ADC1_ClearFlag
 273                     ; 54   value3 = ADC1_GetConversionValue();            //读取AD值 
 275  0010 cd0000        	call	_ADC1_GetConversionValue
 277  0013 bf02          	ldw	_value3,x
 278                     ; 55   return value3;
 282  0015 81            	ret	
 315                     	xdef	_value3
 316                     	xdef	_value1
 317                     	xdef	_Get_Ad3
 318                     	xdef	_Init_ADC3
 319                     	xdef	_Get_Ad1
 320                     	xdef	_Init_ADC1
 321                     	xref	_GPIO_Init
 322                     	xref	_ADC1_ClearFlag
 323                     	xref	_ADC1_GetFlagStatus
 324                     	xref	_ADC1_GetConversionValue
 325                     	xref	_ADC1_StartConversion
 326                     	xref	_ADC1_Cmd
 327                     	xref	_ADC1_Init
 328                     	xref	_ADC1_DeInit
 347                     	end
