# g2o_ba_example_win
ʹ��Ŀ��windows�±���ɹ������������g2o��windows��֧�֡�
# ʹ��
1. ��CMake GUI��������ѡ��VS 2017 64����VS 2015 64������һ��configure��ᱨ���ֶ�ָ��opencv��eigen�Ŀ�Ŀ¼���ٴ�configure
2. ʹ��build.bat��������������`build <vs-version> <path-to-opencv> <path-to-eigen>`����`build 2015 C:\SDK\opencv\build C:\SDK\eigen3`
ע��opencv��·��Ҫָ��������`OpenCVConfig.cmake`��Ŀ¼�£�����opencv/build

����ΪԭREADME
==============================================================================
# g2o_ba_example
An easy example of doing bundle adjustment within two images using g2o. 

Require: g2o, OpenCV 2.4.x

The program reads two images from the data/1.png and data/2.png, then finds and matches orb key-points between them. After these, it uses g2o to estimate the relative motion between frames and the 3d positions (under a unknown scale).

This is an example written for the beginners of g2o and SLAM.

For more details please see the corresponding blog: http://www.cnblogs.com/gaoxiang12/p/5304272.html (in Chinese only).
