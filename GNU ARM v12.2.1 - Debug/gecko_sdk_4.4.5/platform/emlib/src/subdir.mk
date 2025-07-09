################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_cmu.c \
C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_core.c \
C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_emu.c \
C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_gpio.c \
C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_msc.c \
C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_system.c 

OBJS += \
./gecko_sdk_4.4.5/platform/emlib/src/em_cmu.o \
./gecko_sdk_4.4.5/platform/emlib/src/em_core.o \
./gecko_sdk_4.4.5/platform/emlib/src/em_emu.o \
./gecko_sdk_4.4.5/platform/emlib/src/em_gpio.o \
./gecko_sdk_4.4.5/platform/emlib/src/em_msc.o \
./gecko_sdk_4.4.5/platform/emlib/src/em_system.o 

C_DEPS += \
./gecko_sdk_4.4.5/platform/emlib/src/em_cmu.d \
./gecko_sdk_4.4.5/platform/emlib/src/em_core.d \
./gecko_sdk_4.4.5/platform/emlib/src/em_emu.d \
./gecko_sdk_4.4.5/platform/emlib/src/em_gpio.d \
./gecko_sdk_4.4.5/platform/emlib/src/em_msc.d \
./gecko_sdk_4.4.5/platform/emlib/src/em_system.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.4.5/platform/emlib/src/em_cmu.o: C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_cmu.c gecko_sdk_4.4.5/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DDEBUG_EFM=1' '-DEFR32BG27C320F768GJ39=1' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\config" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\autogen" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFR32BG27/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//app/common/util/app_log" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.5/platform/emlib/src/em_cmu.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.5/platform/emlib/src/em_core.o: C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_core.c gecko_sdk_4.4.5/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DDEBUG_EFM=1' '-DEFR32BG27C320F768GJ39=1' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\config" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\autogen" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFR32BG27/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//app/common/util/app_log" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.5/platform/emlib/src/em_core.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.5/platform/emlib/src/em_emu.o: C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_emu.c gecko_sdk_4.4.5/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DDEBUG_EFM=1' '-DEFR32BG27C320F768GJ39=1' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\config" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\autogen" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFR32BG27/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//app/common/util/app_log" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.5/platform/emlib/src/em_emu.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.5/platform/emlib/src/em_gpio.o: C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_gpio.c gecko_sdk_4.4.5/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DDEBUG_EFM=1' '-DEFR32BG27C320F768GJ39=1' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\config" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\autogen" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFR32BG27/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//app/common/util/app_log" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.5/platform/emlib/src/em_gpio.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.5/platform/emlib/src/em_msc.o: C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_msc.c gecko_sdk_4.4.5/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DDEBUG_EFM=1' '-DEFR32BG27C320F768GJ39=1' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\config" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\autogen" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFR32BG27/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//app/common/util/app_log" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.5/platform/emlib/src/em_msc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.4.5/platform/emlib/src/em_system.o: C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_system.c gecko_sdk_4.4.5/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DDEBUG_EFM=1' '-DEFR32BG27C320F768GJ39=1' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\config" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\autogen" -I"C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFR32BG27/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//app/common/util/app_log" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/driver/debug/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/xinye/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.4.5/platform/emlib/src/em_system.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


