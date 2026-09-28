#!/bin/sh

git submodule init
git submodule sync
git submodule update

make -C buildroot BR2_EXTERNAL=../base_external

