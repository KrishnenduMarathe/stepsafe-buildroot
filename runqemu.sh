#!/bin/sh

KERNEL=buildroot/output/images/zImage
DTB=buildroot/output/images/bcm2708-rpi-zero-w.dtb
ROOTIMG=buildroot/output/images/sdcard.img

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

# fix image for nearest 2 power for qemu-system-arm
# hardcoded for 256
cp $ROOTIMG sdcard_qemu.img
qemu-img resize -f raw sdcard_qemu.img 256M

qemu-system-arm \
	-M raspi0 \
	-nographic \
	-kernel $KERNEL \
	-dtb $DTB \
	-drive format=raw,file=sdcard_qemu.img,if=sd \
	-serial mon:stdio \
	-append "rw earlycon=pl011,0x20201000 console=ttyAMA0 root=/dev/mmcblk0p2 rootwait"

# remove padded sdcard
rm sdcard_qemu.img

