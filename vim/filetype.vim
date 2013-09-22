if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au BufNewFile,BufRead *.gradle setf groovy
augroup END
