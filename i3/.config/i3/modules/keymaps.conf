

# screenshot mode


set $mode_screenshot "(Print) screenshot :: \
(f)ullscreen \
(g)ui \
"

bindsym Print exec flameshot gui

bindsym $mod+Print mode $mode_screenshot 
mode $mode_screenshot {
    bindsym g exec flameshot gui
    bindsym f exec flameshot full

    bindsym Print  mode "default" 
    bindsym Return mode "default"
    bindsym Escape mode "default"
}


# launch mode


set $mode_launcher "(o)pen :: \
(f)irefox \
(t)hunar \
(d)iscord \
(s)potify \
(e)asyeffects \
(z)athura \
ze(n) \
"

bindsym $mod+o mode $mode_launcher

mode $mode_launcher {
    bindsym f exec firefox                         ; mode "default"
    bindsym t exec thunar                          ; mode "default"
    bindsym s exec flatpak run com.spotify.Client  ; mode "default"
    bindsym d exec Discord                         ; mode "default"
    bindsym e exec easyeffects                     ; mode "default"
    bindsym z exec zathura                         ; mode "default"
    bindsym n exec zen-browser                     ; mode "default"

    bindsym $mod+o mode "default"
    bindsym Escape mode "default"
    bindsym Return mode "default"
}


# resize mode 


set $mode_resize "(r)esize :: \
(h)shrink-h \
(j)grow-v \
(k)shrink-v \
(l)grow-h \
(b)igger \
(s)maller \
"

bindsym $mod+r mode $mode_resize 

set $resize_unit 10
set $resize_unit_precise 5

mode $mode_resize {
    bindsym h resize shrink width $resize_unit_precise px or $resize_unit_precise ppt
    bindsym j resize grow height $resize_unit_precise px or $resize_unit_precise ppt
    bindsym k resize shrink height $resize_unit_precise px or $resize_unit_precise ppt
    bindsym l resize grow width $resize_unit_precise px or $resize_unit_precise ppt

    bindsym b resize grow width $resize_unit_precise px or $resize_unit_precise ppt \
            ; resize grow height $resize_unit_precise px or $resize_unit_precise ppt

    bindsym s resize shrink width $resize_unit_precise px or $resize_unit_precise ppt \
            ; resize shrink height $resize_unit_precise px or $resize_unit_precise ppt

    bindsym Shift+h resize shrink width $resize_unit px or $resize_unit ppt
    bindsym Shift+j resize grow height $resize_unit px or $resize_unit ppt
    bindsym Shift+k resize shrink height $resize_unit px or $resize_unit ppt
    bindsym Shift+l resize grow width $resize_unit px or $resize_unit ppt

    bindsym Shift+b resize grow width $resize_unit px or $resize_unit ppt \
                  ; resize grow height $resize_unit px or $resize_unit ppt

    bindsym Shift+s resize shrink width $resize_unit px or $resize_unit ppt \
                  ; resize shrink height $resize_unit px or $resize_unit ppt

    bindsym Left  resize shrink width  $resize_unit px or $resize_unit ppt
    bindsym Down  resize grow   height $resize_unit px or $resize_unit ppt
    bindsym Up    resize shrink height $resize_unit px or $resize_unit ppt
    bindsym Right resize grow   width  $resize_unit px or $resize_unit ppt

    bindsym Shift+Left  resize shrink 	width $resize_unit_precise px or $resize_unit_precise ppt
    bindsym Shift+Down  resize grow 	height $resize_unit_precise px or $resize_unit_precise ppt
    bindsym Shift+Up    resize shrink 	height $resize_unit_precise px or $resize_unit_precise ppt
    bindsym Shift+Right resize grow 	width $resize_unit_precise px or $resize_unit_precise ppt

    bindsym $mod+r mode "default"
    bindsym Return mode "default"
    bindsym Escape mode "default"
}


bindsym $mod+ctrl+h resize shrink 	width $resize_unit_precise px or $resize_unit_precise ppt
bindsym $mod+ctrl+j resize grow 	height $resize_unit_precise px or $resize_unit_precise ppt
bindsym $mod+ctrl+k resize shrink 	height $resize_unit_precise px or $resize_unit_precise ppt
bindsym $mod+ctrl+l resize grow 	width $resize_unit_precise px or $resize_unit_precise ppt

