# lackluster colors

set $_nc #1f1d30
set $base #232136
set $surface #2a273f
set $overlay #393552
set $muted #6e6a86
set $subtle #908caa
set $text #e0def4
set $love #eb6f92
set $gold #f6c177
set $rose #ea9a97
set $pine #3e8fb0
set $foam #9ccfd8
set $iris #c4a7e7
set $leaf #95b1ac
set $highlight_low #2a283e
set $highlight_med #44415a
set $highlight_high #56526e
set $none NONE


# class                 border  bground text    indicator child_border
client.focused          $overlay  $surface  $text $overlay $overlay
client.focused_inactive $surface  $_nc  $text  $overlay $surface
client.unfocused        $surface  $_nc  $text  $overlay $surface
client.urgent           $rose    $love $surface  $rose  $rose
client.placeholder      $surface  $_nc  $text  $overlay $surface
client.background       $base

for_window [all] title_format " %title [%class]"

set $wallpaper_path /home/phatt/Pictures/Wallpapers/lackluster.png
exec_always feh [--no-startup-id] --no-fehbg --bg-max $wallpaper_path

bar {
    position bottom
    status_command i3status -c ~/.config/i3/modules/i3status.conf

    colors {
        background $_nc
        statusline $text
        separator  $highlight_med

        #selector          #border #bg     #text
        focused_workspace  $highlight_high  $highlight_med  $text
        active_workspace   $highlight_high  $surface  $highlight_high
        inactive_workspace $highlight_med  $base  $highlight_high
        urgent_workspace   $rose    $love $surface
        binding_mode       $highlight_high  $highlight_med  $text
    }
}
