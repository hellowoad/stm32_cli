startup_dir = /Users/hewo/stm32/lib-patch/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/gcc
startup_src = $(startup_dir)/startup_stm32f103x6.s
hal_dir = /Users/hewo/stm32/lib-patch/Drivers/STM32F1xx_HAL_Driver/Src
hal_src = $(hal_dir)/stm32f1xx_hal.c $(hal_dir)/stm32f1xx_hal_gpio.c $(hal_dir)/stm32f1xx_hal_uart.c 
system_dir = /Users/hewo/stm32/lib-patch/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates
system_src = $(system_dir)/system_stm32f1xx.c

inc_dir = -I /Users/hewo/stm32/lib-patch/Drivers/STM32F1xx_HAL_Driver/Inc -I /Users/hewo/stm32/lib-patch/Drivers/CMSIS/Device/ST/STM32F1xx/Include -I /Users/hewo/stm32/lib/Drivers/CMSIS/Include

src = $(startup_src) $(hal_src) $(system_src) main.c
link_script_dir := /Users/hewo/stm32/lib-patch/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/gcc/linker
link_script := $(link_script_dir)/STM32F103X6_FLASH.ld
cc = arm-none-eabi-gcc
cflags = -DSTM32F103xB -g -mthumb -mcpu=cortex-m3 $(inc_dir)  
lflags = --specs=nano.specs --specs=nosys.specs -T $(link_script) 
blink:
	$(cc) $(cflags) $(src) -o $@ 
