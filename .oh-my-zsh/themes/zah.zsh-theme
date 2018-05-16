# This is based on theunraveler and spaceship themes

# Variables
# =========

  ZSH_THEME_GIT_PROMPT_PREFIX=""
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""
  #https://www.utf8icons.com/character/67587/cypriot-syllable-o
  ZSH_THEME_GIT_PROMPT_ADDED="%{$PR_BOLD_GREEN%} 𐠃"

  #https://www.utf8icons.com/character/5819/runic-letter-haegl-h
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$PR_BOLD_YELLOW%} ᚻ"

  # https://www.utf8icons.com/character/5815/runic-letter-gebo-gyfu-g
  ZSH_THEME_GIT_PROMPT_DELETED="%{$PR_BOLD_RED%} ᚷ"

  # https://www.utf8icons.com/character/10499/rightwards-double-arrow-with-vertical-stroke
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$PR_BOLD_BLUE%} ⤃"

  # https://www.utf8icons.com/character/1986/nko-digit-two
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$PR_BOLD_MAGENTA%} ߂"

  # https://www.utf8icons.com/character/67620/cypriot-syllable-re
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$PR_BOLD_CYAN%} 𐠤"

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
    [[ $D > 0 || $H > 0 || $M > 0 ]] && printf 'and '
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

  # Set color of lambda based on exit code
  exit_code_status() {
    if [[ "$?" == "0" ]]; then
      echo -e '\e[1;32m'
    else 
      echo -e '\e[1;32m'
    fi
  }

<<<<<<< HEAD

=======
  function prompt_ruby() {
    if [[ ! -f Gemfile || ! -f Rakefile || ! -n *.rb(#qN^/) ]]; then
      return
    fi

    local ruby_version

    if _exists rbenv; then
      ruby_version=$(rbenv version-name)
    else
      return
    fi

    [[ "${ruby_version}" == "system" ]] && return

    # Add 'v' before ruby version that starts with a number
    [[ "${ruby_version}" =~ ^[0-9].+$ ]] && ruby_version="v${ruby_version}"

    _prompt_section \
      "" \
      "" \
      "Ruby ${ruby_version}" \
      ""
  }

  function prompt_crystal() {
    if [[ ! -f shard.yml || ! -n *.cr(#qN^/) ]]; then
      return
    fi

    local crystal_version

    if _exists crystal; then
      crystal_version=$(crystal -v | awk '{print $2;exit}')
    else
      return
    fi

    # Add 'v' before crystal version that starts with a number
    [[ "${crystal_version}" =~ ^[0-9].+$ ]] && crystal_version="v${crystal_version}"

    _prompt_section \
      "" \
      "" \
      "Crystal ${crystal_version}" \
      ""
  }

  set_prompt_plugins() {
    local PROMPT_PLUGINS_ORDER=(
      ruby
      crystal
    )

    # Execute all parts
    for i in $PROMPT_PLUGINS_ORDER; do
      prompt_$i
    done
  }
>>>>>>> b97f1e72a7c866ed8e41423a137c3ea08cffdc47

  # Wrap up in set_prompt so it can be 
  # refreshed by time functions, etc
  set_prompt() {
    PROMPT='%{$(exit_code_status)%}λ $(_convertsecs $(get_time)) %{${PR_BOLD_GREEN}%}[%c] ⇒ %{$reset_color%} '
<<<<<<< HEAD
    RPROMPT='$PR_BOLD_GREEN% {$(git_prompt_info)}%{$reset_color%} $(git_prompt_status)%{$reset_color%}'
=======
    RPROMPT='$(set_prompt_plugins)%{$PR_BOLD_GREEN%} {$(git_prompt_info)}%{$reset_color%} $(git_prompt_status)%{$reset_color%}'
>>>>>>> b97f1e72a7c866ed8e41423a137c3ea08cffdc47
  }
  set_prompt # init
