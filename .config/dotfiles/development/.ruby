PATH=/usr/local/opt/ruby/bin:$PATH
PATH=$HOME/.rbenv/bin:$PATH
# enable ruby shims and auto-completion
if $(type rbenv >/dev/null 2>&1); then
    eval "$(rbenv init -)";
fi
