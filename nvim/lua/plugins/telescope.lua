return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          vertical = {
            preview_height = 0.6,
            results_height = 0.4,
            mirror = true
          },
        },
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          ".next/",
          "dist/",
          "build/",
          "vendor/",
          "spec/fixtures/",
          "%.jpg",
          "%.jpeg",
          "%.png",
          "%.svg",
          "%.otf",
          "%.ttf",
          "%.webp",
        }
      },
    })
  end,
}
