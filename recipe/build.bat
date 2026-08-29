mkdir build
cd build

REM OctoMap 1.10 predates CMake 4; remove after a release containing
REM https://github.com/OctoMap/octomap/commit/79cd7fddd3d0b7448e2a1ee0524ca89b292485d3
cmake .. ^
	  -G "NMake Makefiles" ^
      -D CMAKE_POLICY_VERSION_MINIMUM=3.5 ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_VERBOSE_MAKEFILE=ON ^
      -D BUILD_SHARED_LIBS=ON ^
      -D CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=TRUE ^
      -D CMAKE_INSTALL_LIBDIR=lib ^
      -D BUILD_OCTOVIS_SUBPROJECT=OFF ^
      -D BUILD_DYNAMICETD3D_SUBPROJECT=OFF

if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1
