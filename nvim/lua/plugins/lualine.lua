  return {
    "nvim-lualine/lualine.nvim", -- Modern replacement for vim-airline
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("config.lualine")
    end,
  }
