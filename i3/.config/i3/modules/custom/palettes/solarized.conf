# Solarized Theme

set $bg0   #073642
set $bg1_5 #083743
set $bg1   #586e75
set $bg2   #657b83
set $bg3   #839496
set $bg4   #93a1a1

set $fg0 #eee8d5
set $fg1 #fdf6e3

set $highlight #2aa198
set $ignore #000000

# class                 border      bground     text 	indicator child_border
client.focused          $highlight  $bg1_5      $fg0 	$highlight      $highlight
client.focused_inactive $bg1        $bg0        $fg0 	$bg1      $bg1 
client.unfocused        $bg1        $bg0        $bg4 	$bg1      $bg1 
client.urgent           $bg1        $highlight  $bg1 	$bg1      $bg1 
client.placeholder      $ignore     $bg1        $fg0 	$ignore   $bg2
client.background       $bg1 

for_window [all] title_format "%title  ^%class"

set $wallpaper_path /home/phatt/Pictures/Wallpapers/everforest-walls/nature/rocky_beach_1.png
exec_always feh [--no-startup-id] --no-fehbg --bg-fill $wallpaper_path

