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



# Prompt Functions
# ================

  function insert-mode () { echo "%{$fg_bold[yellow]%}[INSERT]%{$reset_color%}" }
  function normal-mode () { echo "%{$fg_bold[magenta]%}[NORMAL]%{$reset_color%}" }

  function user_host_status () { echo "%{$fg[magenta]%}%n%{$fg[cyan]%}@%{$fg[yellow]%}%m%{$fg_bold[red]%}:%{$reset_color%}" }

  # Set color of lambda based on exit code


  # Wrap up in set_prompt so it can be 
  # refreshed by time functions, etc
