"
" Using the 'gvim' package to enable the clipboard feature.
"
" Requires:
"           - The_silver_searcher package
"           - vim Fuzzy Finder

set encoding=utf-8
set number " Line numbers
set relativenumber
set mouse=a " Mouse support
set laststatus=2 " Enable airline
set clipboard=unnamed   " Set system clipboard as vim clipboard
set backspace=indent,eol,start
set linebreak               " Break long lines by word, not char"

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2 " Width of a hard tab(for visualization)

" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Remove the Ex mode, when press 'Q'
nnoremap Q <nop>e
nmap q: <silent>
nmap K  <silent>

" =============== Map commands =====================
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Vertical split
noremap <C-v> :vsp<CR>

" Scrollof (to keep cursor in the middle of the screen)
set so=20

" Change leader to a comma. That means all \x commands turn into ,x
let mapleader=","

" If Fuzzy Finder is installed using git
set rtp+=~/.fzf

" ================ Plugins ==============
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bling/vim-airline' " Status bar
Plug 'jiangmiao/auto-pairs' " Brackets autocomplete
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'

" Ruby Bundles
Plug 'thoughtbot/vim-rspec', { 'for': ['ruby', 'rb'] } " Run RSpecs from vim
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'rb'] } " Auto add end on class, module, def, etc.

call plug#end()

filetype plugin indent on

" Theme
colorscheme codedark
syntax on

" Open Nerd Tree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='codedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1 " Syntastic integration

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

" FZF configuration
nmap <C-i> :Ag! "\b<cword>\b" <CR>
nmap <C-p> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'down': '~30%' }

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>s :call RunNearestSpec()<CR>
