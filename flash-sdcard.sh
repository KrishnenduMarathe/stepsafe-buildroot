#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "device to flash not passed"
	exit 1
fi

if [ ! -b "$1" ]; then
	echo "device does not exist"
	exit 1
fi

sudo dd if=buildroot/output/images/sdcard.img of=$1 bs=4M status=progress conv=fsync

