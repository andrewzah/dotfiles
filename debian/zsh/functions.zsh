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

# use sudo correctly
# Enforce safe file editing Practice
function sudo() {
  if [[ $1 == "$EDITOR" ]]; then
    wall "dummy! do sudoedit $2 instead."
  else
    command /usr/bin/sudo "$@"
  fi
}

init-s6-image() {
  image_name=${1?Please specify image name}
  mkdir "$image_name"
  cd "$image_name"

  touch Dockerfile
  touch docker-compose.yml
  touch justfile
  echo "*\n\n!/root/" > .dockerignore

  image_dir="./root/etc/services.d/$image_name"
  mkdir -p "$image_dir"

  mkdir -p "./root/etc/cont-init.d"
  echo "#!/usr/bin/with-contenv bash\nset -ex\n\n" > "./root/etc/cont-init.d/11-setup-$image_name"

  echo "#!/usr/bin/with-contenv bash\nset -euxo pipefail\n\nexec s6-setuidgid ahq" > "${image_dir}/run"
  echo "#!/bin/sh\n\nexit 0" > "${image_dir}/finish"
}
