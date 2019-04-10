if (CSPARSE_INCLUDE_DIR AND CSPARSE_LIBRARY)
  set(CSPARSE_FIND_QUIETLY TRUE)
endif (CSPARSE_INCLUDE_DIR AND CSPARSE_LIBRARY)

# Look for csparse; note the difference in the directory specifications!
find_path(CSPARSE_INCLUDE_DIR NAMES cs.h
  PATHS
  ${CSPARSE_DIR}/include
  /usr/include/suitesparse
  /usr/include
  /opt/local/include
  /usr/local/include
  /sw/include
  /usr/include/ufsparse
  /opt/local/include/ufsparse
  /usr/local/include/ufsparse
  /sw/include/ufsparse
  PATH_SUFFIXES
  suitesparse
)

if(CSPARSE_INCLUDE_DIR)
  set(CSPARSE_LIBRARY_DIR ${CSPARSE_INCLUDE_DIR}/../lib)
endif()

set(CSPARSE_G2O_DEPENDENCY cxsparse)
foreach(lb ${CSPARSE_G2O_DEPENDENCY})
  find_library(${lb} NAMES ${lb} lib${lb}
    PATHS
    ${CSPARSE_DIR}/lib
    ${CSPARSE_LIBRARY_DIR}
    /usr/lib
    /usr/local/lib
    /opt/local/lib
    /sw/lib
  )
  list(APPEND CSPARSE_LIBRARY ${${lb}})
endforeach()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CSPARSE DEFAULT_MSG
  CSPARSE_INCLUDE_DIR CSPARSE_LIBRARY_DIR CSPARSE_LIBRARY)
