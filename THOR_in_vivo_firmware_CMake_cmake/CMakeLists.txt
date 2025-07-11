# Define minimal required version of CMake.
cmake_minimum_required(VERSION "3.25")

# Project definition
project(
	THOR_in_vivo_firmware_CMake
	VERSION 1.0
	LANGUAGES C CXX ASM
)

# Include the definition of the slc_THOR_in_vivo_firmware_CMake target,
# which contains the content of the SLC project
include(THOR_in_vivo_firmware_CMake.cmake)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


add_executable(THOR_in_vivo_firmware_CMake
    # Add additional sources here
    # "../ad5940-examples/examples/AD5940_Ramp/RampTest.c"
    # "../ad5940-examples/examples/AD5940_SqrWaveVoltammetry/SqrWaveVoltammetry.c"
)

target_include_directories(THOR_in_vivo_firmware_CMake PUBLIC
    # /Users/xinye/SimplicityStudio/v5_workspace/THOR_in_vivo_firmware_CMake/ad5940lib
    # /Users/xinye/SimplicityStudio/v5_workspace/THOR_in_vivo_firmware_CMake/ad5940-examples/examples/AD5940_Ramp
    # /Users/xinye/SimplicityStudio/v5_workspace/THOR_in_vivo_firmware_CMake/ad5940-examples/examples/AD5940_SqrWaveVoltammetry
)

target_compile_definitions(THOR_in_vivo_firmware_CMake PUBLIC
    # Add additional macros here
    # CHIPSEL_594X=1
    # ADI_DEBUG=1
)

target_compile_options(THOR_in_vivo_firmware_CMake PUBLIC
    # Set additional compiler flags here
)

target_link_options(THOR_in_vivo_firmware_CMake PUBLIC
    # Set additional linker flags here
    # -u _printf_float
)

# Link with the content defined in the SLC project
target_link_libraries(THOR_in_vivo_firmware_CMake PRIVATE
    slc_THOR_in_vivo_firmware_CMake
)

# Include managed project content if available
include(THOR_in_vivo_firmware_CMake_project.cmake OPTIONAL RESULT_VARIABLE managed_project)
if(managed_project)
    message(STATUS "Using managed project content from ${managed_project}")
endif()

# Force the gcc linker command
set_target_properties(THOR_in_vivo_firmware_CMake PROPERTIES LINKER_LANGUAGE C)

# Create .bin, .hex and .s37 artifacts after building the project
add_custom_command(TARGET THOR_in_vivo_firmware_CMake
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O srec "$<TARGET_FILE:THOR_in_vivo_firmware_CMake>" "$<TARGET_FILE_DIR:THOR_in_vivo_firmware_CMake>/$<TARGET_FILE_BASE_NAME:THOR_in_vivo_firmware_CMake>.s37"
    COMMAND ${CMAKE_OBJCOPY} -O ihex "$<TARGET_FILE:THOR_in_vivo_firmware_CMake>" "$<TARGET_FILE_DIR:THOR_in_vivo_firmware_CMake>/$<TARGET_FILE_BASE_NAME:THOR_in_vivo_firmware_CMake>.hex"
    COMMAND ${CMAKE_OBJCOPY} -O binary "$<TARGET_FILE:THOR_in_vivo_firmware_CMake>" "$<TARGET_FILE_DIR:THOR_in_vivo_firmware_CMake>/$<TARGET_FILE_BASE_NAME:THOR_in_vivo_firmware_CMake>.bin" 
)

# Run post-build pipeline to perform additional post-processing
if(post_build_command)
add_custom_command(TARGET THOR_in_vivo_firmware_CMake
    POST_BUILD
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/..
    COMMAND ${post_build_command}
)
endif()