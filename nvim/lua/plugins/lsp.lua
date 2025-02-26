return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.o.updatetime = 450
      vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

      require("lspconfig").lua_ls.setup({ capabilities = capabilities })
      require("lspconfig").ts_ls.setup({ capabilities = capabilities })
      require("lspconfig").tailwindcss.setup({ capabilities = capabilities })
      -- require("lspconfig").ruby_lsp.setup({ capabilities = capabilities })
    end
  }
}
