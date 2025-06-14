### necessities
# for the .desktop files to work
exec --no-startup-id dex-autostart --autostart --environment i3
# for wifi
exec --no-startup-id nm-applet
# for fonts
exec --no-startup-id fc-cache -fv

exec xset s off && xset -dpms

### custom
# fast keypress repreating defaults are: 660 25
# exec_always xset r rate 200 30 
exec_always xset r rate 150 40
# exec_always --no-startup-id xmodmap /home/phatt/.Xmodmap

exec_always gsettings set org.gnome.settings-daemon.plugins.power idle-dim                       false
exec_always gsettings set org.gnome.desktop.screensaver           idle-activation-enabled        true
exec_always gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout      1000000000
exec_always gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 1000000000

# window compositor
exec_always --no-startup-id picom --backend glx -bc --vsync

# fix screen tear
exec_always xrandr --output HDMI-1 --set TearFree on
exec_always xrandr --output eDP-1 --set TearFree on
