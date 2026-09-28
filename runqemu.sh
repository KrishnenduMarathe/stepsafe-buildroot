#!/bin/sh

KERNEL=
DTB=
ROOTIMG=

if [ ! -e "$KERNEL" ]; then
	echo "$KERNEL doesn't exist"
	exit 1
fi

if [ ! -e "$DTB" ]; then
	echo "$DTB doesn't exist"
	exit 1
fi

if [ ! -e "$ROOTIMG" ]; then
	echo "$ROOTIMG doesn't exist"
	exit 1
fi

qemu-system-arm \
	-M raspi0 \
	-cpu arm1176 \
	-m 512 -nographic -smp 1 \
	-kernel $KERNEL \
	-dtb $DTB \
	-drive format=raw,file=$ROOTIMG,if=none,id=sd \
	-device sd-card,drive=sd
	-append "rw console=ttyAMA0 root=/dev/mmcblk0 fsck.repair=yes rootwait" \
	-netdev user,id=eth0,hostfwd=tcp::10022-:22 \
	-device virtio-net-device,netdev=eth0

