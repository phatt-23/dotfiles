# zenburn colors
set $background_darker     #181818
set $background_dark       #303030
set $background            #3f3f3f
set $foreground            #dcdccc
set $cursor                #f0deae
set $cursor_text_color     #000
set $selection_background  #21322f
set $color0                #4d4d4d
set $color8                #709080
set $color1                #705050
set $color9                #dca3a3
set $color2                #60b48a
set $color10               #c3bf9f
set $color10_dark          #c39f7f
set $color3                #f0deae
set $color11               #dfcf9f
set $color4                #506070
set $color12               #94bff3
set $color5                #dc8cc3
set $color13               #ec93d3
set $color6                #7cc0c3
set $color14               #93e0e3
set $color7                #dcdccc
set $color15               #ffffff
set $selection_foreground  #3f3f3f

# class                 border           bground            text        indicator child_border
client.focused          $color0          $background        $foreground $color0   $color0
client.focused_inactive $background_dark $background_darker $foreground $color0   $background_dark
client.unfocused        $background_dark $background_darker $foreground $color0   $background_dark
client.urgent           $color1 $color9 $background $color0   $background_dark
client.placeholder      $background_dark $background_darker $foreground $color0   $background_dark
client.background       $background_dark

bar {

	# The command for the status line
    status_command i3status -c ~/.config/i3/modules/i3status.i3

	# The position of the bar (top/bottom)
	position bottom

	# font for the bar. ISO 10646 = Unicode
	# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
    
	# Specifies whether workspace buttons should be shown or not
	workspace_buttons yes

	colors {
        background $background_darker
        statusline $foreground
        separator  $background

        #selector          #border      #bg                 #text
        focused_workspace  $color2   $background         $foreground
        active_workspace   $color0      $background_dark    $foreground
        inactive_workspace $color0      $background_dark    $foreground
        urgent_workspace   $color1      $color9             $background
        binding_mode       $color0      $background_dark    $foreground
	}

}
