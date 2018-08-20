#!/usr/bin/env bash

###
### ZSH 
###

export UPDATE_ZSH_DAYS=1

# Set vi mode timeout to 0.1
export KEYTIMEOUT=1

###
### Custom
###

export TERM=xterm-kitty

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Lang and Locale
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

###
### Apps
###

# Vim FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
