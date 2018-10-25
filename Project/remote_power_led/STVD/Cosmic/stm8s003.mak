# ST Visual Debugger Generated MAKE File, based on stm8s003.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=D:\PROGRA~1\STMICR~1\ST_TOO~1\stlink\x86
ToolsetBin=D:\Program Files (x86)\STMicroelectronics\st_toolset\stlink\x86
ToolsetInc=D:\Program Files (x86)\STMicroelectronics\st_toolset\stlink\x86\Hstm8
ToolsetLib=D:\Program Files (x86)\STMicroelectronics\st_toolset\stlink\x86\Lib
ToolsetIncOpts=-i"D:\Program Files (x86)\STMicroelectronics\st_toolset\stlink\x86\Hstm8" 
ToolsetLibOpts=-l"D:\Program Files (x86)\STMicroelectronics\st_toolset\stlink\x86\Lib" 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))


# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=Debug
ProjectSFile=stm8s003
TargetSName=$(ProjectSFile)
TargetFName=$(ProjectSFile).elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +mods0 +debug -pxp +compact +split -pp -l -dSTM8S003 -i..\.. -i..\..\..\stm8s_stdperiph_template -i..\..\..\..\libraries\stm8s_stdperiph_driver\inc $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) $(ProjectSFile).elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Debug\rtc.$(ObjectExt) : ..\..\rtc.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\function.h ..\..\rtc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\ir_receive.$(ObjectExt) : ..\..\ir_receive.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\function.h ..\..\ir_receive.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\key.$(ObjectExt) : ..\..\key.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\function.h ..\..\key.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\main.$(ObjectExt) : ..\..\main.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\function.h ..\..\ir_receive.h ..\..\key.h ..\..\rtc.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_it.$(ObjectExt) : ..\..\stm8s_it.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\stm8s_it.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\ir_receive.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\stm8s_it.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_adc1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_adc1.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_awu.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_awu.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_beep.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_beep.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_clk.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_exti.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_exti.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_flash.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_flash.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_gpio.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_i2c.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_i2c.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_itc.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_itc.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_iwdg.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_iwdg.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_rst.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_rst.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_spi.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_spi.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim1.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim2.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim2.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim4.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim4.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_uart1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_uart1.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_wwdg.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_wwdg.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

$(ProjectSFile).elf :  $(OutputPath)\rtc.o $(OutputPath)\ir_receive.o $(OutputPath)\key.o $(OutputPath)\main.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_iwdg.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\stm8s003.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 -m$(OutputPath)\$(TargetSName).map $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\rtc.o
	-@erase $(OutputPath)\ir_receive.o
	-@erase $(OutputPath)\key.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_iwdg.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\stm8s003.elf
	-@erase $(OutputPath)\stm8s003.elf
	-@erase $(OutputPath)\stm8s003.map
	-@erase $(OutputPath)\rtc.ls
	-@erase $(OutputPath)\ir_receive.ls
	-@erase $(OutputPath)\key.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_iwdg.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
endif

# 
# Release
# 
ifeq "$(CFG)" "Release"


OutputPath=Release
ProjectSFile=stm8s003
TargetSName=stm8s003
TargetFName=stm8s003.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  -i..\.. +mods0 -pp $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $< 
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) stm8s003.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Release\rtc.$(ObjectExt) : ..\..\rtc.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\function.h ..\..\rtc.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\ir_receive.$(ObjectExt) : ..\..\ir_receive.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\function.h ..\..\ir_receive.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\key.$(ObjectExt) : ..\..\key.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\function.h ..\..\key.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\main.$(ObjectExt) : ..\..\main.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\function.h ..\..\ir_receive.h ..\..\key.h ..\..\rtc.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_it.$(ObjectExt) : ..\..\stm8s_it.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\stm8s_it.h ..\..\ir_receive.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h ..\..\stm8s_it.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_adc1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_adc1.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_awu.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_awu.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_beep.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_beep.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_clk.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_exti.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_exti.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_flash.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_flash.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_gpio.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_i2c.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_i2c.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_itc.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_itc.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_iwdg.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_iwdg.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_rst.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_rst.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_spi.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_spi.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim1.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim2.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim2.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim4.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim4.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_uart1.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_uart1.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_wwdg.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_wwdg.c ..\..\..\..\..\..\..\PROGRA~1\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

stm8s003.elf :  $(OutputPath)\rtc.o $(OutputPath)\ir_receive.o $(OutputPath)\key.o $(OutputPath)\main.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_iwdg.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\stm8s003.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\rtc.o
	-@erase $(OutputPath)\ir_receive.o
	-@erase $(OutputPath)\key.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_iwdg.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\stm8s003.elf
	-@erase $(OutputPath)\stm8s003.map
	-@erase $(OutputPath)\stm8s003.st7
	-@erase $(OutputPath)\stm8s003.s19
	-@erase $(OutputPath)\rtc.ls
	-@erase $(OutputPath)\ir_receive.ls
	-@erase $(OutputPath)\key.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_iwdg.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
endif
