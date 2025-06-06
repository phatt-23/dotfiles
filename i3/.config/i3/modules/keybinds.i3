# modifier to move around floating windows
floating_modifier $mod


# enables mouse to manip windows
tiling_drag modifier titlebar


# kill focused window
bindsym $mod+Shift+q kill


# change focus - alternatively, you can use the cursor keys:
bindsym $mod+h     focus left
bindsym $mod+j     focus down
bindsym $mod+k     focus up
bindsym $mod+l     focus right

bindsym $mod+Left  focus left
bindsym $mod+Down  focus down
bindsym $mod+Up    focus up
bindsym $mod+Right focus right


# move focused window - alternatively, you can use the cursor keys:
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

bindsym $mod+Shift+Left  move left
bindsym $mod+Shift+Down  move down
bindsym $mod+Shift+Up    move up
bindsym $mod+Shift+Right move right


# change container layout
bindsym $mod+w layout toggle stacking tabbed 
bindsym $mod+e layout toggle split


# toggle tiling / floating
bindsym $mod+Shift+space floating toggle


# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle


# command for exiting i3 session
set $i3_exit_command_with_prompt "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"


# $mod+i prefix, i3mode 
set $mode_i3      "(i)3 :: (f)ullscreen (s)ticky (v)split (h)split (p)arent (q)uit"
set $mode_i3_exit "(i)(e)xit :: (Y)es (n)o"
set $mode_i3_quit "(i)(q)uit :: (l)ock (e)xit (s)uspend (h)ibernate (r)eboot (p)oweroff"


bindsym $mod+i mode $mode_i3
mode $mode_i3 {
	bindsym f       fullscreen toggle ; mode "default"
	bindsym s       sticky toggle     ; mode "default"
	bindsym v       split vertical    ; mode "default"
	bindsym h       split horizontal  ; mode "default"
	bindsym p       focus parent      ; mode "default" 

	bindsym q       mode $mode_i3_quit

	bindsym $mod+i mode "default"
	bindsym Return mode "default"
	bindsym Escape mode "default"
}


mode $mode_i3_quit {
    	bindsym l exec "i3lock -c '#000000' ; mode 'default'" 	; mode "default"
    	bindsym s exec "systemctl suspend"                    	; mode "default"
    	bindsym r exec "systemctl reboot"                     	; mode "default"
    	bindsym p exec "systemctl poweroff"                   	; mode "default"
	bindsym h exec "systemctl hibernate"			; mode "default"

    	bindsym e exec $i3_exit_command_with_prompt 

    	bindsym q              mode "default"
    	bindsym Return         mode "default"
    	bindsym Escape         mode "default"
}


# scratchpad
bindsym $mod+Shift+S move scratchpad 
bindsym $mod+S       scratchpad show 


# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)


# dmenu
bindsym $mod+b exec --no-startup-id dmenu_run


