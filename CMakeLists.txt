# CMake 工程，读者应该熟悉了，我就不一一注释了
# 扩展CMake工程，使得适用于Windows下的编译，并改为使用OpenCV 3.3
# 测试环境：
# -- Windows 10.0.16299.19 (x64)
# -- Visual Studio 2017 x64 community
# -- OpenCV 3.3, g2o (latest version)

# 使用OpenCV预编译版本时，注意opencv\build\x64\目录下只有一个vc14文件夹
# 如果使用VS 2017请将vc14直接改名为vc15

# ！！！该工程并无Windows依赖，所以正常情况下应该能直接在Linux下编译运行。

cmake_minimum_required( VERSION 3.5.1 )

project(g2o_ba_example_win)
#使用默认Build type和CXX_FLAGS
#使用c++14
set(CMAKE_CXX_STANDARD 14)

if(WIN32)
  add_definitions(-D_WINDOWS)
  if(MSVC)
    if(MSVC_VERSION LESS 1900)
      message(FATAL_ERROR "Don't support VS2013 or below")
    elseif(MSVC_VERSION EQUAL 1900)
      set(OpenCV_RUNTIME vc14)
    elseif(MSVC_VERSION EQUAL 1910 OR MSVC_VERSION EQUAL 1911)
      set(OpenCV_RUNTIME vc15)
    endif()
  endif(MSVC)
else()
  # 我没有找到windows下的cholmod库（如有请告知）
  # find_package( Cholmod )
endif()
# 在windows下需要手动指定OpenCV和Eigen库目录位置
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)
find_package(OpenCV REQUIRED)
find_package(CSparse QUIET)  # Help g2o find SuiteSparse
# 引用外部库
include(eigen3)
include(g2o)
#所需要的g2o库
set(link_libs ${OpenCV_LIBS} ${G2O_LIBS})
if(G2O_USE_OPENGL)
  list(APPEND link_libs opengl_helper)
endif()

add_executable(ba_example_win main.cpp)
add_dependencies(ba_example_win g2o eigen)
target_link_libraries(ba_example_win ${link_libs})

# 自动拷贝dll文件到输出目录下
if(WIN32)
  foreach(fp ${G2O_DLLS})
    add_custom_command(TARGET ba_example_win POST_BUILD
      COMMAND
      ${CMAKE_COMMAND} -E copy_if_different ${fp} $<TARGET_FILE_DIR:ba_example_win>
      VERBATIM
    )
  endforeach()
  add_custom_command(TARGET ba_example_win POST_BUILD
    COMMAND
    ${CMAKE_COMMAND} -E copy_if_different ${OpenCV_DIR}/x64/${OpenCV_RUNTIME}/bin/opencv_world330.dll $<TARGET_FILE_DIR:ba_example_win>
    COMMAND
    ${CMAKE_COMMAND} -E copy_if_different ${OpenCV_DIR}/x64/${OpenCV_RUNTIME}/bin/opencv_world330d.dll $<TARGET_FILE_DIR:ba_example_win>
    COMMAND
    ${CMAKE_COMMAND} -E copy_if_different ${OpenCV_DIR}/x64/${OpenCV_RUNTIME}/bin/opencv_ffmpeg330_64.dll $<TARGET_FILE_DIR:ba_example_win>
    VERBATIM
  )
endif(WIN32)
