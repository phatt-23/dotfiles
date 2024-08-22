
~/.config/bumblebee-status/bumblebee-status\
    -m\
            weather\
            cpu\
            memory\
            disk\
            pasink\
            brightness\
            uptime\
            battery\
            datetimetz\
            spotify\
    -p\
        cpu.format="{:2.1f}%"\
        datetimetz.timezone="Europe/Prague"\
        datetimetz.locale="cs_CZ.utf8"\
        datetimetz.format="%a %d.%m.%y %H:%M"\
        spotify.format="{artist} - {title}"\
        spotify.layout="spotify.song"\
        spotify.concise_controls=true\
        disk.format="{used}"\
        memory.format="{used}/{total}"\
        cpu2.layout="cpu2.cpuload"\
        sensors.match="temp1_input"\
        sensord2.field_exclude="temp2"\
    -t my-theme
