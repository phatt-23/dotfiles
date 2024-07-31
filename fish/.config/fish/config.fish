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

    function fish_greeting
        # echo (set_color yellow; date +%T; set_color normal)
    end

    alias ls lsd
    abbr -a down cd ~/Downloads
    abbr -a prog cd ~/Programming
    abbr -a docs cd ~/Documents
    abbr -a temp cd ~/Templates
    abbr -a pics cd ~/Pictures
    abbr -a sch cd ~/School
    set -gx EDITOR hx
    set -gx VISUAL hx

    set -Ux LD_LIBRARY_PATH /bin/emacs

    fish_add_path ~/.local/bin
end
