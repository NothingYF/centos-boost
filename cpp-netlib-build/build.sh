#!/bin/sh
cmake -DCMAKE_BUILD_TYPE=Release     \
      -DCMAKE_C_COMPILER=clang     \
      -DCMAKE_CXX_COMPILER=clang++ \
      /cpp-netlib-0.11.2-final
make
make install
