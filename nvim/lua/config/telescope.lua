-- ~/.config/nvim/lua/config/telescope.lua

local telescope = require('telescope')

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "sorbet",
      "spec/fixtures",
      "log"
    },
    layout_config = {
      width = 0.75,
      height = 0.75,
      preview_cutoff = 120,
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
    },
  },
})

-- Enable telescope fzf native
require('telescope').load_extension('fzf')
