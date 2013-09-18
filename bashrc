###############################################################
# ~/.bashrc
###############################################################
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# set bash editor to vim
export EDITOR=/usr/bin/vim
# Useful when hitting Ctrl+X, Ctrl+E in the shell to write a particularly
# complex command, or when you hit 'fc' (fix command) to open the previous
# command in your editor.

# Set current directory in the header of the shell
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

PATH=/usr/local/opt/ruby/bin:$PATH

# rbenv
if has rbenv; then
    eval "$(rbenv init -)";
    PATH=$HOME/.rbenv/bin:$PATH
fi

# java
export JAVA_HOME=$(/usr/libexec/java_home)
export JDK_HOME=$(/usr/libexec/java_home)

# maven 
export MAVEN_OPTS="-Xms384m -XX:MaxPermSize=256m -Xmx1024m"

# gradle
if has brew; then
    export GRADLE_OPTS="-Xmx1G"
    export GRADLE_HOME="$(brew --prefix gradle)/libexec"
fi

# add ~/bin to path
PATH=$HOME/bin:$PATH

# prompt
export PS1='\[\033[01;30m\]\t `if [ $? = 0 ]; then echo "\[\033[01;32m\]ツ"; else echo "\[\033[01;31m\]✗"; fi` \[\033[00;32m\]\h\[\033[00;37m\]:\[\033[31m\]\[\033[00;34m\]\w\[\033[00m\][\j]\$ '

# bash completion
if has brew ; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi

    if [ -f $(brew --prefix git)/etc/bash_completion.d/git-prompt.sh ]; then
        source $(brew --prefix git)/etc/bash_completion.d/git-prompt.sh
        # developer prompt
        export PS1='\[\033[01;30m\]\t `if [ $? = 0 ]; then echo "\[\033[01;32m\]ツ"; else echo "\[\033[01;31m\]ಠ_ಠ"; fi` \[\033[00;32m\]\h\[\033[00;37m\]:\[\033[31m\]$(__git_ps1 "(%s)\[\033[01m\]")\[\033[00;34m\]\w\[\033[00m\][\j]\$ '
        #export PS1='\[\033[01;30m\]\t `if [ $? = 0 ]; then echo "\[\033[01;32m\]ツ"; else echo "\[\033[01;31m\]✗"; fi` \[\033[00;32m\]\h\[\033[00;37m\]:\[\033[31m\]$(__git_ps1 "(%s)\[\033[01m\]")\[\033[00;34m\]\w\[\033[00m\][\j]\$ '
    fi
fi

# aliases and functions
if [[ -f ~/.bash_aliases ]]; then . ~/.bash_aliases; fi
if [[ -f ~/.bash_functions ]]; then . ~/.bash_functions ; fi

# non-public aliases. I put shortcuts to local git repo's here.
if [[ -f ~/.bash_aliases.private ]]; then . ~/.bash_aliases.private; fi
