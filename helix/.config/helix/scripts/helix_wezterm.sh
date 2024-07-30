#!/bin/sh

set -x

split_pane_down() {
    bottom_pane_id=$(wezterm cli get-pane-direction down)
    if [ -z "${bottom_pane_id}" ]; then
        bottom_pane_id=$(wezterm cli split-pane)
        wezterm cli adjust-pane-size down --pane-id $bottom_pane_id --amount "$1"
    fi
    wezterm cli activate-pane-direction --pane-id $bottom_pane_id down
    send_to_bottom_pane="wezterm cli send-text --pane-id $bottom_pane_id --no-paste"
    program=$(wezterm cli list | awk -v pane_id="$bottom_pane_id" '$3==pane_id { print $6 }')
    if [ "$program" = "lazygit" ]; then
        echo "q" | $send_to_bottom_pane
    fi
}

pattern="(?:NORMAL|NOR|INSERT|INS|SELECT|SEL)\s+[\x{2800}-\x{28FF}]*\s+(\S*)\s[^│]*.*"
status_line=$(wezterm cli get-text | rg -e "$pattern" -o --replace '$1 $2')

filename=$(echo $status_line | awk '{ print $1}')
line_number=$(echo $status_line | awk '{ print $2}')

pwd=$PWD
basedir=$(dirname "$filename")
basename=$(basename "$filename")
basename_without_extension="${basename%.*}"
extension="${filename##*.}"

case "$1" in
    "build")
        split_pane_down 5
        command="printf '[BUILD] File extension \'$extension\' for building not suppoted!\n[BUILD] Note: Please address this issue in the configuration file.\n'; return 1;"
        case "$extension" in
            "rs")
                command="cd $pwd/$(echo $filename | sed 's|src/.*$||'); cargo build; return \$status;"
            ;;
            "c")
                command="cd $pwd/$(echo $filename | sed 's|src/.*$||'); make build; return \$status;"
            ;;
            "cpp")
                command="cd $pwd/$(echo $filename | sed 's|src/.*$||'); make build; return \$status;"
            ;;
            "h")
                command="cd $pwd/$(echo $filename | sed 's|src/.*$||'); make build; return \$status;"
            ;;
            "asm")
                command="cd $pwd/$(echo $filename | sed 's|src/.*$||'); make asm; return \$status;"
            ;;
        esac
        echo "$command" | $send_to_bottom_pane
    ;;
    "run")
        split_pane_down 5
        command="printf '[RUN] File extension \'$extension\' for running not suppoted!\n[RUN] Note: Please address this issue in the configuration file.\n'; return 1;"
        case "$extension" in
            "rs")
                command="cd $pwd/$(echo $filename | sed 's|src/.*$||'); cargo run; return \$status;"
            ;;
            "c")
                command="cd $pwd/$(echo $filename | sed 's|src/.*$||'); make run; return \$status;"
            ;;
            "cpp")
                command="cd $pwd/$(echo $filename | sed 's|src/.*$||'); make run; return \$status;"
            ;;
            "h")
                command="cd $pwd/$(echo $filename | sed 's|src/.*$||'); make run; return \$status;"
            ;;
            "asm")
                command="cd $pwd/$(echo $filename | sed 's|src/.*$||'); make asmr; return \$status;"
            ;;
        esac
        echo "$command" | $send_to_bottom_pane
    ;;
    "explorer")
        left_pane_id=$(wezterm cli get-pane-direction left)
        if [ -z "${left_pane_id}" ]; then
            left_pane_id=$(wezterm cli split-pane --left --percent 20)
        fi
        left_program=$(wezterm cli list | awk -v pane_id="$left_pane_id" '$3==pane_id { print $6 }')
        if [ "$left_program" != "br" ]; then
            echo "broot" | wezterm cli send-text --pane-id $left_pane_id --no-paste
        fi
        wezterm cli activate-pane-direction left
    ;;
    "fzf")
        split_pane_down
        echo "cd $pwd; helix_fzf.sh \$(rg --line-number --column --no-heading --smart-case . | fzf --delimiter : --preview 'bat --style=full --color=always --highlight-line {2} {1}' --preview-window '~3,+{2}+3/2' | awk '{ print \$1 }' | cut -d: -f1,2,3)" | $send_to_bottom_pane
    ;;
    "lazygit")
        split_pane_down
        program=$(wezterm cli list | awk -v pane_id="$pane_id" '$3==pane_id { print $6 }')
        if [ "$program" = "lazygit" ]; then
            wezterm cli activate-pane-direction down
        else
            echo "cd $pwd; lazygit" | $send_to_bottom_pane
        fi
    ;;
    "open")
        gh browse $filename:$line_number
    ;;
esac
