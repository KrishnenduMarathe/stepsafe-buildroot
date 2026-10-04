#!/bin/sh

make -C buildroot savedefconfig BR2_DEFCONFIG=../base_external/config/stepsafe_defconfig

if [ -e buildroot/.config ] && ls buildroot/output/build/linux-*/.config > /dev/null; then
	grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" buildroot/.config > /dev/null

	if [ $? -eq 0 ]; then
		echo "-> Found custom linux setup. Saving linux config file..."
		make -C buildroot linux-update-defconfig
	fi
fi

