if status is-interactive
    function fish_greeting
    end
end

alias ls eza
alias rm trash

# replaces `cd` with `z`
# zoxide init --cmd cd fish | source
zoxide init fish | source

abbr -a la eza -la
abbr -a ll eza -l

abbr -a em emacs -l ~/.emacs.d/init.el

abbr -a down cd ~/Downloads
abbr -a prog cd ~/Programming
abbr -a docs cd ~/Documents
abbr -a temp cd ~/Templates
abbr -a pics cd ~/Pictures
abbr -a sch cd ~/School
# abbr -a sem2 cd ~/School/2_semester
# abbr -a sem3 cd ~/School/3_semester
abbr -a sem cd ~/School/sem4

set -gx EDITOR nvim 
set -gx VISUAL nvim 
set -Ux LD_LIBRARY_PATH /bin/emacs
set -gx CAPACITOR_ANDROID_STUDIO_PATH /home/phatt/.local/share/JetBrains/Toolbox/apps/android-studio/bin/studio.sh

fish_add_path ~/.local/bin
fish_add_path /opt/mssql-tools18/bin
fish_add_path /home/phatt/.spicetify
fish_add_path ~/.dotnet/tools

# fish_config theme choose "Rosé Pine Moon"
# theme_gruvbox dark medium


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/phatt/.ghcup/bin $PATH # ghcup-env

# pnpm
set -gx PNPM_HOME "/home/phatt/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

