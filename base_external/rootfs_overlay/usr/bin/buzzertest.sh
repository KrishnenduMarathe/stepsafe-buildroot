#!/bin/sh

BUZZER=17

clean_exit() {
	echo "Exiting..."
	raspi-gpio set $BUZZER op dl
	exit 0
}

# ctrl-c detector
trap clean_exit INT

echo "Starting Buzzer for 1 second..."

while true; do
	echo "-> buzz for 1 second..."
	raspi-gpio set $BUZZER op dh
	sleep 1
	echo "-> stop for 1 second"
	raspi-gpio set $BUZZER op dl
	sleep 1
done

