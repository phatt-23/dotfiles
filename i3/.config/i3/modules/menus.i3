# start dmenu (a program launcher)
bindsym $mod+c exec --no-startup-id "dmenu_run -fn -p 'dmenu'"

# rofi menu
bindsym $mod+d exec "rofi -i -show drun -show-icons"
bindsym $mod+shift+d exec "rofi -i -show window -show-icons"

set $mode_rofi_menu "(m)enu :: (m)onitor (a)udio (o)utput"

bindsym $mod+m mode $mode_rofi_menu

mode $mode_rofi_menu {
    bindsym m exec $scripts_path/monitor_profiles.sh  ; mode "default"
    bindsym a exec $scripts_path/audio_outputs.sh     ; mode "default"
    bindsym o exec $scripts_path/send_ws_to_output.sh ; mode "default"
    
    bindsym $mod+m mode "default" 
    bindsym Return mode "default"
    bindsym Escape mode "default"
} 


