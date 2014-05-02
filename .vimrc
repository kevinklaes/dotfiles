" Some old machines don't know what these file types are
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.js set filetype=js
set autoindent
set nu
set paste
set cc=80
" Set my standard expecations, maybe alter them for file type expectations
set tabstop=4| set shiftwidth=4| set expandtab
autocmd FileType python set tabstop=4|set shiftwidth=4
autocmd FileType js set tabstop=2|set shiftwidth=2
autocmd FileType ruby set tabstop=2|set shiftwidth=2
autocmd FileType haml set tabstop=2|set shiftwidth=2
autocmd FileType css set tabstop=2|set shiftwidth=2
autocmd FileType less set tabstop=2|set shiftwidth=2
autocmd FileType haml set tabstop=2|set shiftwidth=2
syntax on

" Unbind arrow keys, they're bad.
for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap" . key . " <Nop>"
    endfor
endfor
