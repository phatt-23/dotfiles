exec --no-startup-id "redshift -P -O 6500"

set $mode_redshift "Set colour temperature: (a)uto, (r)eset, (2)500, (3)000, (4)000, (5)000 (6)500"

bindsym $mod+ctrl+r mode $mode_redshift

mode $mode_redshift {
    bindsym a exec --no-startup-id "redshift -P -t 5000:4000", mode "default"
    bindsym r exec --no-startup-id "redshift -x", mode "default"

    bindsym 2 exec --no-startup-id "redshift -P -O 2500", mode "default"
    bindsym 3 exec --no-startup-id "redshift -P -O 3000", mode "default"
    bindsym 4 exec --no-startup-id "redshift -P -O 4000", mode "default"
    bindsym 5 exec --no-startup-id "redshift -P -O 5000", mode "default" 
    bindsym 6 exec --no-startup-id "redshift -P -O 6500", mode "default" 

    bindsym Return mode "default"
    bindsym Escape mode "default"
}
