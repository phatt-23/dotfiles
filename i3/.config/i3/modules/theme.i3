# i3 client look
# include palettes/nordic.i3
# include palettes/gruber.i3
# include palettes/i3_default.i3
include palettes/smaragd.i3
# include palettes/lackluster.conf
# include palettes/zenburn.i3
# include palettes/rose-pine.conf
# include palettes/onedark.i3
# include palettes/gruvbox.i3
# include ./palettes/tokyonight.i3


# i3 gaps
gaps inner 0
gaps outer 0
smart_gaps on
smart_gaps inverse_outer


# i3 borders
# hide_edge_borders smart_no_gaps
# for_window [class=".*"] border pixel 2
# for_window [floating] border full
for_window [class=".*"] border full


# Activate smart borders (always)
smart_borders on
# Activate smart borders (only when there are effectively no gaps)
smart_borders no_gaps


# window title icons
for_window [all] title_window_icon no
# for_window [all] title_window_icon padding 0px
# for_window [all] floating enable


# wallpaper
# set $wallpaper_path $HOME/Pictures/haskell.jpg
# set $wallpaper_path $HOME/Pictures/i3_wallpaper.jpg
# set $wallpaper_path $HOME/Pictures/wales.webp
# set $wallpaper_path $HOME/Pictures/black_wallpaper.jpg
# set $wallpaper_path $HOME/Pictures/od_tux.png
# set $wallpaper_path $HOME/Pictures/film_forest.jpg
# set $wallpaper_path $HOME/Pictures/serbia_forest.jpg
set $wallpaper_path $HOME/Pictures/dark_gray_wallpaper.png
exec_always feh --no-fehbg --bg-fill $wallpaper_path
# exec_always feh --no-fehbg --bg-max $wallpaper_path


# Mode for new containers
workspace_layout default


# Focus windows when the mouse hovers them
focus_follows_mouse no


# Leave fullscreen when a application creates a popup
popup_during_fullscreen leave_fullscreen


# When switching to a workspace pressing the 
# same button again gets you back to the previous one
# workspace_auto_back_and_forth yes


# polybar
# exec_always --no-startup-id /home/phatt/.config/polybar/launch.sh


# font
set $font_size 8

# set $font_family Noto Sans
# set $font_family CommitMono Nerd Font Propo
# set $font_family Courier Prime
# set $font_family Iosevka Nerd Font
# set $font_family Aporetic Sans Mono 
# set $font_family Source Code Pro
# set $font_family Terminus
# set $font_family Terminess Nerd Font
# set $font_family MesloLGL Nerd Font
# set $font_family MesloLGS Nerd Font
# set $font_family DejaVuSansM Nerd Font
# set $font_family Liga SFMono Nerd Font
# set $font_family DejaVuSansM Nerd Font
# set $font_family Iosevka Comfy Duo
# set $font_family Iosevka Term SS12
# set $font_family JetBrainsMono Nerd Font 
# set $font_family Inconsolata Nerd Font Propo
# set $font_family CodeNewRoman Nerd Font
# set $font_family M+1Code Nerd Font
# set $font_family LiterationMono Nerd Font
# set $font_family Hurmit Nerd Font
# set $font_family Hack Nerd Font
# set $font_family ComicShannsMono Nerd Font
# set $font_family ZedMono NFM Extd
# set $font_family IntoneMono Nerd Font
set $font_family GohuFont 11 Nerd Font

font pango:$font_family $font_size

