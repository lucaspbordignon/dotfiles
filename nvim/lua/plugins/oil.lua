return {
  {
    'stevearc/oil.nvim',
    opts = {
      float = {
        padding = 4,
        max_width = 80,
        max_height = 64,
        border = "rounded",
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    enabled = true,
    lazy = false,
  }
}
