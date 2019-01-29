"
" Using the 'gvim' package to enable the clipboard feature.
"
" Requires:
"           - The_silver_searcher package
"           - vim Fuzzy Finder
"           - Flake8

set encoding=utf-8
set number                      " Line numbers
set relativenumber              " Lines relative to the actual line
set mouse=a                     " Mouse support
set laststatus=2                " Enable airline
set backspace=indent,eol,start
set linebreak                   " Break long lines by word
set cursorline                  " Shows the actual cursor line
" set paste                       " Avoids vim become crazy with paste indent

" ###############  Turn Off Swap Files ###############
set noswapfile
set nobackup
set nowb

" ############## Indentation ###############
set smarttab
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2 " Width of a hard tab(for visualization)

" ############### Search ###############
set incsearch       " Find the next match as we type the search
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set hlsearch        " Highlight searches by default

set wildignore+=*.pyc
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

filetype plugin on

" ############### Map commands ###############
" Remove the Ex mode, when press 'Q'
nnoremap Q <nop>e
nmap q: <silent>
nmap K  <silent>

" Remove suspend
nnoremap <C-Z> <nop>

" Removes the recording qhen press 'q<letter>'
" nmap q <Nop>

" Map buffer-next and buffer-previous
nmap bp :bp<CR>
nmap bn :bn<CR>
nmap bd :bd<CR>

" Because everybody makes this mistakes
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
:command! Tabe tabe

" Scrollof (to keep cursor in the middle of the screen)
set so=6

" Toggle paste mode
" set pastetoggle=<C-M>

" Reduce Ctrl+D and Ctrl+U step
noremap <C-U> 12<C-U>
noremap <C-D> 12<C-D>

" Remove trailing whitespace
map wr :%s/\s\+$//e<enter> :w<enter>

" Change leader to a comma. That means all \x commands turn into ,x
let mapleader=","

" Open and reload the .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>

" ############### Plugins ###############
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bling/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'jiangmiao/auto-pairs' " Brackets autocomplete
Plug 'alvan/vim-closetag' " HTML tags completion
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf.vim'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'christoomey/vim-system-copy'
Plug 'suan/vim-instant-markdown'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'wakatime/vim-wakatime'
Plug 'elixir-editors/vim-elixir'

call plug#end()

" ############### Theme ###############
colorscheme codedark
syntax on
let g:airline_theme='codedark'

" Search highlight
hi Search cterm=NONE
hi Search ctermfg=LightGrey
hi Search ctermbg=DarkYellow

" ############### Plugins Settings ###############
" Open Nerd Tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1

" FZF and AG configuration
"
" If Fuzzy Finder is installed using git
set rtp+=~/.fzf
let g:fzf_layout = { 'down': '~50%' }

" Search the selected word
nmap <C-i> :Ag! "\b<cword>\b" <CR>
" Search a given word
nmap <C-b> :Ag! -Q<SPACE>
" Search by filename
nmap <C-p> :Files<CR>

" Ale
let g:ale_lint_on_text_changed = 'never'
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'python': ['flake8'],
\   'elixir': ['credo']
\}

" Jedi autocompletion
autocmd FileType python setlocal completeopt-=preview

" Vim-move
let g:move_key_modifier = 'C'

" Vim-jsx
let g:jsx_ext_required = 0

" Vim-system-copy
nmap <leader>j <Plug>SystemCopy
nmap <leader>p <Plug>SystemPaste

" Indent guides
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8
