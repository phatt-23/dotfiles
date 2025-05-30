# OneDark Colors
set		$black         "#181a1f"
set		$bg0           "#282c34"
set		$bg1           "#31353f"
set		$bg2           "#393f4a"
set		$bg3           "#3b3f4c"
set		$bg_d          "#21252b"
set		$bg_blue       "#73b8f1"
set		$bg_yellow     "#ebd09c"
set		$fg            "#abb2bf"
set		$fg1           "#eeeeee"
set		$purple        "#c678dd"
set		$green         "#98c379"
set		$orange        "#d19a66"
set		$blue          "#61afef"
set		$yellow        "#e5c07b"
set		$cyan          "#56b6c2"
set		$red           "#e86671"
set		$grey          "#5c6370"
set		$light_grey    "#848b98"
set		$dark_cyan     "#2b6f77"
set		$dark_red      "#993939"
set		$dark_yellow   "#93691d"
set		$dark_purple   "#8a3fa0"
set 	$dark_dark_purple "#6a1f80"
set		$diff_add      "#31392b"
set		$diff_delete   "#382b2c"
set		$diff_change   "#1c3448"
set		$diff_text     "#2c5372"

# class                 	border      bground         	text    indicator child_border
# client.focused          	$bg3        $bg1            	$fg    $green    $bg3
client.focused          	$dark_purple     $dark_dark_purple   $fg1     $dark_purple   $dark_purple
client.focused_inactive 	$bg3        $bg1            	$fg     $green    $bg1
client.unfocused        	$bg1        $bg_d           	$fg     $green    $bg1
client.urgent           	$red        $orange         	$bg0    $green    $red
client.placeholder      	$bg0        $gray2          	$gray5  $green    $bg1
client.background       	$orange

for_window [all] title_format "%title [%class]"

bar {
	position bottom
	height 30
	status_command i3status -c ~/.config/i3/modules/i3status.i3

	colors {
		background $black
		statusline $fg
		separator  $bg1

		#selector          #border  #bg           #text
		focused_workspace  $dark_purple  $dark_dark_purple  $fg1
		# focused_workspace  $bg3     $bg2        $fg1
		active_workspace   $bg3     $bg0        $fg
		inactive_workspace $bg3     $bg0        $fg
		urgent_workspace   $red     $dark_red   $red
		binding_mode       $bg3     $bg_d       $fg
    }
}
