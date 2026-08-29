#!/bin/sh

mkdir build
cd build

# OctoMap 1.10 predates CMake 4; remove after a release containing
# https://github.com/OctoMap/octomap/commit/79cd7fddd3d0b7448e2a1ee0524ca89b292485d3
cmake ${CMAKE_ARGS} .. \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_OCTOVIS_SUBPROJECT=OFF \
      -DBUILD_DYNAMICETD3D_SUBPROJECT=OFF \
      -DCMAKE_INSTALL_LIBDIR=lib

make -j${CPU_COUNT}
make install
