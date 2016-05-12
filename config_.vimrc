set number " Line numbers
set mouse=a " Mouse support
set laststatus=2 " Enable airline
set expandtab
set tabstop=4
set softtabstop=4
set autoindent

syntax on

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'bling/vim-airline' " Status bar
Plugin 'Syntastic' " Syntax checker
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'davidhalter/jedi-vim' " Autocomplete library
call vundle#end()
filetype plugin indent on

colorscheme tropikos

autocmd FileType python setlocal completeopt-=preview " Disable the jedi autocomplete popup
let g:airline#extensions#tabline#enabled = 1
