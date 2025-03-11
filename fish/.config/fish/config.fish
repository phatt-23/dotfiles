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
        	#echo (set_color yellow; date +%T; set_color normal)
        	#set_color blue; fortune -a; set_color normal
    	end

	# pure prompt configuration
	# set --universal pure_show_system_time false
	# set --universal pure_color_system_time pure_color_mute
	# set --universal pure_show_jobs true
	# set --universal pure_show_prefix_root_prompt true

    	alias ls eza
    	alias rm trash

    	abbr -a la eza -la
    	abbr -a ll eza -l

    	abbr -a em emacs -l ~/.emacs.d/init.el

    	abbr -a down cd ~/Downloads
    	abbr -a prog cd ~/Programming
    	abbr -a docs cd ~/Documents
    	abbr -a temp cd ~/Templates
    	abbr -a pics cd ~/Pictures
    	abbr -a sch cd ~/School
    	abbr -a sem2 cd ~/School/2_semester
    	abbr -a sem3 cd ~/School/3_semester
    	abbr -a sem4 cd ~/School/sem4

    	set -gx EDITOR nvim 
    	set -gx VISUAL nvim 
    	set -Ux LD_LIBRARY_PATH /bin/emacs
	set -gx CAPACITOR_ANDROID_STUDIO_PATH /home/phatt/.local/share/JetBrains/Toolbox/apps/android-studio/bin/studio.sh

    	fish_add_path ~/.local/bin
    	fish_add_path /opt/mssql-tools18/bin
    	fish_add_path /home/phatt/.spicetify

    	# fish_config theme choose "Rosé Pine Moon"
    	# theme_gruvbox dark medium
end


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/phatt/.ghcup/bin $PATH # ghcup-env