return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  version = "2.x.x",
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    animate = { enabled = true },
    picker = {
      formatters = {
        file = {
          truncate = 120
        }
      }
    }
  },
  keys = {
    -- { "gD",         function() Snacks.picker.lsp_definitions() end,     desc = "Goto Definition" },
    -- { "gr",         function() Snacks.picker.lsp_references() end,      nowait = true,               desc = "References" },
    { "gI",         function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gb",         function() Snacks.git.blame_line() end,             desc = "Git Blame Line" },
    { "dx",         function() Snacks.dashboard.open(opts) end,         desc = "Open dashboard" },
    { "<leader>dd", function() Snacks.dashboard.open(opts) end,         desc = "Open dashboard" },
  }
}
