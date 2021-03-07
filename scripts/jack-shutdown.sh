#!/bin/bash

SINK='alsa_input.usb-Focusrite_Scarlett_2i2_USB_Y84Q6XE0693B8F-00.analog-stereo'
SOURCE='alsa_output.usb-Focusrite_Scarlett_2i2_USB_Y84Q6XE0693B8F-00.analog-stereo.monitor'

jack_control stop

pacmd set-default-source "$SOURCE"
pacmd set-default-sink "$SINK"

pulseaudio -k
