[ -z ${PS1+x} ] && return # return early if not running interactively

# core env-vars
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
# lets you hit Ctrl+X, Ctrl+E in the shell to write a particularly complex command, or when you hit 'fc' (fix command)
# to open the previous command in your editor.
export EDITOR="/usr/bin/vim"
export MANPAGER="less -X" # don't clear screen after quitting a man-page
export GPG_TTY=$(tty)

# shell options
shopt -s nocaseglob # case-insensitive globbing (used in pathname expansion)
shopt -s extglob    # enable extended globs; e.g. `for d in /var/lib/data/!(lost+found|tmp); do rsync -avhW --no-compress "$d" /var/backup/; done`
shopt -s histappend # append to history, rather than overwriting it
shopt -s cdspell    # auto-correct typos in path names when using `cd`

export HISTSIZE=32768 # allow 32³ entries; default is 500
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="pwd;exit:date:* --help:man *" # skip some commands from history
export HISTTIMEFORMAT='%F %T '

if (command -v brew &>/dev/null); then
  export HOMEBREW_NO_ANALYTICS=1

  if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
  fi

  if [ -f "$(brew --prefix z)/etc/profile.d/z.sh" ]; then
    source "$(brew --prefix z)/etc/profile.d/z.sh"
  fi
fi

if (command -v asdf &>/dev/null); then
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
  source <(asdf completion bash)
fi

if command -v direnv &> /dev/null; then
  eval "$(direnv hook bash)"
fi

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

source $HOME/.bash_prompt
source $HOME/.functions
source $HOME/.aliases
source $HOME/.extra

# Everything ends
