# g2o_ba_example_win
使项目在windows下编译成功。得益于最近g2o对windows的支持。
# 使用
1. 用CMake GUI，生成器选择VS 2017 64（或VS 2015 64），第一次configure后会报错，手动指定opencv和eigen的库目录后再次configure
2. 使用build.bat，在命令行输入`build <vs-version> <path-to-opencv> <path-to-eigen>`，如`build 2015 C:\SDK\opencv\build C:\SDK\eigen3`
注意opencv的路径要指定到包含`OpenCVConfig.cmake`的目录下，比如opencv/build

以下为原README
==============================================================================
# g2o_ba_example
An easy example of doing bundle adjustment within two images using g2o. 

Require: g2o, OpenCV 2.4.x

The program reads two images from the data/1.png and data/2.png, then finds and matches orb key-points between them. After these, it uses g2o to estimate the relative motion between frames and the 3d positions (under a unknown scale).

This is an example written for the beginners of g2o and SLAM.

For more details please see the corresponding blog: http://www.cnblogs.com/gaoxiang12/p/5304272.html (in Chinese only).
