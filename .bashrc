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

# Auto-correct typos in path names when using `cd`
shopt -s cdspell

# enable shims and auto-completion
if $(which rbenv >/dev/null); then
    eval "$(rbenv init -)";
fi

case $(uname -s) in
    Darwin)
        # :'(
        if $( which brew >/dev/null ); then
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
