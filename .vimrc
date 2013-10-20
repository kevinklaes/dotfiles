set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set selectmode=mouse
set nu
set paste

for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
        exe prefix . "noremap" . key . " <Nop>"
    endfor
endfor
