# This is based on theunraveler and spaceship themes

# Variables
# =========

  ZSH_THEME_GIT_PROMPT_PREFIX=""
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""
  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%} a"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%} m"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%} x"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[blue]%} r"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[magenta]%} u"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%} n"

# Helper Functions
# ================
  _prompt_section() {
    local color prefix content suffix
    [[ -n $1 ]] && color="%F{$1}"  || color="%f"
    [[ -n $2 ]] && prefix="$2"     || prefix=""
    [[ -n $3 ]] && content="$3"    || content=""
    [[ -n $4 ]] && suffix="$4"     || suffix=""

    [[ -z $3 && -z $4 ]] && content=$2 prefix=''

    echo -n "%{%B%}" # set bold
    if [[ $PROMPT_PREFIXES_SHOW == true ]]; then
      echo -n "$prefix"
    fi
    echo -n "%{%b%}" # unset bold

    echo -n "%{%B$color%}" # set color
    echo -n "$content"     # section content
    echo -n "%{%b%f%}"     # unset color

    echo -n "%{%B%}" # reset bold, if it was diabled before
    if [[ $PROMPT_SUFFIXES_SHOW == true ]]; then
      echo -n "$suffix"
    fi
    echo -n "%{%b%}" # unset bold
}
  _exists() {
    command -v $1 > /dev/null 2>&1
  }

  _convertsecs() {
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

# ZSH Hooks
# =========

# TIME
# track elapsed time
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

# Prompt Functions
# ================

  function insert-mode () { echo "%{$fg_bold[yellow]%}[INSERT]%{$reset_color%}" }
  function normal-mode () { echo "%{$fg_bold[magenta]%}[NORMAL]%{$reset_color%}" }

  function user_host_status () { echo "%{$fg[magenta]%}%n%{$fg[cyan]%}@%{$fg[yellow]%}%m%{$fg_bold[red]%}:%{$reset_color%}" }

  # Set color of lambda based on exit code
  function exit_code_status() {
    if [[ "$?" != "0" ]]; then
      echo -e "%{$fg_bold[red]%}"
    else
      echo -e "%{$fg_bold[green]%}"
    fi
  }

  function dir_status() {
    echo "%{$fg_bold[cyan]%}%2~%{$reset_color%}"
  }

  # Wrap up in set_prompt so it can be 
  # refreshed by time functions, etc
  function set_prompt() {
    case ${KEYMAP} in
      (vicmd)       VI_MODE="$(normal-mode)" ;;
      (main|viins)  VI_MODE="$(insert-mode)" ;;
      (*)           VI_MODE="$(insert-mode)" ;;
    esac

    PROMPT=' $(exit_code_status)λ ($(_convertsecs $(get_time))) $(dir_status) $(exit_code_status)\$ %{$reset_color%}'

    if [[ -n $(git_prompt_info) ]]; then
      RPROMPT='%{$fg[green]%}{$(git_prompt_info)}%{$reset_color%}$(git_prompt_status)%{$reset_color%}'
    else
      RPROMPT=''
    fi
  }

  function zle-line-init zle-keymap-select {
    set_prompt
    zle reset-prompt
  }

  zle -N zle-line-init
  zle -N zle-keymap-select
