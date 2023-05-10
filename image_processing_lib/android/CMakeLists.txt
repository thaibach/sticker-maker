cmake_minimum_required(VERSION 3.4.1)

project(BackgroundRemoval)

include_directories(../include)

add_library(lib_opencv STATIC IMPORTED)

# for android gradle plugin == 4.1.0
set_target_properties(lib_opencv PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/src/main/${ANDROID_ABI}/libopencv_java4.so)

# for android gradle plugin == 3.5.2
# move abi folder into jniLibs folder
# set_target_properties(lib_opencv PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libopencv_java4.so)


add_library(MNN STATIC IMPORTED)

# for android gradle plugin == 4.1.0
set_target_properties(MNN PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/src/main/${ANDROID_ABI}/libMNN.so)

# for android gradle plugin == 3.5.2
# move abi folder into jniLibs folder
# set_target_properties(MNN PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libMNN.so)

#removebg
add_library(removebg SHARED ../ios/Classes/bgRemoval.cpp ../ios/Classes/net.cpp)

target_link_libraries(removebg MNN lib_opencv)

#bitmap
add_library(bitmap SHARED ../ios/Classes/bitmap.cpp)

target_link_libraries(bitmap)