set nocompatible            " disable compatibility to old-time vi
set autowriteall
set autoread
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set mouse=a
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set encoding=utf-8
set splitbelow
set splitright
set updatetime=100
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set relativenumber
set rnu
autocmd BufReadPost,FileReadPost * normal zR

" using escape to go to normal mode in terminal mode
:tnoremap <Esc> <C-\><C-n>  

" Keep cursor on the word when using *
nnoremap * *N

" move between window simplified
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufRead,BufNewFile *.cshtml set filetype=html
au BufRead,BufNewFile *.svelte set filetype=html
au BufRead,BufNewFile *.elm set filetype=elm
au BufRead,BufNewFile *.cr set filetype=ruby
au BufRead,BufNewFile *.fish set filetype=fish
au BufNewFile,BufRead *.vert,*.tesc,*.tese,*.glsl,*.geom,*.frag,*.comp set filetype=glsl

autocmd Filetype glsl setlocal tabstop=2
autocmd Filetype css setlocal tabstop=2
autocmd Filetype js setlocal tabstop=2
autocmd Filetype html setlocal tabstop=2
autocmd Filetype elm setlocal tabstop=2
autocmd Filetype css setlocal shiftwidth=2
autocmd Filetype js setlocal shiftwidth=2
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype elm setlocal shiftwidth=2
autocmd Filetype c setlocal shiftwidth=2

set statusline+=%{FugitiveStatusline()}

set statusline+=%f 
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

lua require('config')

