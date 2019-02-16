# Tmux toggle prefix
   Plugin that dissables prefix key. Handy when you have nested remote tmux session via ssh inside a local tmux session. Instead of pressing prefix key twice, You can simply dissable the local prefix key with one key press when you are in the remote tmux session and restore the prefix key back when you are interacting with the local session.

## Usage
Just define the key you want to use to toggle prefix as follows and pressing that key will toogle the prefix onn and off.

```tmux
set -g @toggle_prefix "F12"
```

If you want to see if the prefix is dissabled on the status bar, add `#{toggle_prefix}` to the left or right status bar.
```tmux
set -g status-right '#{prefix_highlight}'
```

## Installation
### Tmux Plugin Manager
Add the plugin to your plugins list:
```tmux
set -g @plugin 'Dave-Elec/tmux-toggle-prefix'
```
Then press prefix + I to install it.

### Manual installation
Clone the repo:
```console
$ git clone https://github.com/Dave-Elec/tmux-toggle-prefix.git ~/clone/path
```

Add this line to your .tmux.conf:
```tmux
run-shell ~/clone/path/prefix_highlight.tmux
```

Reload TMUX environment with:
```console
$ tmux source-file ~/.tmux.conf
```

## License
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

