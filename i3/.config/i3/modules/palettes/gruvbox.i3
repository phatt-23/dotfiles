set $ignore #000000

set $bg0 #1b1b1b
set $bg1 #282828
set $bg2 #504945
set $bg3 #665c54
set $bg4 #7c6f64

set $fg1 #bdae93
set $fg2 #d5c4a1
set $fg3 #ebdbb2

set $red0 #cc241d

# class                 border  bground text indicator child_border
client.focused          $bg2    $bg1    $fg3 $bg3      $bg2
client.focused_inactive $bg1    $bg0    $fg1 $bg1      $bg1 
client.unfocused        $bg1    $bg0    $bg4 $bg1      $bg1 
client.urgent           $bg1    $red0   $bg1 $bg1      $bg1 
client.placeholder      $ignore $bg1    $fg1 $ignore   $bg2 
client.background       $bg1 


bar {
	position bottom
	height 30
	status_command i3status -c ~/.config/i3/modules/i3status.i3

	colors {
		background $bg0
		statusline $fg1
		separator  $bg1

		#selector          #border  #bg     #text
		focused_workspace  $bg4     $bg2    $fg1
		active_workspace   $bg2     $bg1    $fg1
		inactive_workspace $bg2     $bg0    $fg
		urgent_workspace   $red0    $bg0    $fg1
		binding_mode       $bg2     $bg0    $fg1
    }
}
