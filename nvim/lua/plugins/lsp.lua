return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      vim.o.updatetime = 250
      vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

      require("lspconfig").ts_ls.setup({ })
      require("lspconfig").tailwindcss.setup({ })
      require("lspconfig").ruby_lsp.setup({ })
      require("lspconfig").lua_ls.setup({ })
    end
  }
}
