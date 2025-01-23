-- Set leader key
vim.g.mapleader = ","

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

-- Install lazy.nvim
require("config.lazy")

local keymap = vim.keymap.set

-- Buffer navigation
keymap('n', '<leader>bp', ':bp<CR>')
keymap('n', '<leader>bn', ':bn<CR>')
keymap('n', '<leader>bd', ':bd<CR>')

-- Clear highlight
keymap('n', '<leader>c', ':noh<CR>')

-- Enforce Ctrl + C to act as Esc
keymap({'v', 'n', 'i'}, '<C-c>', '<Esc>')

-- Move selected lines up
keymap({'v', 'n', 'i'}, '<C-k>', ':m-2<CR>gv=gv')
-- Move selected lines down
keymap({'v', 'n', 'i'}, '<C-j>', ":m'>+<CR>gv=gv")

-- Set up the keymap for file picker
vim.keymap.set('n', '<C-p>', function() require('snacks').picker.pick("files", opts) end, { noremap = true, silent = true })
-- Set up the keymap for fuzzy finder
vim.keymap.set('n', '<C-b>', function() require('snacks').picker.grep() end, { noremap = true, silent = true })

-- Close buffer on window closed
vim.api.nvim_create_autocmd('WinClosed', {
  callback = function(tbl)
    if tbl.args ~= nil then
      vim.api.nvim_command('BufferClose ' .. tbl.args)
    end
  end,
  group = vim.api.nvim_create_augroup('barbar_close_buf', {})
})
