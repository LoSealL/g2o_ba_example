# g2o_ba_example_win
ʹ��Ŀ��windows�±���ɹ������������g2o��windows��֧�֡�

**2019.4.10����**��ʹ���ⲿ����ʽ����eigen3��g2o������������eigen3��g2o֧�֡�

# ʹ��
��Windows�£�

1. ��CMake GUI��������ѡ��VS 2017 64����VS 2015 64������һ��configure��ᱨ���ֶ�ָ��opencv~~��eigen~~�Ŀ�Ŀ¼���ٴ�configure

2. ����cmake ���

  ```shell
  cmake --build . --config Release
  # ����
  ./ba_example_win ../data/1.png ../data/2.png
  ```

��Linux�£�

```shell
mkdir build && cd build
# ʹ��SuiteSparse��SuiteSparse·���º���include��lib�ļ���
# ����SuiteSparse����Ĭ������·����
cmake -DCSPARSE_DIR=/xxx/xxx/SuiteSparse ..
make -j8
# ��ʹ��SuiteSparse��������SuiteSparseͷ�ļ��Ϳⲻ��Ĭ������·���£�
cmake ..
make -j8
# ����Ƿ���SuiteSparse����G2O�Դ���CSPARSE���鿴build/g2o/lib/libg2o_csparse.so�ļ��Ƿ���ڣ����ڣ�G2O�Դ���CSPARSE

# ����
./ba_example_win ../data/1.png ../data/2.png
```



����ΪԭREADME
==============================================================================
# g2o_ba_example
An easy example of doing bundle adjustment within two images using g2o. 

Require: g2o, OpenCV 2.4.x

The program reads two images from the data/1.png and data/2.png, then finds and matches orb key-points between them. After these, it uses g2o to estimate the relative motion between frames and the 3d positions (under a unknown scale).

This is an example written for the beginners of g2o and SLAM.

For more details please see the corresponding blog: http://www.cnblogs.com/gaoxiang12/p/5304272.html (in Chinese only).
