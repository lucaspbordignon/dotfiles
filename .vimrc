"
" Using the 'gvim' package to enable the clipboard feature.
"
" Requires:
"           - The_silver_searcher package
"           - vim Fuzzy Finder
"           - Flake8

" set relativenumber              " Lines relative to the actual line
set encoding=utf-8
set number                      " Line numbers
set mouse=a                     " Mouse support
set laststatus=2                " Enable airline
set backspace=indent,eol,start
set linebreak                   " Break long lines by word
set cursorline                  " Shows the actual cursor line
set cursorcolumn                " Shows the actual cursor column

" ###############  Turn Off Swap Files ###############
set noswapfile
set nobackup
set nowb

" ############## Indentation ###############
" Using tabs
"
" set shiftwidth=4
" set tabstop=4 " Width of a hard tab(for visualization)
" set expandtab

" Using spaces
"
set smarttab
set shiftwidth=2 " Number of spaces added when tab is clicked
set softtabstop=2
set expandtab " Sets spaces when the tab is clicked
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

" Because everybody makes this mistakes
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
:command! Qa qa
:command! Tabe tabe

" Enforce Ctrl + C to act as Esc and trigger abbreviations
vnoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>

" Scrolloffset (to keep cursor in the middle of the screen)
set so=6

" Toggle paste mode
set pastetoggle=<leader>t

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

" Map buffer-next and buffer-previous
nmap <leader>bp :bp<CR>
nmap <leader>bn :bn<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bb :Buffer<CR>

" Map Orient Vertical & Horizontal
nmap <leader>ov <C-w>K
nmap <leader>oh <C-w>H

" Clear highlight
nmap <leader>c :noh<CR>

" Color Highlight
nmap <leader>ch :ColorHighlight<CR>

" Map end of the phrase to 'f'
vmap f $

" Apply macros stored at W
nmap <leader>m @w

" Add find/replace command with leader + r
nmap <leader>rr :%s/<find>/<replace>/gc

" ############### Plugins ###############
call plug#begin('~/.local/share/nvim/plugged')

" ### Navigation ###
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " Folder navigation
Plug 'editorconfig/editorconfig-vim' " Editorconfig plugin
Plug 'rking/ag.vim' " Filsystem searcher as ack
Plug 'junegunn/fzf.vim' " Fuzzy finder for text
Plug 'christoomey/vim-system-copy' " Keep vim and system clipboards

" ### Style ###
Plug 'bling/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Status bar theme
Plug 'tomasiser/vim-code-dark' " Darcula code colors
Plug 'prettier/vim-prettier' " Prettier for Javascript

" ### Auto-Complete ###
Plug 'jiangmiao/auto-pairs' " Brackets autocomplete
Plug 'alvan/vim-closetag' " HTML tags completion
Plug 'ervandew/supertab' " Auto-complete with tab
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Main autocompletion
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'AndrewRadev/tagalong.vim' " Auto replace tags

" ### Linting ###
Plug 'w0rp/ale' " Linter

" ### Navigation ###
Plug 'tpope/vim-commentary' " Comment blocks with <g-c>
Plug 'matze/vim-move' " Move blocks with <c-j> and <c-k>
Plug 'thoughtbot/vim-rspec' " Run rspec specs from VIM


" ### Highlight ###
Plug 'elzr/vim-json' " Improved highlight on JSON
Plug 'elixir-editors/vim-elixir' " Improved highlight on Elixir
Plug 'jparise/vim-graphql' " Improved highlight on GraphQL
Plug 'leafgarland/typescript-vim' " Improved highlight on Typescript
Plug 'peitalin/vim-jsx-typescript' " Improved highlight for TSX files
Plug 'pangloss/vim-javascript' " Improved highlight on Javascript
Plug 'mxw/vim-jsx' " Improved highlight for JSX files
Plug 'chrisbra/Colorizer' " Show RGB colors on vim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] } " Markdown preview

call plug#end()

" ############### Theme ###############
colorscheme codedark
syntax on
let g:airline_theme='codedark'

" Search highlight
" Reference: https://jonasjacek.github.io/colors
hi Search cterm=NONE
hi Search ctermfg=LightGrey
hi Search ctermbg=130
hi CursorColumn ctermbg=235

" ############### Plugins Settings ###############
" Open Nerd Tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeWinSize=50

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1

" FZF and AG configuration
"
" If Fuzzy Finder is installed using git
set rtp+=~/.fzf
let g:fzf_layout = { 'down': '~50%' }
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Search the selected word
nmap <C-i> :Ag! "\b<cword>\b" <CR>
" Search a given word
nmap <C-b> :Ag! -Q<SPACE>
" Search by filename
nmap <C-p> :Files<CR>
" Search current file path
nmap <C-f> :NERDTreeFind %:p <CR>

" Ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_pattern_options = {'\.component.html$': {'ale_enabled': 0}} " Disable for angular
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'typescript': ['tsserver', 'tslint'],
            \   'ruby': ['rubocop'],
            \   'python': ['flake8'],
            \   'elixir': ['credo'] }

" Vim-move
let g:move_key_modifier = 'C'

" Vim-jsx
let g:jsx_ext_required = 0

" Indent guides
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8

" Prettier
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled=0 " Disable Prettier error console
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.html PrettierAsync

" coc.nvim
"
" Go to references
nmap <silent> gr <Plug>(coc-references)
" Auto-import from TAB
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Nvim Markdown preview
nmap <leader>md :MarkdownPreview<CR>

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1


" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
