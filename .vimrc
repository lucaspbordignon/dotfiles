"
" Using the 'gvim' package to enable the clipboard feature.
"
" Requires:
"           - The_silver_searcher package
"           - vim Fuzzy Finder

set hidden
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

" REPLACER - Find /"KEY":/ and replace with /KEY:/
nmap <leader>rk :%s/"\(.*\)":/\1:/g <CR>

" REPLACER - Find /EVERY LINE/ and replace with /EVERY LINE + char:/
nmap <leader>rl :%norm A<CHARACTER>

" REPLACER - Break long lines into 80 chars chunks
nmap <leader>rlo :s/\v(.{80})/\1\r/g <CR>

" Automatically set paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" ############### Plugins ###############
call plug#begin('~/.local/share/nvim/plugged')

" ### Navigation ###
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " Folder navigation
Plug 'rking/ag.vim' " Filsystem searcher as ack
Plug 'junegunn/fzf.vim' " Fuzzy finder for text
Plug 'christoomey/vim-system-copy' " Keep vim and system clipboards
Plug 'tpope/vim-commentary' " Comment blocks with <g-c>
Plug 'thoughtbot/vim-rspec' " Run rspec specs from VIM
Plug 'brooth/far.vim' " Search and replace
"Plug 'mg979/vim-visual-multi'

" ### Style ###
Plug 'bling/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Status bar theme
Plug 'tomasiser/vim-code-dark' " Darcula code colors
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " Prettier for Javascript
Plug 'themaxmarchuk/tailwindcss-colors.nvim'

" ### Auto-Complete ###
Plug 'jiangmiao/auto-pairs' " Brackets autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Main autocompletion
Plug 'AndrewRadev/tagalong.vim' " Auto replace tags
Plug 'github/copilot.vim'

" ### Highlight ###
Plug 'elzr/vim-json' " Improved highlight on JSON
Plug 'jparise/vim-graphql' " Improved highlight on GraphQL
Plug 'leafgarland/typescript-vim' " Improved highlight on Typescript
Plug 'peitalin/vim-jsx-typescript' " Improved highlight for TSX files
Plug 'mxw/vim-jsx' " Improved highlight for JSX files
Plug 'chrisbra/Colorizer' " Show RGB colors on vim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] } " Markdown preview
Plug 'prisma/vim-prisma' " Prisma highlight

call plug#end()

" ############### Theme ###############
let g:codedark_transparent=1
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
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1

" FZF and AG configuration
"
" If Fuzzy Finder is installed using git
set rtp+=~/.fzf
"let g:fzf_layout = { 'down': '~50%' }
let g:fzf_layout = { 'window': { 'width': 0.75, 'height': 0.75, 'relative': v:true  }  }
let $FZF_DEFAULT_COMMAND = 'ag --ignore sorbet/ --ignore spec/fixtures/ --ignore /log -g "" | sort'


" Search the selected word
nmap <C-i> :Ag! "\b<cword>\b" <CR>
" Search a given word
nmap <C-b> :Ag! --ignore sorbet/ --ignore spec/fixtures/ --ignore /log -Q<SPACE>
" Search by filename
nmap <C-p> :Files<CR>
" Search current file path
nmap <C-f> :NERDTreeFind %:p <CR>
" Move selected lines up
xnoremap <C-k> :m-2<CR>gv=gv
" Move selected lines down
xnoremap <C-j> :m'>+<CR>gv=gv

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
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Enforced servers to be installed
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', '@yaegassy/coc-tailwindcss3', 'coc-spell-checker']

" Git keep local (mine)
nmap gkm <Plug>(coc-git-keepincoming)
" Git keep remote (head)
nmap gkh <Plug>(coc-git-keepcurrent)
" Git next conflict
nmap gn <Plug>(coc-git-nextconflict)
" Git previous conflict
nmap gp <Plug>(coc-git-prevconflict)


" Nvim Markdown preview
nmap <leader>md :MarkdownPreview<CR>

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>

" Find and Replace
let g:far#preview_window_height = 50

nnoremap <silent> <leader>ff :Farf<cr>
nnoremap <silent> <leader>fr :Farr<cr>

" Multi-cursor
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-r>' " replace C-n
