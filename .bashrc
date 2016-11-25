# Return if not running interactively
[ -z ${PS1+x} ] && return

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Enable extended globs
# I.e `for d in /var/lib/data/!(lost+found|tmp); do rsync -avhW --no-compress "$d" /var/backup/; done`
shopt -s extglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Auto-correct typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Set bash editor to vim:
# Useful when hitting Ctrl+X, Ctrl+E in the shell to write a particularly
# complex command, or when you hit 'fc' (fix command) to open the previous
# command in your editor.
export EDITOR=/usr/bin/vim

# Set current directory in the header of the shell
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

# Do not clear screen after quitting a man-page
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups:ignorespace

# timestamps for bash history
export HISTTIMEFORMAT='%F %T '

# Make some commands not show up in history
export HISTIGNORE="pwd;exit:date:* --help:man *"

case $(uname -s) in
    Linux)
      source /etc/bash_completion
      source /etc/bash_completion.d/git-prompt
      source ~/.ext-lib/z-directory-jumper/z.sh
      # Jenv is installed with homebrew on OS X,
      # on Linux the repository is cloned here:
      export PATH="$HOME/.jenv/bin:$PATH"
    ;;
    Darwin)
      export GROOVY_HOME="/usr/local/opt/groovy/libexec"
      export GRADLE_HOME="/usr/local/opt/gradle/libexec"
      export GOROOT="/usr/local/opt/go/libexec"
      export GOPATH=$HOME/go/work
      export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
      # source in background because it's slow
      (source /usr/local/etc/bash_completion &) 2>/dev/null
      source /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh
      source /usr/local/etc/profile.d/z.sh
    ;;
    *) echo -e '\e[33Unrecognized OS, some shell-features may not be available';;
esac

source $HOME/.bash_prompt
source $HOME/.functions
source $HOME/.aliases
source $HOME/.extra

export MAVEN_OPTS="-Xms384m -Xmx1024m -XX:+TieredCompilation -XX:TieredStopAtLevel=1"
export GRADLE_OPTS="-Dorg.gradle.daemon=true -Xmx1G"
export PATH="$HOME/.rbenv/bin:$PATH"

# #
# enable shims and auto-completion
#
# remember to run once:
# for plugin in {export,gradle,groovy,maven,springboot}; do
#   $(jenv enable-plugin $plugin)
# done
# unset plugin
if (command -v jenv >/dev/null 2>&1); then
  eval "$(jenv init - --no-rehash)"
  (jenv rehash &) 2>/dev/null # rehash in background
fi

if (command -v rbenv >/dev/null 2>&1); then
  eval "$(rbenv init - --no-rehash)"
  (rbenv rehash &) 2>/dev/null # rehash in background
fi

# Everything ends
