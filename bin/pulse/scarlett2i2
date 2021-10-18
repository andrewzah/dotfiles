# remap scarlett channel 1 (left / Mic in) to mono
pactl load-module module-remap-source \
  source_name=scarlett_xlr_1 \
  master=alsa_input.usb-Focusrite_Scarlett_2i2_USB_Y84Q6XE0693B8F-00.analog-stereo \
  channels=1 \
  remix=no \
  master_channel_map=front-left \
  channel_map=mono \
  source_properties="device.description='Scarlett 1 (Mic)'"

# remap scarlett channel 2 (right / DI in) to mono
pactl load-module module-remap-source \
  source_name=scarlett_xlr_2 \
  master=alsa_input.usb-Focusrite_Scarlett_2i2_USB_Y84Q6XE0693B8F-00.analog-stereo \
  channels=1 \
  remix=no \
  master_channel_map=front-right \
  channel_map=mono \
  source_properties="device.description='Scarlett 2 (DI)'"
