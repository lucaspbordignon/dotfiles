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

-- Verify and automatically installs plugin versions
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("autoupdate"),
  callback = function()
    if require("lazy.status").has_updates then
      require("lazy").update({ show = false, })
    end
  end,
})

-- Buffer navigation
vim.keymap.set('n', '<leader>bp', ':bp<CR>')
vim.keymap.set('n', '<leader>bn', ':bn<CR>')
vim.keymap.set('n', '<leader>bd', ':bd<CR>')

-- Clear highlight
vim.keymap.set('n', '<leader>c', ':noh<CR>')

-- Markdown preview
vim.keymap.set('n', '<leader>md', ':MarkdownPreview<CR>')

-- Enforce Ctrl + C to act as Esc
vim.keymap.set({ 'v', 'n', 'i' }, '<C-c>', '<Esc>')

-- Move selected lines up
vim.keymap.set({ 'v', 'n', 'i' }, '<C-k>', ':m-2<CR>gv=gv')

-- Move selected lines down
vim.keymap.set({ 'v', 'n', 'i' }, '<C-j>', ":m'>+<CR>gv=gv")

-- Open buffers on Telescope
vim.keymap.set('n', '<leader>bb', ':Telescope buffers<CR>')

-- Set up the keymap for file picker
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = 'Telescope file picker' })

-- Set up the keymap for fuzzy finder
vim.keymap.set('n', '<C-g>', require('fzf-lua').grep, { desc = 'Grep files with pattern' })
vim.keymap.set('n', '<C-b>', require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })

-- LSP keymaps
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'Telescope go to references' })
vim.keymap.set('n', 'gD', require('telescope.builtin').lsp_definitions, { desc = 'Telescope go to definitions' })

-- Remove trailing whitespace when saving files
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function(ev)
    save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Disable smooth scroll
vim.g.snacks_scroll = false

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

-- Set 15% of scroll on CTRL-U/D and add a scoll offset
vim.keymap.set('n', '<C-u>', '15<C-u>', { noremap = true })
vim.keymap.set('n', '<C-d>', '15<C-d>', { noremap = true })
vim.opt.scrolloff = 8

-- Open Oil's file tree on Ctrl-N
vim.keymap.set("n", "<C-o>", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
