# TODO: wtf touchpad controls
bindsym XF86TouchpadToggle exec $scripts_path/toggle_touchpad.sh # toggle touchpad

# exec always go here
set $tp "SynPS/2 Synaptics TouchPad"
# set $tp "ELAN0001:00 04F3:3140 Touchpad"

exec_always xinput set-prop $tp "Device Enabled" 1
exec_always xinput set-prop $tp "libinput Tapping Enabled" 1
exec_always xinput set-prop $tp "libinput Natural Scrolling Enabled" 1
exec_always xinput set-prop $tp "libinput Middle Emulation Enabled" 1
exec_always xinput set-prop $tp "libinput Accel Speed" 0.4


