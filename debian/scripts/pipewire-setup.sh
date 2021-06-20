#!/usr/bin/env bash

set -euxo pipefail

pactl load-module module-null-sink object.linger=1 media.class=Audio/Sink sink_name="Custom Sink 1" channel_map=stereo
pactl load-module module-null-sink object.linger=1 media.class=Audio/Sink sink_name="Custom Sink 2 (mono)" channel_map=mono

pactl load-module module-null-sink object.linger=1 media.class=Audio/Sink/Virtual sink_name="Custom Source 1" channel_map=stereo
pactl load-module module-null-sink object.linger=1 media.class=Audio/Sink/Virtual sink_name="Custom Source 2 (mono)" channel_map=mono

### pipewire does not support module-remap-source (yet)
# remap scarlett channel 1 (left / Mic in) to mono
# pactl load-module module-remap-source \
#   source_name=scarlett_xlr_1 \
#   master=alsa_input.usb-Focusrite_Scarlett_2i2_USB_Y84Q6XE0693B8F-00.analog-stereo \
#   channels=1 \
#   remix=no \
#   master_channel_map=front-left \
#   channel_map=mono \
#   source_properties="device.description='Scarlett 1 (Mic)'"
# 
# # remap scarlett channel 2 (right / DI in) to mono
# pactl load-module module-remap-source \
#   source_name=scarlett_xlr_2 \
#   master=alsa_input.usb-Focusrite_Scarlett_2i2_USB_Y84Q6XE0693B8F-00.analog-stereo \
#   channels=1 \
#   remix=no \
#   master_channel_map=front-right \
#   channel_map=mono \
#   source_properties="device.description='Scarlett 2 (DI)'"
