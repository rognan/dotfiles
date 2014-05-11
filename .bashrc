# ~/.bashrc

# Load dotfiles
# * ~/.path can be used to extend path
# * ~/.extra can be used for settings that should not be committed
for file in ~/.{path,functions,bash_prompt,exports,aliases,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

if has brew ; then
    # bash completion
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
    # git completion
    if [ -f $(brew --prefix git)/etc/bash_completion.d/git-prompt.sh ]; then
        source $(brew --prefix git)/etc/bash_completion.d/git-prompt.sh
    fi
    # z directory jumping
    if [ -f $(brew --prefix)/etc/profile.d/z.sh ]; then
        source `brew --prefix`/etc/profile.d/z.sh
    fi
fi

if has rbenv; then
    # enable shims and autocompletion
    eval "$(rbenv init -)";
fi

# gradle
if has brew; then
    export GRADLE_HOME="$(brew --prefix gradle)/libexec"
fi

# Everything ends
