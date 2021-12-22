function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    set_prompt
    unset timer
  fi
}

get_time() {
  if [[ -n "${timer_show}" ]]; then
    echo -e "${timer_show}"
  fi
}

convertsecs() {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd ' $D
  [[ $H > 0 ]] && printf '%dh ' $H
  [[ $M > 0 ]] && printf '%dm ' $M
  [[ $D > 0 || $H > 0 || $M > 0 ]] && printf ''
  printf '%ds\n' $S
}

# -- info commands

function user_status() {
  echo "%{$fg_bold[red]%}%n%{$fg_no_bold[white]%}@%{$reset_color%}"
}

function host_status() {
  echo "%{$fg_bold[blue]%}%m:%{$reset_color%}"
}

function dir_status() {
  echo "%{$fg_bold[yellow]%}%2~%{$reset_color%}"
}

function exit_code_status() {
  if [[ "$?" != "0" ]]; then
    echo -e "%{$fg_bold[red]%}"
  else
    echo -e "%{$fg_bold[green]%}"
  fi
}

function parse_git_branch() {
  echo -e "$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/')"
}

function set_prompt() {
  #PROMPT='$(exit_code_status)λ ($(convertsecs $(get_time))) $(dir_status) $(exit_code_status)\$ %{$reset_color%}'
  PROMPT='$(user_status)$(host_status)$(dir_status) $(exit_code_status)\$ %{$reset_color%}'

  #RPROMPT='%{$fg[green]%}$(parse_git_branch)%{$reset_color%}'
}


function zle-line-init zle-keymap-select {
  set_prompt
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
