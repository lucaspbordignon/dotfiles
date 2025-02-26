return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  enabled = true,
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    file_selector = {
      provider = "snacks"
    },

    provider = "claude",
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-sonnet-20241022",
      temperature = 0,
      max_tokens = 4096,
    },
  },
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "echasnovski/mini.icons",
    {
      "OXY2DEV/markview.nvim",
      enabled = true,
      lazy = false,
      opts = {
        preview = {
          filetypes = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
          ignore_buftypes = {},
        },
        max_length = 99999,
      },
    },
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    }
  },
}
