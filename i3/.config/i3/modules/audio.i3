# Amount to increase/decrease volume as a percentage
# set $volumepath ~/.config/i3/modules/scripts/volume
# set $volumestep 1
#
# bindsym XF86AudioRaiseVolume exec --no-startup-id $volumepath/volume -n up $volumestep
# bindsym XF86AudioLowerVolume exec --no-startup-id $volumepath/volume -n down $volumestep
# bindsym XF86AudioMute exec --no-startup-id $volumepath/volume -n mute
#
# # media player controls
# bindsym XF86AudioPlay  exec $scripts_path/toggle_play_pause.sh 
# bindsym XF86AudioPause exec playerctl pause
# bindsym XF86AudioNext  exec playerctl next
# bindsym XF86AudioPrev  exec playerctl previous

# # for pausing - if there is anything playing other than spotify, it will toggle play/pause on that source
exec playerctl --player=vlc, spotify next

bindsym XF86AudioRaiseVolume exec amixer set Master 1%+
bindsym XF86AudioLowerVolume exec amixer set Master 1%-
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext  exec playerctl next
bindsym XF86AudioPrev  exec playerctl previous
