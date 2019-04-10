include (ExternalProject)
option(G2O_BUILD_SHARED "Build shared library of g2o" ON)
set(g2o_URL https://github.com/RainerKuemmerle/g2o.git)
set(g2o_TAG master)
set(g2o_INCLUDE_DIRS ${CMAKE_CURRENT_BINARY_DIR}/g2o/include)
set(g2o_LIBRARY_DIRS ${CMAKE_CURRENT_BINARY_DIR}/g2o/lib)

set(G2O_LIBS
  g2o_core
  g2o_csparse_extension
  g2o_ext_freeglut_minimal
  g2o_solver_csparse
  g2o_solver_dense
  g2o_solver_eigen
  g2o_solver_pcg
  g2o_solver_slam2d_linear
  g2o_solver_structure_only
  g2o_stuff
  g2o_types_data
  g2o_types_icp
  g2o_types_sba
  g2o_types_sclam2d
  g2o_types_sim3
  g2o_types_slam2d_addons
  g2o_types_slam2d
  g2o_types_slam3d_addons
  g2o_types_slam3d)
if(CSPARSE_FOUND)
  list(APPEND G2O_LIBS cxsparse)
  list(APPEND g2o_INCLUDE_DIRS ${CSPARSE_INCLUDE_DIR})
  list(APPEND g2o_LIBRARY_DIRS ${CSPARSE_LIBRARY_DIR})
  message(STATUS ${CSPARSE_LIBRARY_DIR})
else()
  list(APPEND g2o_INCLUDE_DIRS ${CMAKE_CURRENT_BINARY_DIR}/g2o/include/g2o/EXTERNAL/csparse)
  list(APPEND G2O_LIBS g2o_csparse)
endif()
if(WIN32)
  set(g2o_DLL_DIRS ${CMAKE_CURRENT_BINARY_DIR}/g2o/bin)
  file(GLOB G2O_DLLS ${g2o_DLL_DIRS}/*.dll)
  foreach(lb ${G2O_LIBS})
    list(APPEND G2O_LIBS_WIN ${lb}.lib)
  endforeach()
  set(G2O_LIBS ${G2O_LIBS_WIN})
elseif(UNIX)
  foreach(lb ${G2O_LIBS})
    list(APPEND G2O_LIBS_UNIX lib${lb}.so)
  endforeach()
  set(G2O_LIBS ${G2O_LIBS_UNIX})
endif()

ExternalProject_Add(g2o
  PREFIX g2o
  DEPENDS eigen
  GIT_REPOSITORY ${g2o_URL}
  GIT_TAG ${g2o_TAG}
  CMAKE_CACHE_ARGS
    -DBUILD_SHARED_LIBS:BOOL=${G2O_BUILD_SHARED}
    -DG2O_BUILD_APPS:BOOL=OFF
    -DG2O_BUILD_EXAMPLES:BOOL=OFF
    -DG2O_USE_CHOLMOD:BOOL=OFF
    -DG2O_USE_CSPARSE:BOOL=ON
    -DG2O_USE_OPENMP:BOOL=OFF
    -DCSPARSE_INCLUDE_DIR:STRING=${CSPARSE_INCLUDE_DIR}
    -DCSPARSE_LIBRARY:STRING=${CSPARSE_LIBRARY}
    -DEIGEN3_INCLUDE_DIR:STRING=${EIGEN3_INCLUDE_DIR}
    -DCMAKE_CXX_FLAGS_DEBUG:STRING=${CMAKE_CXX_FLAGS_DEBUG}
    -DCMAKE_CXX_FLAGS_RELEASE:STRING=${CMAKE_CXX_FLAGS_RELEASE}
    -DCMAKE_INSTALL_PREFIX:STRING=<INSTALL_DIR>)

include_directories(${g2o_INCLUDE_DIRS})
link_directories(${g2o_LIBRARY_DIRS})
