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
		nvim .;
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

# SOURCES
# https://github.com/mathiasbynens/dotfiles/blob/master/.functions

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@"
}

