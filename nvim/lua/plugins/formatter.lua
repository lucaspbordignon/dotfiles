return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        -- ruby = { "rubocop" },
      },
      formatters = {
        rubocop = {
          args = { "--server", "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" }
        }
      }
    })
  end
}
