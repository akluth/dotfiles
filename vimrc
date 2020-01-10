set background=dark
set t_Co=256

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'gkapfham/vim-vitamin-onec'

" Language support
Plug 'StanAngeloff/php.vim'
Plug 'zah/nim.vim'
Plug 'vim-perl/vim-perl'
Plug 'vim-scripts/rgbasm.vim'

" Syntax checking
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'

" Development tools integration
Plug 'tpope/vim-fugitive'

" Additional fancy-schmancy stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

let g:airline#extensions#tabline#enabled = 1

let python_highlight_all=1
syntax on

set encoding=utf-8
set number

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cursorline

" Easier tab navigation
map <F1> 1gt
map <F2> 2gt
map <F3> 3gt
map <F4> 4gt
map <F5> 5gt
map <F6> 6gt
map <F7> 7gt
map <F8> 8gt
map <F9> 9gt
map <F0> 10g
imap <F1> 1gt
imap <F2> 2gt
imap <F3> 3gt
imap <F4> 4gt
imap <F5> 5gt
imap <F6> 6gt
imap <F7> 7gt
imap <F8> 8gt
imap <F9> 9gt
imap <F0> 10gt

colorscheme vitaminonec
