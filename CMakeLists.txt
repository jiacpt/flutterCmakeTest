cmake_minimum_required(VERSION 3.0.0)
project(testDll VERSION 0.1.0)

include(CTest)
enable_testing()
if(CMAKE_COMPILER_IS_GNUCC)
    message("COMPILER IS GNUCC")    
    ADD_DEFINITIONS (-std=c++11)
endif(CMAKE_COMPILER_IS_GNUCC)


set(DLL_NAME cur)
set(MAIN_NAME main)

aux_source_directory(./makeDll DIR_SRCS)
add_library(${DLL_NAME} SHARED ${DIR_SRCS})

SET(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/assets/windll/test)
add_executable(${MAIN_NAME} ./makeDll/test/testMain.cpp)
target_link_libraries(${MAIN_NAME} ${DLL_NAME})

message(STATUS "==========================================")

set_target_properties(${DLL_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ../assets/windll)



set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)



