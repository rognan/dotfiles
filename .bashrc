# ~/.bashrc

# Source other dotfiles
# * ~/.path can be used to extend path
# * ~/.extra can be used for settings that should not be committed
for file in ~/.{path,functions,bash_prompt,developer,aliases,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

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
export HISTCONTROL=ignoredups

# timestamps for bash history. www.debian-administration.org/users/rossen/weblog/1
# saved for later analysis
HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT

# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

# The sad part :'(
case $(uname -s) in
    Linux)
        if [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
        fi

        if [ -f /etc/bash_completion.d/git-prompt ]; then
            . /etc/bash_completion.d/git-prompt
        fi

        if [ -f ~/.ext-lib/z-directory-jumper/z.sh ]; then
            . ~/.ext-lib/z-directory-jumper/z.sh
        fi
    ;;

    Darwin)
        if $( type brew >/dev/null 2>&1 ); then
            # bash completion
            if [ -f $(brew --prefix)/etc/bash_completion ]; then
                source $(brew --prefix)/etc/bash_completion
            fi
            # git completion
            if [ -f $(brew --prefix git)/etc/bash_completion.d/git-prompt.sh ]; then
                source $(brew --prefix git)/etc/bash_completion.d/git-prompt.sh
            fi
            # z directory jumping
            if [ -f $(brew --prefix)/etc/profile.d/z.sh ]; then
                source `brew --prefix`/etc/profile.d/z.sh
            fi

            export GRADLE_HOME="$(brew --prefix gradle)/libexec"
        fi
    ;;
    *) echo 'Platform unrecognized: Could not install [bash_completion, git-prompt, z directory jumping].';;
esac

# Everything ends
