return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    enabled = false,
    config  = function ()
      require('mini.completion').setup({
        delay = { completion = 0, info = 0, signature = 0 },
        window = { 
          info = { height = 32, width = 80, border = "rounded" },
          signature = { height = 32, width = 80, border = "rounded" },
        },
      })
    end
  },
}
