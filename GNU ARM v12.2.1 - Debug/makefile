################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include gecko_sdk_4.4.5/platform/service/udelay/src/subdir.mk
-include gecko_sdk_4.4.5/platform/service/system/src/subdir.mk
-include gecko_sdk_4.4.5/platform/service/sleeptimer/src/subdir.mk
-include gecko_sdk_4.4.5/platform/service/iostream/src/subdir.mk
-include gecko_sdk_4.4.5/platform/service/device_init/src/subdir.mk
-include gecko_sdk_4.4.5/platform/emlib/src/subdir.mk
-include gecko_sdk_4.4.5/platform/emdrv/spidrv/src/subdir.mk
-include gecko_sdk_4.4.5/platform/emdrv/gpiointerrupt/src/subdir.mk
-include gecko_sdk_4.4.5/platform/emdrv/dmadrv/src/subdir.mk
-include gecko_sdk_4.4.5/platform/driver/debug/src/subdir.mk
-include gecko_sdk_4.4.5/platform/common/toolchain/src/subdir.mk
-include gecko_sdk_4.4.5/platform/common/src/subdir.mk
-include gecko_sdk_4.4.5/platform/Device/SiliconLabs/EFR32BG27/Source/subdir.mk
-include gecko_sdk_4.4.5/app/common/util/app_log/subdir.mk
-include autogen/subdir.mk
-include ad5940lib/subdir.mk
-include ad5940-examples/examples/AD5940_SqrWaveVoltammetry/subdir.mk
-include ad5940-examples/examples/AD5940_Ramp/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := THOR_in_vivo_firmware_test
BUILD_ARTIFACT_EXTENSION := axf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: main-build

# Main-build Target
main-build: THOR_in_vivo_firmware_test.axf

# Tool invocations
THOR_in_vivo_firmware_test.axf: $(OBJS) $(USER_OBJS) makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C Linker'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -T "C:\Users\xinye\SimplicityStudio\v5_workspace\THOR_in_vivo_firmware_test\autogen\linkerfile.ld" -Wl,--no-warn-rwx-segments -Xlinker --gc-sections -Xlinker -Map="THOR_in_vivo_firmware_test.map" -mfpu=fpv5-sp-d16 -mfloat-abi=hard --specs=nano.specs -u _printf_float -o THOR_in_vivo_firmware_test.axf -Wl,--start-group "./AD5940Main.o" "./EFR32_port.o" "./app.o" "./main.o" "./ad5940-examples/examples/AD5940_Ramp/RampTest.o" "./ad5940-examples/examples/AD5940_SqrWaveVoltammetry/SqrWaveVoltammetry.o" "./ad5940lib/ad5940.o" "./autogen/sl_device_init_clocks.o" "./autogen/sl_emlib_gpio_simple_init.o" "./autogen/sl_event_handler.o" "./autogen/sl_iostream_handles.o" "./autogen/sl_spidrv_init.o" "./gecko_sdk_4.4.5/app/common/util/app_log/app_log.o" "./gecko_sdk_4.4.5/platform/Device/SiliconLabs/EFR32BG27/Source/startup_efr32bg27.o" "./gecko_sdk_4.4.5/platform/Device/SiliconLabs/EFR32BG27/Source/system_efr32bg27.o" "./gecko_sdk_4.4.5/platform/common/src/sl_assert.o" "./gecko_sdk_4.4.5/platform/common/src/sl_slist.o" "./gecko_sdk_4.4.5/platform/common/src/sl_syscalls.o" "./gecko_sdk_4.4.5/platform/common/toolchain/src/sl_memory.o" "./gecko_sdk_4.4.5/platform/driver/debug/src/sl_debug_swo.o" "./gecko_sdk_4.4.5/platform/emdrv/dmadrv/src/dmadrv.o" "./gecko_sdk_4.4.5/platform/emdrv/gpiointerrupt/src/gpiointerrupt.o" "./gecko_sdk_4.4.5/platform/emdrv/spidrv/src/spidrv.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_burtc.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_cmu.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_core.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_emu.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_eusart.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_gpio.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_ldma.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_msc.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_rtcc.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_system.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_timer.o" "./gecko_sdk_4.4.5/platform/emlib/src/em_usart.o" "./gecko_sdk_4.4.5/platform/service/device_init/src/sl_device_init_dcdc_s2.o" "./gecko_sdk_4.4.5/platform/service/device_init/src/sl_device_init_emu_s2.o" "./gecko_sdk_4.4.5/platform/service/device_init/src/sl_device_init_nvic.o" "./gecko_sdk_4.4.5/platform/service/iostream/src/sl_iostream.o" "./gecko_sdk_4.4.5/platform/service/iostream/src/sl_iostream_retarget_stdio.o" "./gecko_sdk_4.4.5/platform/service/iostream/src/sl_iostream_stdlib_config.o" "./gecko_sdk_4.4.5/platform/service/iostream/src/sl_iostream_swo.o" "./gecko_sdk_4.4.5/platform/service/sleeptimer/src/sl_sleeptimer.o" "./gecko_sdk_4.4.5/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.o" "./gecko_sdk_4.4.5/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.o" "./gecko_sdk_4.4.5/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.o" "./gecko_sdk_4.4.5/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o" "./gecko_sdk_4.4.5/platform/service/system/src/sl_system_init.o" "./gecko_sdk_4.4.5/platform/service/system/src/sl_system_process_action.o" "./gecko_sdk_4.4.5/platform/service/udelay/src/sl_udelay.o" "./gecko_sdk_4.4.5/platform/service/udelay/src/sl_udelay_armv6m_gcc.o" -lgcc -lc -lm -lnosys -Wl,--end-group -Wl,--start-group -lgcc -lc -lnosys -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building out file: THOR_in_vivo_firmware_test.out'
	arm-none-eabi-objcopy "THOR_in_vivo_firmware_test.axf" "THOR_in_vivo_firmware_test.out"
	@echo ' '

	@echo 'Building hex file: THOR_in_vivo_firmware_test.hex'
	arm-none-eabi-objcopy -O ihex "THOR_in_vivo_firmware_test.axf" "THOR_in_vivo_firmware_test.hex"
	@echo ' '

	@echo 'Building bin file: THOR_in_vivo_firmware_test.bin'
	arm-none-eabi-objcopy -O binary "THOR_in_vivo_firmware_test.axf" "THOR_in_vivo_firmware_test.bin"
	@echo ' '

	@echo 'Building s37 file: THOR_in_vivo_firmware_test.s37'
	arm-none-eabi-objcopy -O srec "THOR_in_vivo_firmware_test.axf" "THOR_in_vivo_firmware_test.s37"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "THOR_in_vivo_firmware_test.axf" -A
	@echo ' '

# Other Targets
clean:
	-@$(foreach FILE, $(EXECUTABLES), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(OBJS), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(C_DEPS), $(shell $(RM) $(FILE)) )
	-$(RM) THOR_in_vivo_firmware_test.axf
	-@echo ' '

.PHONY: all clean dependents main-build

-include ../makefile.targets
