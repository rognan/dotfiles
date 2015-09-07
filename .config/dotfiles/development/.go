if $( type go >/dev/null 2>&1 ); then
  if [ -d "$HOME/go/work" ]; then
    export GOPATH=$HOME/go/work
    export PATH=$PATH:$GOPATH/bin
  fi
fi
