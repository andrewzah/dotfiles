#!/bin/bash

set -ex

a2jmidid -e &

SINK='alsa_input.usb-Focusrite_Scarlett_2i2_USB_Y84Q6XE0693B8F-00.analog-stereo'
SOURCE='alsa_output.usb-Focusrite_Scarlett_2i2_USB_Y84Q6XE0693B8F-00.analog-stereo.monitor'

pacmd suspend-sink $SINK true
pacmd suspend-sink $SOURCE true

pacmd load-module module-jack-sink channels=2
pacmd load-module module-jack-source channels=2

### Make some devices default
pacmd set-default-sink jack_out
pacmd set-default-source jack_in

pacmd load-module module-loopback source=jack_in sink=alsa_output.usb-Schiit_Audio_Modi_Multibit-00.analog-stereo channels=2
