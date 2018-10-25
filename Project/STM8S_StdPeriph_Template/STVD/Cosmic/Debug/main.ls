   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  49                     ; 36 void main(void)
  49                     ; 37 {
  51                     .text:	section	.text,new
  52  0000               _main:
  56  0000               L12:
  57  0000 20fe          	jra	L12
  92                     ; 54 void assert_failed(u8* file, u32 line)
  92                     ; 55 { 
  93                     .text:	section	.text,new
  94  0000               _assert_failed:
  98  0000               L34:
  99  0000 20fe          	jra	L34
 112                     	xdef	_main
 113                     	xdef	_assert_failed
 132                     	end
