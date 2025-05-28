# Gruber Theme

set $bg0 #181818
set $bg1_5 #202020
set $bg1 #282828
set $bg2 #453d41
set $bg3 #484848
set $bg4 #52494e

set $fg0 #e4e4ef
set $fg1 #EEE8D5

set $ignore #000000
set $yellow #ffdd33
set $yellow_dark #b29a23 

set $niagara_0 #303540
set $niagara_1 #565f73
set $niagara_2 #96a6c8

# class                 border      bground     text 	indicator child_border
client.focused          $niagara_1  $niagara_0  $fg0 	$bg3      $niagara_1
client.focused_inactive $bg1        $bg0        $fg0 	$bg1      $bg1 
client.unfocused        $bg1        $bg0        $bg4 	$bg1      $bg1 
client.urgent           $bg1        $highlight  $bg1 	$bg1      $bg1 
client.placeholder      $ignore     $bg1        $fg0 	$ignore   $bg2
client.background       $bg1 

for_window [all] title_format "%title [<i>%class</i>]"

bar {
    position bottom
    height 30
    status_command i3status -c ~/.config/i3/modules/i3status.i3

    colors {
		background $bg0
		statusline $fg0
		separator  $bg1

		#selector          #border  #bg         #text
		focused_workspace  $niagara_1     $niagara_0        $fg0
		active_workspace   $niagara_1     $bg0        $fg0
		inactive_workspace $bg2     $bg0        $bg2
		urgent_workspace   $red     $dark_red   $yellow
		binding_mode       $bg3     $bg_d       $fg
    }

}

