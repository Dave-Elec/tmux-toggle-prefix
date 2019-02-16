#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR="$CURRENT_DIR/../scripts"

source "$SCRIPTS_DIR/tmux_options.sh"
source "$SCRIPTS_DIR/variables.sh"

display_icon(){
    local icon
    if [ $(tmux show-option -qv key-table) = 'off' ]; then
        icon="$(get_tmux_option "$off_icon_option" "$default_off_icon")"
    else
        icon="$(get_tmux_option "$on_icon_option" "$default_on_icon")"
    fi
    update_tmux_option "status-right" "$icon" "$interpolation_string"
}

