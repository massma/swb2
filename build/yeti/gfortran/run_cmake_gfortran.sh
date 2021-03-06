#!/bin/bash
#remove existing Cmake cache and directories
# remove existing Cmake cache and directories
rm -rf CMake*
rm -rf Testing
rm -rf src
rm -rf tests
rm -f CPack*
rm -f *.txt

export GFORTRAN=gfortran
export GCC=gcc

# define other variables for use in the CMakeList.txt file
# options are "Release" or "Debug"
export BUILD_TYPE="Release"

# define platform and compiler specific compilation flags
export CMAKE_Fortran_FLAGS_DEBUG="-O0 -g -ggdb -Wuninitialized -fbacktrace -fcheck=all -fexceptions -fmax-errors=6 -fbackslash -ffree-line-length-none -Wno-maybe-uninitialized"
export CMAKE_Fortran_FLAGS_RELEASE="-O2 -mtune=native -ffree-line-length-512 -fbackslash -ffpe-summary='none' -Wno-maybe-uninitialized"

# set important environment variables
export FC=$GFORTRAN
export CC=$GCC

#module purge && module load legacy && module load gcc/6.1 && \
#  module load hdf5-serial/1.10.1-gcc6.1.0 && \
#  module load netcdf-serial/4.4.1.1-hdf51.10.1-gcc6.1.0 && \
#  module load cmake/3.15.4 && \
#  module load zlib/1.2.11-gcc && \

#module swap phdf5 hdf5/1.10.5 &&                          \ 

module load netcdf/4.7.1  &&                                 \
  module load cmake &&                                        \
cmake "../../.." -G "Unix Makefiles"                         \
-DCMAKE_BUILD_TYPE="$BUILD_TYPE "                            \
-DCMAKE_Fortran_FLAGS_DEBUG="$CMAKE_Fortran_FLAGS_DEBUG "    \
-DCMAKE_Fortran_FLAGS_RELEASE="$CMAKE_Fortran_FLAGS_RELEASE"
