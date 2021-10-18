#### displayman

Set up a udev rule in e.g. `/lib/udev/rules.d/85-dock-rules` targeting your specific device.
`displayman` is a daemon that acts upon receiving a `USR1` signal.

```
SUBSYSTEM=="input", ACTION=="remove|add", ENV{ID_VENDOR_ID}=="2188" RUN+="/usr/bin/pkill -USR1 displayman"
```
