#!/bin/sh

git submodule init
git submodule sync
git submodule update

# avoid LD_LIBRARY_PATH errors
unset LD_LIBRARY_PATH

make -C buildroot BR2_EXTERNAL=../base_external

