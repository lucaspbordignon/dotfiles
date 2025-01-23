return   {
  'romgrk/barbar.nvim',
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    icons = {
      separator = { left = '', right = '' },
      button = ''
    }
  },
  version = '^1.0.0',
}
