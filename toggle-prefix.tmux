#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BINDINGS_DIR="$CURRENT_DIR/bindings"
SCRIPTS_DIR="$CURRENT_DIR/scripts"

source "$SCRIPTS_DIR/tmux_options.sh"
source "$SCRIPTS_DIR/variables.sh"
source "$SCRIPTS_DIR/display_icon.sh"
set_bindings() {    
    local key="$(get_tmux_option "$key_option" "$default_key")"
    tmux bind-key -T root "$key" run-shell "$BINDINGS_DIR/prefix_off"
    tmux bind-key -T off "$key" run-shell "$BINDINGS_DIR/prefix_on" 
}

main (){
    set_bindings
    display_icon
}
main
