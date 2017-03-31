#!/bin/bash
#remove existing Cmake cache and directories
# remove existing Cmake cache and directories
rm -fr CMake*
rm -rf Testing
rm -rf src
rm -rf tests
rm -f CPack*
rm -f *.txt

export GCC_VERSION=5.4.0
# set CMAKE-related and build-related variables
export GCCLIST=$( locate gcc-5 | grep Cellar | grep bin | grep $GCC_VERSION )
export GCCARR=($GCCLIST)
export GCC=${GCCARR[1]}
export GFORTRANLIST=$( locate gfortran-5 | grep Cellar | grep bin | grep $GCC_VERSION )
export GFORTRANARR=($GFORTRANLIST)
export GFORTRAN=${GFORTRANARR[1]}

export GPP=/opt/local/bin/g++-mp-5
export CMAKEROOT=/usr/bin/cmake
export R_HOME=/usr/bin/R

export LIB_HDF5_HL=$( locate hdf5_hl.a | grep Cellar )
export LIB_HDF5=$( locate hdf5.a | grep Cellar )
export LIB_NETCDF=$( locate netcdf.dylib | grep Cellar )
export LIB_Z=$( locate libz.a | grep Cellar )
export LIB_SZ=$( locate libsz.a | grep Cellar )
export LIB_GCC=$( locate libgcc.a | grep Cellar | grep $GCC_VERSION | grep -v i386 )
export LIB_GFORTRAN=$( locate libgfortran.a | grep Cellar | grep $GCC_VERSION | grep -v i386 )

export PATH=/usr/local:/usr/local/bin:/usr/local/lib:/usr/bin/cmake:$PATH

# define where 'make copy' will place executables
export INSTALL_PREFIX=/usr/local/bin

# define other variables for use in the CMakeList.txt file
# options are "Release" or "Debug"
export BUILD_TYPE="RELEASE"
export SYSTEM_TYPE="MacOS"

# define platform and compiler specific compilation flags
export CMAKE_Fortran_FLAGS_DEBUG="-O0 -g -ggdb -Wuninitialized -fbacktrace -fcheck=all -fexceptions -fsanitize=null -fsanitize=leak -fmax-errors=6 -fbackslash -ffree-line-length-none"
export CMAKE_Fortran_FLAGS_RELEASE="-O2 -mtune=native -ffree-line-length-512 -fbackslash -ffpe-summary='none'"

# set important environment variables
export FC=$GFORTRAN
export CC=$GCC
export CXX=$GPP

cmake "../../.." -G "Unix Makefiles"                         \
-DSYSTEM_TYPE="$SYSTEM_TYPE "                                \
-DCMAKE_BUILD_TYPE="$BUILD_TYPE "                            \
-DLIB_HDF5_HL="$LIB_HDF5_HL "                                \
-DLIB_HDF5="$LIB_HDF5 "                                      \
-DLIB_Z="$LIB_Z "                                            \
-DLIB_SZ="$LIB_SZ "                                          \
-DLIB_NETCDF="$LIB_NETCDF "                                  \
-DLIB_GCC="$LIB_GCC "                                        \
-DLIB_GFORTRAN="$LIB_GFORTRAN "                              \
-DCMAKE_INSTALL_PREFIX:PATH="$INSTALL_PREFIX "               \
-DCMAKE_Fortran_FLAGS_DEBUG="$CMAKE_Fortran_FLAGS_DEBUG "    \
-DCMAKE_Fortran_FLAGS_RELEASE="$CMAKE_Fortran_FLAGS_RELEASE"