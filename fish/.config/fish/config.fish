if status is-interactive
    # Commands to run in interactive sessions can go here
    # function fish_prompt
    #     set -l last_status $status
    #     # Prompt status only if it's not 0
    #     set -l stat
    #     if test $last_status -ne 0
    #         set stat (set_color red)"[$last_status]"(set_color normal)
    #     end

    #     string join '' -- (tput bold)(set_color green) (prompt_pwd --full-length-dirs 3) (set_color green) $stat '$ '
    # end

    # pure prompt configuration
    set --universal pure_show_system_time false
    set --universal pure_color_system_time pure_color_mute
    set --universal pure_show_jobs true
    set --universal pure_show_prefix_root_prompt true

    function fish_greeting
         #echo (set_color yellow; date +%T; set_color normal)
        set_color blue; fortune -a; set_color normal
    end

    abbr -a em emacs -l ~/.emacs.d/init.el

    alias ls lsd
    alias rm trash

    abbr -a down cd ~/Downloads
    abbr -a prog cd ~/Programming
    abbr -a docs cd ~/Documents
    abbr -a temp cd ~/Templates
    abbr -a pics cd ~/Pictures
    abbr -a sch cd ~/School

    set -gx EDITOR nvim 
    set -gx VISUAL nvim 
    set -Ux LD_LIBRARY_PATH /bin/emacs

    fish_add_path ~/.local/bin
end

fish_add_path /home/phatt/.spicetify
