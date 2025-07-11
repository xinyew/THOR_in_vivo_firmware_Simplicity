set(SDK_PATH "/Users/xinye/SimplicityStudio/SDKs/gecko_sdk")
set(COPIED_SDK_PATH "gecko_sdk_4.4.5")

add_library(slc_THOR_in_vivo_firmware_CMake_tmp OBJECT
    "${SDK_PATH}/app/common/util/app_log/app_log.c"
    "${SDK_PATH}/platform/common/src/sl_assert.c"
    "${SDK_PATH}/platform/common/src/sl_slist.c"
    "${SDK_PATH}/platform/common/src/sl_syscalls.c"
    "${SDK_PATH}/platform/common/toolchain/src/sl_memory.c"
    "${SDK_PATH}/platform/Device/SiliconLabs/EFR32BG27/Source/startup_efr32bg27.c"
    "${SDK_PATH}/platform/Device/SiliconLabs/EFR32BG27/Source/system_efr32bg27.c"
    "${SDK_PATH}/platform/driver/debug/src/sl_debug_swo.c"
    "${SDK_PATH}/platform/emdrv/dmadrv/src/dmadrv.c"
    "${SDK_PATH}/platform/emdrv/gpiointerrupt/src/gpiointerrupt.c"
    "${SDK_PATH}/platform/emdrv/spidrv/src/spidrv.c"
    "${SDK_PATH}/platform/emlib/src/em_burtc.c"
    "${SDK_PATH}/platform/emlib/src/em_cmu.c"
    "${SDK_PATH}/platform/emlib/src/em_core.c"
    "${SDK_PATH}/platform/emlib/src/em_emu.c"
    "${SDK_PATH}/platform/emlib/src/em_eusart.c"
    "${SDK_PATH}/platform/emlib/src/em_gpio.c"
    "${SDK_PATH}/platform/emlib/src/em_ldma.c"
    "${SDK_PATH}/platform/emlib/src/em_msc.c"
    "${SDK_PATH}/platform/emlib/src/em_rtcc.c"
    "${SDK_PATH}/platform/emlib/src/em_system.c"
    "${SDK_PATH}/platform/emlib/src/em_timer.c"
    "${SDK_PATH}/platform/emlib/src/em_usart.c"
    "${SDK_PATH}/platform/service/device_init/src/sl_device_init_dcdc_s2.c"
    "${SDK_PATH}/platform/service/device_init/src/sl_device_init_emu_s2.c"
    "${SDK_PATH}/platform/service/device_init/src/sl_device_init_nvic.c"
    "${SDK_PATH}/platform/service/iostream/src/sl_iostream.c"
    "${SDK_PATH}/platform/service/iostream/src/sl_iostream_retarget_stdio.c"
    "${SDK_PATH}/platform/service/iostream/src/sl_iostream_stdlib_config.c"
    "${SDK_PATH}/platform/service/iostream/src/sl_iostream_swo.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c"
    "${SDK_PATH}/platform/service/system/src/sl_system_init.c"
    "${SDK_PATH}/platform/service/system/src/sl_system_process_action.c"
    "${SDK_PATH}/platform/service/udelay/src/sl_udelay.c"
    "${SDK_PATH}/platform/service/udelay/src/sl_udelay_armv6m_gcc.S"
    "../app.c"
    "../autogen/sl_device_init_clocks.c"
    "../autogen/sl_emlib_gpio_simple_init.c"
    "../autogen/sl_event_handler.c"
    "../autogen/sl_iostream_handles.c"
    "../autogen/sl_spidrv_init.c"
    "../main.c"
    # "../ad5940lib/ad5940.c"
    # "../ad5940-examples/examples/AD5940_Ramp/RampTest.c"
    # "../ad5940-examples/examples/AD5940_SqrWaveVoltammetry/SqrWaveVoltammetry.c"
    # "../AD5940Main.c"
    # "../EFR32_port.c"
)

