return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',

  version = '*',

  opts = {
    keymap = {
      preset = 'default',
      ["<CR>"] = { "select_and_accept", "fallback" },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    completion = {
      menu = {
        auto_show = function(ctx) return ctx.mode ~= 'cmdline' end,
        border = "rounded",
        draw = {
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                return kind_icon
              end,
              -- Optionally, you may also use the highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end,
            }
          }
        }
      },
      documentation = { auto_show = true }
    },

    signature = {
      enabled = true,
      window = {
        max_width = 64,
        border = "rounded"
      }
    },
  },
  opts_extend = { "sources.default" }
}
