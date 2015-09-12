if $( type go >/dev/null 2>&1 ); then
  if [ -d "/usr/local/opt/go/libexec" ]; then
    # mac + homebrew
    export GOROOT=/usr/local/opt/go/libexec
    export PATH=$PATH:$GOROOT/bin
  fi

  if [ -d "$HOME/go/work" ]; then
    export GOPATH=$HOME/go/work
    export PATH=$PATH:$GOPATH/bin
  fi
fi
