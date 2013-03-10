# My dots

Feel free to comment, use and share.

## A note about my setup

I manage my dotfiles in a separate directory ```~/src/dotfiles```, and
everything is *soft linked* to their proper location like this:

```sh
    ln -s ~/src/dotfiles/vim ~/.vim
    ln -s ~/src/dotfiles/vim/vimrc ~/.vimrc
    ln -s ~/src/dotfiles/bash/bashrc ~/.bashrc
    ln -s ~/src/dotfiles/bash/bash_aliases ~/.bash_aliases
    ...
```

## Other dots

Some of my sources:
* [Tim Pope](https://github.com/tpope/vim-pathogen)
* [Mir Nazim](http://mirnazim.org/writings/vim-plugins-i-use/)
* [Zach Holman](https://github.com/holman)
* [Yan Pritzker](https://github.com/skwp)
* [GitHub ignores](https://github.com/github/gitignore), and of course [GitHub dots](http://dotfiles.github.com/)
* [Gary Bernhardt & Corey Haines](https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn)