target_include_directories(slc_THOR_in_vivo_firmware_CMake_tmp PUBLIC
   "../config"
   "../autogen"
   "../."
    "../ad5940lib"
    # "../ad5940-examples/examples/AD5940_Ramp"
    # "../ad5940-examples/examples/AD5940_SqrWaveVoltammetry"
    "${SDK_PATH}/platform/Device/SiliconLabs/EFR32BG27/Include"
    "${SDK_PATH}/app/common/util/app_assert"
    "${SDK_PATH}/app/common/util/app_log"
    "${SDK_PATH}/platform/common/inc"
    "${SDK_PATH}/platform/CMSIS/Core/Include"
    "${SDK_PATH}/platform/driver/debug/inc"
    "${SDK_PATH}/platform/service/device_init/inc"
    "${SDK_PATH}/platform/emdrv/dmadrv/inc"
    "${SDK_PATH}/platform/emdrv/common/inc"
    "${SDK_PATH}/platform/emlib/inc"
    "${SDK_PATH}/platform/emlib/init/gpio_simple"
    "${SDK_PATH}/platform/emdrv/gpiointerrupt/inc"
    "${SDK_PATH}/platform/service/iostream/inc"
    "${SDK_PATH}/platform/common/toolchain/inc"
    "${SDK_PATH}/platform/service/system/inc"
    "${SDK_PATH}/platform/service/sleeptimer/inc"
    "${SDK_PATH}/platform/emdrv/spidrv/inc"
    "${SDK_PATH}/platform/service/udelay/inc"
)

target_compile_definitions(slc_THOR_in_vivo_firmware_CMake_tmp PUBLIC
    "DEBUG_EFM=1"
    "EFR32BG27C320F768GJ39=1"
    "SL_COMPONENT_CATALOG_PRESENT=1"
    "CHIPSEL_594X=1"
    # "ADI_DEBUG=1"
)

target_link_libraries(slc_THOR_in_vivo_firmware_CMake_tmp PUBLIC
    "-Wl,--start-group"
    "gcc"
    "c"
    "m"
    "nosys"
    "-Wl,--end-group"
)
target_compile_options(slc_THOR_in_vivo_firmware_CMake_tmp PUBLIC
    $<$<COMPILE_LANGUAGE:C>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:C>:-mthumb>
    $<$<COMPILE_LANGUAGE:C>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:C>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:C>:-Wall>
    $<$<COMPILE_LANGUAGE:C>:-Wextra>
    $<$<COMPILE_LANGUAGE:C>:-Os>
    $<$<COMPILE_LANGUAGE:C>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:C>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:C>:-fomit-frame-pointer>
    "$<$<COMPILE_LANGUAGE:C>:SHELL:-imacros sl_gcc_preinclude.h>"
    $<$<COMPILE_LANGUAGE:C>:-mcmse>
    $<$<COMPILE_LANGUAGE:C>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:C>:-g>
    $<$<COMPILE_LANGUAGE:CXX>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:CXX>:-mthumb>
    $<$<COMPILE_LANGUAGE:CXX>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:CXX>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-Wall>
    $<$<COMPILE_LANGUAGE:CXX>:-Wextra>
    $<$<COMPILE_LANGUAGE:CXX>:-Os>
    $<$<COMPILE_LANGUAGE:CXX>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-fomit-frame-pointer>
    "$<$<COMPILE_LANGUAGE:CXX>:SHELL:-imacros sl_gcc_preinclude.h>"
    $<$<COMPILE_LANGUAGE:CXX>:-mcmse>
    $<$<COMPILE_LANGUAGE:CXX>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:CXX>:-g>
    $<$<COMPILE_LANGUAGE:ASM>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:ASM>:-mthumb>
    $<$<COMPILE_LANGUAGE:ASM>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:ASM>:-mfloat-abi=hard>
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-imacros sl_gcc_preinclude.h>"
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-x assembler-with-cpp>"
)

set(post_build_command )
set_property(TARGET slc_THOR_in_vivo_firmware_CMake_tmp PROPERTY C_STANDARD 99)
set_property(TARGET slc_THOR_in_vivo_firmware_CMake_tmp PROPERTY CXX_STANDARD 11)
set_property(TARGET slc_THOR_in_vivo_firmware_CMake_tmp PROPERTY CXX_EXTENSIONS OFF)

target_link_options(slc_THOR_in_vivo_firmware_CMake_tmp INTERFACE
    -mcpu=cortex-m33
    -mthumb
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -T${CMAKE_CURRENT_LIST_DIR}/../autogen/linkerfile.ld
    --specs=nano.specs
    "SHELL:-Xlinker -Map=$<TARGET_FILE_DIR:THOR_in_vivo_firmware_CMake_tmp>/THOR_in_vivo_firmware_CMake_tmp.map"
    -Wl,--gc-sections
    -Wl,--no-warn-rwx-segments
    # -u _printf_float
)

# BEGIN_SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
