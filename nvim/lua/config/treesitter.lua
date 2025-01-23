-- ~/.config/nvim/lua/config/treesitter.lua

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "lua",
    "vim",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "yaml",
    "html",
    "css",
    "graphql",
    "prisma",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
})
