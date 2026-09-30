#!/bin/sh

EXTERNAL_PACKAGES=../base_external/
CUSTOM_DEFCONFIG=../base_external/config/stepsafe_defconfig
EXISTING_DEFCONFIG=./base_external/config/stepsafe_defconfig

if [ -e ${EXISTING_DEFCONFIG} ]; then
	# custom defconfig found
	echo "-> USING EXISTING DEFCONFIG base_external/config/stepsafe_defconfig"
	make -C buildroot defconfig BR2_EXTERNAL=${EXTERNAL_PACKAGES} BR2_DEFCONFIG=${CUSTOM_DEFCONFIG}

else
	# custom defconfig not found
	echo "-> CREATING NEW DEFCONFIG FOR RASPBERRY PI ZERO W"
	echo "--> remember to store this config using save-config.sh"
	make -C buildroot raspberrypi0w_defconfig BR2_EXTERNAL=${EXTERNAL_PACKAGES}

fi

