return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      -- neovim-ayu has no transparency option; drop the backgrounds instead
      local none = { bg = "none" }
      require("ayu").setup({
        mirage = false,
        overrides = {
          Normal = none,
          NormalNC = none,
          NormalFloat = none,
          FloatBorder = none,
          SignColumn = none,
          FoldColumn = none,
          Folded = none,
          EndOfBuffer = none,
          LineNr = none,
          VertSplit = none,
          WinSeparator = none,
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_mode = true,
    },
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu-dark",
    },
  },
}
