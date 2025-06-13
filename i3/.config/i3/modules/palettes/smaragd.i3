# class                 border  bground text    indicator child_border
client.focused          #2A6870 #1F4E54 #FFFFFF #2A6870   #1F4E54
client.focused_inactive #333333 #5F676A #FFFFFF #484E50   #5F676A
client.unfocused        #333333 #222222 #888888 #292D2E   #222222
client.urgent           #2F343A #900000 #FFFFFF #900000   #900000
client.placeholder      #000000 #0C0C0C #FFFFFF #000000   #0C0C0C

client.background       #FFFFFF

for_window [all] title_format "%title [%class]"

bar {
    status_command i3status -c ~/.config/i3/modules/i3status.i3
    position bottom
    height 20
    colors {
        background #000000
        statusline #FFFFFF
        separator  #666666

        focused_workspace  #2A6870 #1F4E54 #FFFFFF
        active_workspace   #333333 #222222 #FFFFFF
        inactive_workspace #333333 #222222 #888888
        urgent_workspace   #2F343A #900000 #FFFFFF
        binding_mode       #2F343A #900000 #FFFFFF
    }
}


