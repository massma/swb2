find_library(ZLIB_LIBRARY
  NAMES zlib libz zlibstatic z 
  HINTS ${LD_LIBRARY_PATH} /usr/local/opt/zlib /usr "c:/MinGW64" "c:/Program Files"
  PATH_SUFFIXES lib lib/x86_64-linux-gnu/ local/lib/ local/lib64 x86_64-w64-mingw32/lib "NetCDF"
  DOC "zlib library")

if( ZLIB_LIBRARY )
  message("-- adding ZLIB_LIBRARY to project")
  add_library(ZLIB_LIBRARY UNKNOWN IMPORTED
             GLOBAL
  )
endif()
