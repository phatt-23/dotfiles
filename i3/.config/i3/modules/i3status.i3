general {
        output_format = "i3bar"
        colors = true
        
        # is set to high number because launch.sh is doing the updating
        interval = 1000

        # ROSEPINE
        # color_good = "#95b1ac"
        # color_degraded = "#3e8fb0"
        # color_bad = "#eb6f92"

        # OneDark
        # color_good = "#60b48a"
        # color_degraded = "#c678dd"
        # color_bad = "#e86671"
        
        # LACKLUSTER
        # color_good = "#60b48a"
        # color_degraded = "#94bff3"
        # color_bad = "#dca3a3"
       
        # color_good = "#abab77" # lackluster - yellow
        # color_degraded = "#7788AA" # lackluster - blue
        # color_bad = "#D70000" # lackluster - red
   
        # DEFAULT 
        color_good = "#00FF00"
        color_degraded = "#6666FF"
        color_bad = "#FF0000"

        # TOKYO
        # color_good = "#9ece6a"
        # color_degraded = "#e0af68"
        # color_bad = "#f7768e"

}

# order += "read_file spotify"
order += "wireless wlp3s0"
order += "memory"
order += "disk /"
order += "volume master"
order += "battery 0"
order += "read_file cpu_temperature"
order += "read_file backlight"
# order += "read_file uptime"
order += "read_file keyboard"
order += "tztime prague"

wireless wlp3s0 {
        format_up = "NW (%quality at %essid, %bitrate) %ip"
        format_down = "NW down"
}

battery 0 {
        format = "Bat %percentage (%status)"
        format_down = "No battery"
        status_chr = "chr"
        status_bat = "bat"
        status_unk = "unk"
        status_full = "full"
        status_idle = "idle"
        path = "/sys/class/power_supply/BAT%d/uevent"
        low_threshold = 10
}

tztime prague {
        format = "%Y-%m-%d %H:%M:%S %Z"
        timezone = "Europe/Prague"
}

memory {
        format = "Mem %used/%available"
        decimals = 3
        threshold_degraded = "10%"
        format_degraded = "Memory: %free"
}

disk "/" {
        format = "Disk %used/%total"
        prefix_type = "binary"
}

volume master {
        format = "Vol %volume"
        format_muted = "Vol %volume (muted)"
        device = "default"
        mixer = "Master"
        mixer_idx = 0
}

read_file uptime {
        format = "%content"
        path = "~/.config/i3/modules/logs/uptime.log"
}

read_file cpu_temperature {
        format = "%content"
        format_bad = "%title - %errno: %error"
        path = "~/.config/i3/modules/logs/cpu_temperature.log"
}

read_file backlight {
        format = "%content"
        path = "~/.config/i3/modules/logs/backlight.log"
}

read_file keyboard {
        format = "%content"
        path = "~/.config/i3/modules/logs/keyboard_layout.log"
}

read_file spotify {
        format = "%content"
        path = "~/.config/i3/modules/logs/spotify.log"
}


