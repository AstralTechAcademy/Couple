cmake_minimum_required(VERSION 3.1.0)

project(Couple)

set(PROJECT_NAME "Couple") 

message(STATUS "------- HOST DETAILS -------")
cmake_host_system_information(RESULT OS_DETAILS QUERY OS_NAME)
message("Detected operating system: ${OS_DETAILS}")

message(STATUS "------- COMPILER CONFIGURATION -------")
if(LINUX)
    set(CMAKE_C_COMPILER "/usr/bin/clang")
    set(CMAKE_CXX_COMPILER "/usr/bin/clang++")

    message(STATUS "    CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
    message(STATUS "    CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
endif()

if(WIN)
    set(CMAKE_C_COMPILER "C:/msys64/mingw64/bin/cc.exe")
    set(CMAKE_CXX_COMPILER "C:/msys64/mingw64/bin/c++.exe")

    message(STATUS "    CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
    message(STATUS "    CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
endif()

if(${OS_DETAILS} STREQUAL macOS)
    message(STATUS "    CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
    message(STATUS "    CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

message(STATUS "    CMAKE_CXX_STANDARD: ${CMAKE_CXX_STANDARD}")

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

message(STATUS "------- QT CONFIGURATION -------")

if(${OS_DETAILS} STREQUAL Linux)
    set(CMAKE_PREFIX_PATH "$ENV{Qt_DIR}/gcc_64/lib/cmake/Qt6")
endif()

if(${OS_DETAILS} STREQUAL Windows)
    set(CMAKE_PREFIX_PATH "$ENV{Qt_DIR}/$ENV{Qt_Version}/mingw81_64/lib/cmake/Qt6")
endif()

if(${OS_DETAILS} STREQUAL macOS)
set(CMAKE_PREFIX_PATH "$ENV{Qt_DIR}/$ENV{Qt_Version}/macos/lib/cmake/Qt6")
endif()

message(STATUS "    CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")

if(ANDROID)
    #set(ANDROID_ABIS "armeabi-v7a")
    set(ANDROID_ABIS "arm64-v8a")
    set(QT_ANDROID_ABIS ${ANDROID_ABIS})
    set(ANDROID_ARM_NEON "ON")
    set(CMAKE_PREFIX_PATH "$ENV{Qt_DIR}/$ENV{Qt_Version}/${ANDROID_ABIS}/lib/cmake/Qt6")
    set(ANDROID_SDK_ROOT "$ENV{ANDROID_SDK_ROOT}/sdk")
    set(ANDROID_NDK_ROOT "$ENV{ANDROID_NDK_ROOT}")
endif()

find_package(Qt6 REQUIRED COMPONENTS Qml Quick Widgets Sql)

 message(STATUS "--------------------------------")

 if(${OS_DETAILS} STREQUAL Windows)
include_directories(${Qt5_DIR}/gcc_64/include/)
include_directories(${Qt5_DIR}/gcc_64/include/QtWidgets)
include_directories(./)
endif()

if(${OS_DETAILS} STREQUAL macOS)
include_directories($ENV{Qt_DIR}/$ENV{Qt_Version})
endif()

qt6_add_resources(RESOURCES ./qml.qrc)

if(ANDROID)
    qt_add_executable(${PROJECT_NAME}  main.cpp ${RESOURCES})
    qt_finalize_executable(${PROJECT_NAME})
else()
add_executable(${PROJECT_NAME}
        main.cpp
        ${RESOURCES})
endif()

if(${OS_DETAILS} STREQUAL Linux)
    target_link_libraries(${PROJECT_NAME} Qt::Quick Qt::Qml Qt::Widgets Qt::Sql)
endif()

if(${OS_DETAILS} STREQUAL Windows)
target_link_libraries(${PROJECT_NAME} Qt::Quick Qt::Qml Qt::Widgets Qt::Sql)
endif()

if(${OS_DETAILS} STREQUAL macOS)
target_link_libraries(${PROJECT_NAME} Qt::Quick Qt::Qml Qt::Widgets Qt::Sql)
set_target_properties(${PROJECT_NAME}  PROPERTIES
                        MACOSX_BUNDLE FALSE)
endif()

if(ANDROID)
    set_target_properties(${PROJECT_NAME}  PROPERTIES QT_ANDROID_ABIS ${ANDROID_ABIS})
    target_link_libraries(${PROJECT_NAME} PRIVATE Qt::Quick Qt::Qml Qt::Widgets Qt::Sql)
endif()

