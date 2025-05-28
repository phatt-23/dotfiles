# Custom TokyoNight Palette

set $bg        "#1a1b26"
set $bg_dark   "#16161e"
set $bg_dark1  "#0C0E14"
set $fg        "#c0caf5"
set $fg_gutter "#3b4261"
set $green     "#9ece6a"
set $magenta   "#bb9af7"
set $purple    "#9d7cd8"
set $red       "#f7768e"
set $red1      "#db4b4b"

# Window border colors
client.focused              $purple     $magenta    $bg_dark1   $magenta    $purple
client.focused_inactive     $purple     $magenta    $bg_dark1   $bg         $bg
client.unfocused            $bg         $bg_dark1   $fg         $green      $bg
client.urgent               $red1       $red        $red1       $red1       $red1
client.placeholder          $bg         $bg         $fg         $bg         $bg
client.background           $orange

for_window [all] title_format "%title [%class]"

bar {
	position bottom
	height 30
	status_command i3status -c ~/.config/i3/modules/i3status.i3

	colors {
		background $bg_dark1
		statusline $fg
		separator  $fg_gutter

		#                     border    bg          text
		focused_workspace   $purple $magenta    $bg
		active_workspace    $purple $magenta    $bg
		inactive_workspace  $bg     $bg_dark    $fg
		urgent_workspace    $red1   $red        $red1
		binding_mode        $purple $magenta    $bg
	}
}

