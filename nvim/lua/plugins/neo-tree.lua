return   {
    "nvim-neo-tree/neo-tree.nvim", -- Modern replacement for NERDTree
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = false,
        version = false,
        window = { width = 50 },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          use_libuv_file_watcher = true,
        },
      })

      -- Keymaps
      vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')
      vim.keymap.set('n', '<C-f>', ':Neotree reveal<CR>')
    end,
  }
