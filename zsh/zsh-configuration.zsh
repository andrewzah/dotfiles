
# ZSH
export UPDATE_ZSH_DAYS=1

# HISTORY
export HISTFILESIZE=10000000000
export HISTSIZE=10000000000
export SAVEHIST=10000000
export HISTFILE=~/sync/general/personal/.shell_history.debian-desktop

# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
# (this has been annoying several times)
#setopt AUTO_CD

# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY

# Add comamnds as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY

# Do not write events to history that are duplicates of previous events
# setopt HIST_IGNORE_DUPS

# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# Remove extra blanks from each command line being added to history
setopt HIST_REDUCE_BLANKS

# Include more information about when the command was executed, etc
setopt EXTENDED_HISTORY

# remove command line from history list when first character on the line is a space
setopt hist_ignore_space

# ===== Completion 

# Allow completion from within a word/phrase
setopt COMPLETE_IN_WORD 

# When completing from the middle of a word, move the cursor to the end of the word
setopt ALWAYS_TO_END            

unsetopt CORRECT

# ===== Prompt

# Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt PROMPT_SUBST

unsetopt MENU_COMPLETE
setopt AUTO_MENU
