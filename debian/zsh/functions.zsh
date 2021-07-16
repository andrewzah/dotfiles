function mkd() {
  mkdir -p "$@";
}

# mkdir -p && cd shorthand
function mkdc() {
  mkdir -p "$@" && cd "$_";
}

alert() {
  if ! which notify-send 2>&1 >/dev/null; then
    echo "notify-send not installed! aborting."
    echo "the package is 'libnotify-bin' on debian, otherwise see http://vaskovsky.net/notify-send/linux.html"
    return 1
  fi

  $@;
  notify-send "job finished with $? -> \"$(echo $@)\"";
}

# somewhere on stackoverflow i think, can't find it now
findByDate() {
    local humansize=''
    [ "$1" = "-h" ] && humansize='h' && shift
    find . ${2:-! -type d} -printf "%T@ %p\0" |
        sort -zrn |
        head -zn ${1:--0} |
        sed -z 's/^[0-9.]\+ //' |
        xargs -0 ls -dlt${humansize}
}
