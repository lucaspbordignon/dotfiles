set number " Line numbers
set mouse=a " Mouse support
set laststatus=2 " Enable airline
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4

syntax on

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'bling/vim-airline' " Status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'Syntastic' " Syntax checker
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'davidhalter/jedi-vim' " Autocomplete library
call vundle#end()
filetype plugin indent on

colorscheme tropikos

autocmd FileType python setlocal completeopt-=preview " Disable the jedi autocomplete popup
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='term'
let g:airline#extensions#branch#enabled=1


" air-line
let g:airline_powerline_fonts = 1 

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
