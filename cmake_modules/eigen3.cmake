include (ExternalProject)

set(EIGEN3_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR}/eigen/include)
set(eigen_URL http://bitbucket.org/eigen/eigen/get/3.3.7.tar.gz)
set(eigen_HASH SHA256=7e84ef87a07702b54ab3306e77cea474f56a40afa1c0ab245bb11725d006d0da)
set(eigen_BUILD ${CMAKE_CURRENT_BINARY_DIR}/eigen/src/eigen)
set(eigen_INSTALL ${CMAKE_CURRENT_BINARY_DIR}/eigen/install)

ExternalProject_Add(eigen
    PREFIX eigen
    URL ${eigen_URL}
    URL_HASH ${eigen_HASH}
    INSTALL_DIR "${eigen_INSTALL}"
    CMAKE_CACHE_ARGS
        -DCMAKE_BUILD_TYPE:STRING=Release
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF
        -DCMAKE_INSTALL_PREFIX:STRING=${eigen_INSTALL}
        -DINCLUDE_INSTALL_DIR:STRING=${EIGEN3_INCLUDE_DIR}
        -DBUILD_TESTING:BOOL=OFF
)

include_directories(${EIGEN3_INCLUDE_DIR})
