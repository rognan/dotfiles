if $(type brew >/dev/null 2>&1); then
    export GROOVY_HOME="$(brew --prefix groovy)/libexec"
fi
