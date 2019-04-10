# g2o_ba_example_win
使项目在windows下编译成功。得益于最近g2o对windows的支持。

**2019.4.10更新**：使用外部库形式编译eigen3和g2o。升级对最新eigen3和g2o支持。

# 使用
在Windows下：

1. 用CMake GUI，生成器选择VS 2017 64（或VS 2015 64），第一次configure后会报错，手动指定opencv~~和eigen~~的库目录后再次configure

2. 输入cmake 命令：

  ```shell
  cmake --build . --config Release
  # 测试
  ./ba_example_win ../data/1.png ../data/2.png
  ```

在Linux下：

```shell
mkdir build && cd build
# 使用SuiteSparse，SuiteSparse路径下含有include和lib文件夹
# 假设SuiteSparse不在默认搜索路径下
cmake -DCSPARSE_DIR=/xxx/xxx/SuiteSparse ..
make -j8
# 不使用SuiteSparse，（包括SuiteSparse头文件和库不在默认搜索路径下）
cmake ..
make -j8
# 检查是否用SuiteSparse还是G2O自带的CSPARSE，查看build/g2o/lib/libg2o_csparse.so文件是否存在（存在：G2O自带的CSPARSE

# 测试
./ba_example_win ../data/1.png ../data/2.png
```



以下为原README
==============================================================================
# g2o_ba_example
An easy example of doing bundle adjustment within two images using g2o. 

Require: g2o, OpenCV 2.4.x

The program reads two images from the data/1.png and data/2.png, then finds and matches orb key-points between them. After these, it uses g2o to estimate the relative motion between frames and the 3d positions (under a unknown scale).

This is an example written for the beginners of g2o and SLAM.

For more details please see the corresponding blog: http://www.cnblogs.com/gaoxiang12/p/5304272.html (in Chinese only).
