set background=dark
set t_Co=256

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'gkapfham/vim-vitamin-onec'
Plug 'jacoborus/tender.vim'
Plug 'yuqio/vim-darkspace'
Plug 'mcmartelle/vim-monokai-bold'

" Language support
Plug 'StanAngeloff/php.vim'
Plug 'vim-perl/vim-perl'
Plug 'vim-scripts/rgbasm.vim'
Plug 'rust-lang/rust.vim'
Plug 'ocaml/vim-ocaml'

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

"colorscheme vitaminonec
let g:airline_theme='darkspace'
set background=dark
set termguicolors
colorscheme darkspace

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
