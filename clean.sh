#!/bin/sh

if [ "$1" = "full" ]; then
	echo "Running full clean..."
	make -C buildroot distclean
else
	echo "Running standard clean..."
	make -C buildroot clean
fi
