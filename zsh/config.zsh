# May need to manually set language environment
# Lang and Locale
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

export TERM=xterm-256color
