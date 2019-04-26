# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
#if [ -x /usr/libexec/path_helper ]; then
    #PATH=''
    #eval `/usr/libexec/path_helper -s`
#fi

export PATH=$PATH:/usr/local/kubebuilder/bin
export GOPATH=$HOME/go

# nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# python
export PATH=/usr/local/share/python:$PATH

# anaconda
#export PATH=/usr/local/anaconda3/bin:"$PATH"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# sdl2
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
