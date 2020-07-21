@echo off
:: remove existing Cmake cache and directories
del /F /Q CMakeCache.*
rmdir /S /Q CMakeFiles
rmdir /S /Q src
rmdir /S /Q test
del /S /Q *.txt

:: set CMAKE-related and build-related variables
set CMAKEROOT=C:\Program Files\CMake
set COMPILER_DIR=d:\Mingw64
set FC=gfortran
set CC=gcc

set MAKE_EXECUTABLE_NAME=mingw32-make.exe


:: define where 'make copy' will place executables
set INSTALL_PREFIX=d:/bin

:: define other variables for use in the CMakeList.txt file
:: options are "Release", "Profile" or "Debug"
set BUILD_TYPE="Release"

:: define platform and compiler specific compilation flags
set CMAKE_Fortran_FLAGS_DEBUG="-Og -g -ggdb -fbacktrace -cpp -fcheck=all -fstack-usage -fexceptions -ffree-line-length-none -static -static-libgcc -static-libgfortran -ffpe-trap=zero,overflow"
set CMAKE_Fortran_FLAGS_RELEASE="-O2 -cpp -fno-aggressive-loop-optimizations -ffree-line-length-none -static -static-libgcc -static-libgfortran"
set CMAKE_Fortran_FLAGS_PROFILE="-O2 -pg -cpp -ffree-line-length-none -fno-omit-frame-pointer -DNDEBUG -fno-inline-functions -fno-inline-functions-called-once -fno-optimize-sibling-calls -static -static-libgcc -static-libgfortran"
::set CMAKE_Fortran_FLAGS_RELEASE="-O3 -mtune=native -fopenmp -flto -ffree-line-length-none -static-libgcc -static-libgfortran -DCURL_STATICLIB"

:: set a useful alias for make
echo %COMPILER_DIR%\bin\%MAKE_EXECUTABLE_NAME% %%1 > make.bat

:: invoke CMake; add --trace to see copious details re: CMAKE

cmake ..\..\.. -G "MinGW Makefiles" ^
-DCMAKE_C_COMPILER=%CMAKE_C_COMPILER%   ^
-DCMAKE_BUILD_TYPE=%BUILD_TYPE%  ^
-DCMAKE_INSTALL_PREFIX:PATH=%INSTALL_PREFIX% ^
-DCMAKE_Fortran_FLAGS_DEBUG=%CMAKE_Fortran_FLAGS_DEBUG%  ^
-DCMAKE_Fortran_FLAGS_RELEASE=%CMAKE_Fortran_FLAGS_RELEASE% ^
-DCMAKE_Fortran_FLAGS_PROFILE=%CMAKE_Fortran_FLAGS_PROFILE%
