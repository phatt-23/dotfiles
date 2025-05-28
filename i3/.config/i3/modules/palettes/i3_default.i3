# class                 border  bground text    indicator child_border
client.focused          #4C7899 #285577 #FFFFFF #2E9EF4   #285577
client.focused_inactive #333333 #5F676A #FFFFFF #484E50   #5F676A
client.unfocused        #333333 #222222 #888888 #292D2E   #222222
client.urgent           #2F343A #900000 #FFFFFF #900000   #900000
client.placeholder      #000000 #0C0C0C #FFFFFF #000000   #0C0C0C

client.background       #FFFFFF

# for_window [all] title_format "%title <span foreground='#888888'><i>%class</i></span>"
for_window [all] title_format "%title [<i>%class</i>]"

bar {
    position bottom
    height 24
    status_command i3status -c ~/.config/i3/modules/i3status.i3
}
