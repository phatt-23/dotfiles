# lackluster colors
set $lack #708090
set $luster #deeeed
set $orange #ffaa88
set $yellow #abab77
set $green #789978
set $blue #7788AA
set $red #D70000
set $black #000000
set $backg #101010
set $gray1 #080808
set $gray2 #191919
set $gray3 #2a2a2a
set $gray4 #444444
set $gray5 #555555
set $gray6 #7a7a7a
set $gray7 #aaaaaa
set $gray8 #cccccc
set $gray9 #DDDDDD

# class                 border  bground text    indicator child_border
client.focused          $gray5  $gray3  $luster $gray6 $gray5
client.focused_inactive $gray4  $gray2  $gray5  $gray5 $gray4
client.unfocused        $gray4  $gray2  $gray5  $gray5 $gray4
client.urgent           $red    $orange $gray5  $lack  $red
client.placeholder      $gray4  $gray2  $gray5  $gray5 $gray4
client.background       $orange

for_window [all] title_format " %title [%class]"

set $wallpaper_path /home/phatt/Pictures/Wallpapers/lackluster.png
exec_always feh [--no-startup-id] --no-fehbg --bg-max $wallpaper_path

bar {
    position top 
    status_command i3status -c ~/.config/i3/modules/i3status.conf

    colors {
        # background $backg
        background #000000
        statusline $luster
        separator  $gray5

        #selector          #border #bg     #text
        focused_workspace  $gray6  $gray4  $luster
        active_workspace   $gray5  $gray3  $luster
        inactive_workspace $gray4  $gray3  $gray6
        urgent_workspace   $red    $orange $red
        binding_mode       $gray4  $gray3  $gray7
    }
}
