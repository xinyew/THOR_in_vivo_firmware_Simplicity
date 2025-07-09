################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emdrv/spidrv/src/spidrv.c 

OBJS += \
./gecko_sdk_4.4.5/platform/emdrv/spidrv/src/spidrv.o 

C_DEPS += \
./gecko_sdk_4.4.5/platform/emdrv/spidrv/src/spidrv.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.5/platform/emdrv/spidrv/src/spidrv.o: C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emdrv/spidrv/src/spidrv.c gecko_sdk_4.4.5/platform/emdrv/spidrv/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DADI_DEBUG=1' '-DCHIPSEL_594X=1' '-DDEBUG_EFM=1' '-DEFR32BG27C320F768GJ39=1' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\ad5940lib" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\ad5940-examples\examples\AD5940_SqrWaveVoltammetry" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\ad5940-examples\examples\AD5940_Ramp" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\config" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\autogen" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFR32BG27/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//app/common/util/app_assert" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//app/common/util/app_log" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/dmadrv/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/common/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/init/gpio_simple" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/gpiointerrupt/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/sleeptimer/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emdrv/spidrv/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.5/platform/emdrv/spidrv/src/spidrv.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


