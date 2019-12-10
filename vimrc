set background=dark
set t_Co=256

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'gkapfham/vim-vitamin-onec'

" Language support
Plug 'zah/nim.vim'
Plug 'vim-perl/vim-perl'
Plug 'vim-scripts/rgbasm.vim'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

set number

colorscheme vitaminonec
