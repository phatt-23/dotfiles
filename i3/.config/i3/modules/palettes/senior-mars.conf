#---( colors table )---#

# cOne is color one and cTwo is colorTwo
set $cOne #dfaf87
set $cTwo #1d2021

set $aqua #8EC07C
set $back #0E1018
set $red #fb4934
set $orange #fe8019
set $text #ffffff

# colour of border, background, text, indicator, and child_border
client.focused          $cOne $back $cOne $cOne $cOne
client.focused_inactive $cTwo $cTwo $cOne $cTwo $cTwo
client.unfocused        $cTwo $cTwo $cOne $cTwo $cTwo
client.urgent           $cTwo $cTwo $cOne $cTwo $cTwo
client.placeholder      $cTwo $cTwo $cOne $cTwo $cTwo
client.background       $cTwo

bar {
    position bottom
    status_command i3status -c ~/.config/i3/modules/i3status.conf

    colors {
        background $back
        statusline $text
        separator  $cOne

        #selector          #border #bg   #text
        focused_workspace  $orange $cTwo $orange
        active_workspace   $back   $cTwo $cOne
        inactive_workspace $back   $cTwo $cOne
        urgent_workspace   $back   $cTwo $cOne
        binding_mode       $back   $cTwo $cOne
    }
}
