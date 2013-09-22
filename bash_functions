# Reverse lookup of ip address.
function rlookup() {
    if [[ -z $1 ]]; then echo 'Usage: rlookup <ip address>'; return 1; fi

    dig -x $1 +short
}

# Create and enter directory.
function md() {
    mkdir -p "$@" && cd "$@"
}

# Step into the folder currently in the forefront of Finder.
# Currently available only for OS X.
cdf() {  # short for cdfinder
    case $(uname -s) in
        Darwin) cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`";;
        *) echo 'Currently not available on this system.';;
    esac
}

# Extract compressed archives.
extract() {
    if [[ -f "$1" ]]; then
    case "$1" in
        *.lrz) lrztar -d "$1" && cd $(basename "$1" .lrz) ;;
        *.tar.bz2) tar xjf "$1" && cd $(basename "$1" .tar.bz2) ;;
        *.tar.gz)   tar xzf "$1" && cd $(basename "$1" .tar.gz) ;;
        *.tar.xz)   tar Jxf "$1" && cd $(basename "$1" .tar.xz) ;;
        *.bz2) bunzip2 "$1" && cd $(basename "$1" .bz2) ;;
        *.rar) rar x "$1" && cd $(basename "$1" .rar) ;;
        *.gz)   gunzip "$1" && cd $(basename "$1" .gz) ;;
        *.tar) tar xf "$1" && cd $(basename "$1" .tar) ;;
        *.tbz2) tar xjf "$1" && cd $(basename "$1" .tbz2) ;;
        *.tgz) tar xzf "$1" && cd $(basename "$1" .tgz) ;;
        *.zip) unzip "$1" && cd $(basename "$1" .zip) ;;
        *.jar) unzip "$1" && cd $(basename "$1" .zip) ;;
        *.Z) uncompress "$1" && cd $(basename "$1" .Z) ;;
        *.7z) 7z x "$1" && cd $(basename "$1" .7z) ;;
        *) echo "don't know how to extract '$1'..." ;;
        esac 
    else
        echo "'$1' is not a valid file!"
    fi
}
