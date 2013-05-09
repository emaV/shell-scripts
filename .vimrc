syntax on
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
" set smartindent
set ruler

":set paste :set nopaste

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

if has("autocmd")
  " Drupal *.module files.
  augroup module
    autocmd BufRead *.inc set filetype=php
  augroup END
  augroup module
    autocmd BufRead *.module set filetype=php
  augroup END
  augroup module
    autocmd BufRead *.info set filetype=php
  augroup END
endif

" Highlight chars that go over the 80-column limit
:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
:match OverLength '\%81v.*'

" Highlight trailing spaces
"set list listchars=trail:.
"highlight SpecialKey ctermfg=DarkGray
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Highlight redundant whitespaces and tabs.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
" let php_folding = 1
