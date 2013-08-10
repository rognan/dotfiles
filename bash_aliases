# If user is not root, then pass the following commands via sudo
if [ $(id -u) -ne 0 ]; then
    alias halt='sudo halt'
    alias reboot='sudo reboot'
    alias shutdown='sudo shutdown'
fi

# $PATH, only readable
alias path='echo -e ${PATH//:/\\n}'

# VI(M) <3
alias vi='vim'

# Stop pinging at some point
alias ping='ping -c 5'

# Get header from web server
alias header='curl -I'

# Check if the web server supports compression
alias headerc='curl -I --compress'

# Continue getting a partially-downloaded file.
alias wget='wget -c'

# Get rid of that 'command not found' message i keep getting.
alias cd..='cd ..'

# Get outta here
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'

# Show me files matching $1
alias lsg='ls -alGh | grep'

# Make parents, and be verbose
alias mkdir='mkdir -pv'

# Colorize the grep command output (good for reading log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# I always forget how to do this.
alias killvpn='sudo killall -9 racoon'

# Yes, I'm lazy
alias mci='mvn clean install'
alias mwd='mvn weblogic:deploy'
alias cuke='cucumber features'
alias h='history'
alias j='jobs -l'
alias l='ls -GF'
alias ls='ls -GF'
alias ll='ls -alGh'
alias pu='pushd .'
alias po='popd'

# Git
alias g='git'
alias gs='g s'

# Resume wget by default
alias wget='wget -c'

# Rake
alias be='rake exec'
