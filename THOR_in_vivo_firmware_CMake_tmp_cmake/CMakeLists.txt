# Define minimal required version of CMake.
cmake_minimum_required(VERSION "3.25")

# Project definition
project(
	THOR_in_vivo_firmware_CMake_tmp
	VERSION 1.0
	LANGUAGES C CXX ASM
)

# Include the definition of the slc_THOR_in_vivo_firmware_CMake_tmp target,
# which contains the content of the SLC project
include(THOR_in_vivo_firmware_CMake_tmp.cmake)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


add_executable(THOR_in_vivo_firmware_CMake_tmp
    # Add additional sources here
    "../ad5940lib/ad5940.c"
    "../ad5940-examples/examples/AD5940_Ramp/RampTest.c"
    "../ad5940-examples/examples/AD5940_SqrWaveVoltammetry/SqrWaveVoltammetry.c"
    "../AD5940Main.c"
    "../EFR32_port.c"
)

target_include_directories(THOR_in_vivo_firmware_CMake_tmp PUBLIC
    # "../ad5940lib"
    "../ad5940-examples/examples/AD5940_Ramp"
    "../ad5940-examples/examples/AD5940_SqrWaveVoltammetry"
)

target_compile_definitions(THOR_in_vivo_firmware_CMake_tmp PUBLIC
    # Add additional macros here
    # CHIPSEL_594X=1
    ADI_DEBUG=1
)

target_compile_options(THOR_in_vivo_firmware_CMake_tmp PUBLIC
    # Set additional compiler flags here
)

target_link_options(THOR_in_vivo_firmware_CMake_tmp PUBLIC
    # Set additional linker flags here
    -u _printf_float
)

# Link with the content defined in the SLC project
target_link_libraries(THOR_in_vivo_firmware_CMake_tmp PRIVATE
    slc_THOR_in_vivo_firmware_CMake_tmp
)

# Include managed project content if available
include(THOR_in_vivo_firmware_CMake_tmp_project.cmake OPTIONAL RESULT_VARIABLE managed_project)
if(managed_project)
    message(STATUS "Using managed project content from ${managed_project}")
endif()

# Force the gcc linker command
set_target_properties(THOR_in_vivo_firmware_CMake_tmp PROPERTIES LINKER_LANGUAGE C)

# Create .bin, .hex and .s37 artifacts after building the project
add_custom_command(TARGET THOR_in_vivo_firmware_CMake_tmp
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O srec "$<TARGET_FILE:THOR_in_vivo_firmware_CMake_tmp>" "$<TARGET_FILE_DIR:THOR_in_vivo_firmware_CMake_tmp>/$<TARGET_FILE_BASE_NAME:THOR_in_vivo_firmware_CMake_tmp>.s37"
    COMMAND ${CMAKE_OBJCOPY} -O ihex "$<TARGET_FILE:THOR_in_vivo_firmware_CMake_tmp>" "$<TARGET_FILE_DIR:THOR_in_vivo_firmware_CMake_tmp>/$<TARGET_FILE_BASE_NAME:THOR_in_vivo_firmware_CMake_tmp>.hex"
    COMMAND ${CMAKE_OBJCOPY} -O binary "$<TARGET_FILE:THOR_in_vivo_firmware_CMake_tmp>" "$<TARGET_FILE_DIR:THOR_in_vivo_firmware_CMake_tmp>/$<TARGET_FILE_BASE_NAME:THOR_in_vivo_firmware_CMake_tmp>.bin" 
)

# Run post-build pipeline to perform additional post-processing
if(post_build_command)
add_custom_command(TARGET THOR_in_vivo_firmware_CMake_tmp
    POST_BUILD
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/..
    COMMAND ${post_build_command}
)
endif()