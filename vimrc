" ~/.vimrc
"
" VIM configuration
" ===================================================================== 
" .vimrc for use on all my different accounts.
"
" Dependencies
" ===================================================================== 
" Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
silent! call pathogen#infect()
silent! call pathogen#helptags()
filetype plugin indent on
set nocompatible

augroup vimrc_reload
    autocmd!
    " When your .vimrc file is sourced twice, the autocommands will
    " appear twice. autocmd! removes all autocommands for the current
    " group.

    if has("gui_running")
        " Reload .vimrc and .gvimrc on save
        autocmd BufWritePost .*imrc,*.vim so $MYVIMRC | so $MYGVIMRC
    else
        autocmd BufWritePost .vimrc,*.vim so $MYVIMRC
    endif
augroup end

let mapleader=","
set number
set tags=./tags,tags/;/
" Tags from directory of current file, then current working directory
" and then from '/'

set lazyredraw
" Don't redraw while executing macros (better performance).

set scrolloff=2
" Always display at least 2 lines above/below the cursor.

set showmatch
" Show matching brackets when cursor is over them.

" Don't highlight lines longer than 800 characters.
set synmaxcol=800

set mat=2
" The tenths of a second to blink when matching brackets.

set numberwidth=1
" Line numbers in single column.

set wildmode=full
" Cycle between choices on <Tab>.

silent! colorscheme murphy
" Don't know if this colorscheme exists everywhere.

set title
" Display title in console title bar.

syntax on
" Syntax highlighting.

set wildmenu
" Menu completion on <Tab> in command mode.

""" Quiet
set noerrorbells
" No bells or whistles.

set vb t_vb=
" No visual bell either.

""" Files to ignore while completing

set wildignore+=*.o,*.obj,*.exe,*.dll       " Executables and resources.
set wildignore+=*.class	                    " Java.
set wildignore+=*.pyc,*.pyo,*.egg           " Python.
set wildignore+=*.git,*.svn                 " Version control.
set wildignore+=*.aux,*.out,*.toc           " LaTeX intermediate.
set wildignore+=*.jpg,*.png,*.gif,*.jpeg    " Binary images.
set wildignore+=*.sw?                       " VIM swaps.
set wildignore+=*.DS_Store                  " Bullshit.

""" Read/Write
set listchars=trail:~,tab:▸\ ,eol:¬,extends:❯,precedes:❮
" This is what you specify after having an obscure whitespace bug in
" a config file. This will allow you to see characters like tabs, EOL,
" etc.

set list
" Display the unprintable characters listed in listchars

set noautowrite
" Don't write buffer unless requested.

set noautowriteall
" Make VIM listen.

set autoread
" Automatically read in changes when a file changes on the filesystem.

set ffs=unix,dos,mac
" Use unix as the standard file type.

set encoding=utf8
set fileencoding=utf8
" Use utf8 as standard encoding.

""" Search
set ignorecase
" Case insensitive search.

set smartcase
" Unless an upper case is used.

set smarttab
" Intelligent tab usage.

set grepprg=ack
" Replace grep with ack.

set incsearch
" Incremental search while typing.

set hlsearch
" Highlight search hits.

""" Look and feel

set nostartofline
" Try to preserve column when moving up and down.

set nowrap
" Don't wrap text.

set cindent
" Automatically indent braces.

set expandtab
" Get spaces instead of tabs when hitting tab in insert mode.
" This is especially useful when you are programming python.

set shiftwidth=4
" How many columns text is indented when hitting << or >>
" Indents four spaces on braces instead of VIM's default eight.

set softtabstop=4
" How many columns a tab is in insert mode.

set shiftround
" Rounds indents to a multiple of shiftwidth.

set cursorline
" Line indicating cursor location.

set colorcolumn=72
" Ruler on the right that is appropriate for git messages.
" This results in prettier git log messages and a better formatted
" e-mail when performing a git format-patch --stdout.

set ruler
" Indicate cursor position at all times.

set linebreak
" Don't wrap text in the middle of a word.

""" Messages, info and status

set report=0
" Print changed line count.

set ls=2
" Show status line.

set laststatus=2
" Show status line, even if only one window.

set confirm
" Prompt if closing with unsaved changes.

set ttyfast
set history=1000

set showcmd
" Display incomplete normal mode commands while typing.
" If you add set showcmd you will see your <leader> key appear in the
" bottom right hand corner of vim, and you will see it disappear when
" timeoutlen happens (time out is 1000 ms by default).

" Delete trailing white space on save,
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
