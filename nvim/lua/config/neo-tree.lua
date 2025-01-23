-- ~/.config/nvim/lua/config/neo-tree.lua

require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  window = {
    width = 50,
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    follow_current_file = true,
    use_libuv_file_watcher = true,
  },
})

-- Keymaps
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')
vim.keymap.set('n', '<C-f>', ':Neotree reveal<CR>')
