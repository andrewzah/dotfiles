# shorthands
function run_msql() {
  docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=DereApittyI99I' \
    -p 1433:1433 --name sql1 \
    -d mcr.microsoft.com/mssql/server:2017-latest
}

# SOURCES
# https://github.com/mathiasbynens/dotfiles/blob/master/.functions
#
function mkd() {
  mkdir -p "$@";
}

# mkdir -p && cd shorthand
function mkdc() {
  mkdir -p "$@" && cd "$_";
}
# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}

# `v` with no arguments opens the current directory in Vim, otherwise opens the
# given location
function v() {
  if [ $# -eq 0 ]; then
    nvim;
  else
    nvim "$@";
  fi;
}

function m() {
  if [ $# -eq 0 ]; then
    make;
  else
    make "$@";
  fi;
}

function t() {
  if [ $# -eq 0 ]; then
    task;
  else
    task "$@";
  fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@"
}

function push {
    curl -s -F "token=ahhx2yd48aomnybcx7oh2ftdtgqvra" \
    -F "user=u4y22rmhanqrcgetmiufkei4xegcdt" \
    -F "title=TEST" \
    -F "message=$1" https://api.pushover.net/1/messages.json
}

