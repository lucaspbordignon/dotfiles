return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_enable = false
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.o.updatetime = 450
      vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

      vim.lsp.enable('cspell')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('tailwindcss')
      vim.lsp.enable('sorbet')
    end
  }
}
