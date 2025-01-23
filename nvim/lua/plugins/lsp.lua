return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require("lspconfig").ts_ls.setup({ capabilities = capabilities })
      require("lspconfig").ruby_lsp.setup({ })
      require("lspconfig").lua_ls.setup({ capabilities = capabilities })
      require("lspconfig").grammarly.setup({ capabilities = capabilities })
    end
  }
}
