#!/bin/sh

OUT_PIN=4

clean_exit() {
	echo "Exiting..."
	exit 0
}

# ctrl-c detector
trap clean_exit INT

echo "Configuring output..."
raspi-gpio set $OUT_PIN ip

echo "Monitor Sensor..."

while true; do
	STATE=$(raspi-gpio get $OUT_PIN | grep -oE "level=[0-1]" | cut -d"=" -f2)
	echo "-> [$(date +%s)] State: $STATE"
done

