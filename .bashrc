# Return if not running interactively
[ -z ${PS1+x} ] && return

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

export PATH="/usr/local/sbin:$PATH"

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
    ;;
    Darwin)
      if [ -f /usr/local/share/bash-completion/bash_completion ]; then
          source /usr/local/share/bash-completion/bash_completion
      fi

      if type brew &>/dev/null; then
        HOMEBREW_PREFIX=$(brew --prefix)
        for completion_file in "$HOMEBREW_PREFIX"/etc/bash_completion.d/*; do
            [[ -f "${completion_file}" ]] && source "$completion_file"
        done
        if [[ -f ${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh ]];
        then
            source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
        fi
      fi

      source /usr/local/etc/profile.d/z.sh
    ;;
    *) echo -e '\e[33Unrecognized OS, some shell-features may not be available';;
esac

source $HOME/.bash_prompt
source $HOME/.functions
source $HOME/.aliases
source $HOME/.extra

export GPG_TTY=$(tty)
export PATH="$HOME/.cargo/bin:$PATH"

if (command -v brew >/dev/null 2>&1); then
  if (command -v asdf >/dev/null 2>&1); then
      source "$(brew --prefix asdf)/libexec/asdf.sh"
  fi
fi

# Everything ends
