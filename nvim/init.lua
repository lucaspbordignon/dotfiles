-- Set the leader key
vim.g.mapleader = ','

-- Basic vim options
vim.opt.hidden = true
vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.laststatus = 2
vim.opt.backspace = 'indent,eol,start'
vim.opt.linebreak = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.clipboard:append { 'unnamedplus' }

-- Turn off swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Indentation
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2

-- Search settings
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Correcting common command typos
vim.cmd('command! WQ wq')
vim.cmd('command! Wq wq')
vim.cmd('command! W w')
vim.cmd('command! Q q')
vim.cmd('command! Qa qa')
vim.cmd('command! Tabe tabe')

-- Install lazy.nvim
require("config.lazy")

-- Buffer navigation
vim.keymap.set('n', '<leader>bp', ':bp<CR>')
vim.keymap.set('n', '<leader>bn', ':bn<CR>')
vim.keymap.set('n', '<leader>bd', ':bd<CR>')

-- Clear highlight
vim.keymap.set('n', '<leader>c', ':noh<CR>')

-- Markdown preview
vim.keymap.set('n', '<leader>md',  ':MarkdownPreview<CR>')

-- Enforce Ctrl + C to act as Esc
vim.keymap.set({'v', 'n', 'i'}, '<C-c>', '<Esc>')

-- Move selected lines up
vim.keymap.set({'v', 'n', 'i'}, '<C-k>', ':m-2<CR>gv=gv')
-- Move selected lines down
vim.keymap.set({'v', 'n', 'i'}, '<C-j>', ":m'>+<CR>gv=gv")

-- Set up the keymap for file picker
vim.keymap.set('n', '<C-p>', function() require('snacks').picker.pick("files", opts) end, { noremap = true, silent = true })
-- Set up the keymap for fuzzy finder
vim.keymap.set('n', '<C-b>', function() require('snacks').picker.grep() end, { noremap = true, silent = true })

-- Set the vscode theme
vim.cmd.colorscheme "vscode"

-- Disable hints at the end of the lines
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  float = {
    border = 'rounded',
    source = 'always'
  }
})
