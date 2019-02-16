#!/usr/bin/env bash

get_tmux_option() {
	local option=$1
	local default_value=$2
	local option_value=$(tmux show-option -gv "$option")
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option "$option" "$value"
}

reset_tmux_option() {
    local option="$1"
    tmux set-option -u "$option"
}

do_interpolation() {
	local string="$1"
    local value="$2"
    local interpolation_string="$3"
    local interpolated="${string/$interpolation_string/$value}"
    echo "$interpolated"
}

update_tmux_option() {
	local option="$1"
    local value="$2"
    local interpolation_string="$3"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value" "$value" "$interpolation_string")"
	set_tmux_option "$option" "$new_option_value"
}

