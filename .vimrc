set number " Line numbers
set mouse=a " Mouse support
set laststatus=2 " Enable airline
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4
set clipboard=unnamedplus   " Set system clipboard as vim clipboard
set backspace=indent,eol,start

" Theme
colorscheme tropikos
syntax on

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs' " Brackets autocomplete
Plugin 'Syntastic' " Syntax checker
Plugin 'Rip-Rip/clang_complete' " C/C++ autocomplete
Plugin 'L9'
Plugin 'bling/vim-airline' " Status bar
Plugin 'vim-airline/vim-airline-themes'


call vundle#end()
filetype plugin indent on

" Syntastic
let g:syntastic_error_symbol='!'
let g:syntastic_style_error_symbol='!'
let g:syntastic_python_checkers=['flake8']    " pip install flake8
let g:syntastic_check_on_open=1 " Check the file when open(Not only on save)
let g:syntastic_python_python_exec='/usr/bin/python3.5'

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='term'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1 " Syntastic integration

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Clang_complete
let g:clang_exec = '/usr/bin/clang'
let g:clang_user_options = '|| exit 0'
let g:clang_close_preview = 1

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
