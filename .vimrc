set history=10000
set laststatus=2
set autoindent
set softtabstop=4
set tabstop=4
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set cmdheight=2
set nu
set paste
set showcmd
set backspace=indent,eol,start
set autoread
set shell=bash
syntax on

filetype plugin indent on

let mapleader=","

augroup vimrcEx
	autocmd!
		" Some old machines don't know what these file types are
		au BufNewFile,BufRead *.md set filetype=markdown
		au BufNewFile,BufRead *.less set filetype=less
		au BufNewFile,BufRead *.js set filetype=javascript
	autocmd BufReadPost *
	  \ if line("'\"") > 0 && line("'\"") <= line("$") |
	  \   exe "normal g`\"" |
	  \ endif

	autocmd FileType python set ai sw=4 sts=4 cc=80 et
	autocmd FileType sass,javascript,ruby,css,less,html,haml set ai sw=2 sts=2 et cc=80

augroup END

" Color


" Unbind arrow keys, they're bad.
for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap" . key . " <Nop>"
    endfor
endfor


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

function! RenameFile()
	let old_name = expand('%')
	let new_name = input('New file name: ', expand('%'))
	if new_name != '' && new_name != old_name
		exec ':saveas ' .new_name
		exec ':silent !rm ' . old_name
		redraw!
	endif
endfunction
map <leader>n :call RenameFile()<cr>
