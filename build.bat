@echo off
set VS_VERSION=%1%
set OPENCV_PATH=%2%
set EIGEN_PATH=%3%

if %VS_VERSION%==2015 (
  set GENERATOR="Visual Studio 14 %VS_VERSION% Win64"
)
if %VS_VERSION%==2017 (
  set GENERATOR="Visual Studio 15 %VS_VERSION% Win64"
)

if not exist build mkdir build
cd build
cmake -G %GENERATOR% -DOpenCV_DIR=%OPENCV_PATH% -DEIGEN3_INCLUDE_DIR=%EIGEN_PATH% ..\