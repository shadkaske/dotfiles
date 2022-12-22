return function(use)
 -- LSP Configuration & Plugins
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  })

  use({ -- Autocompletion
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
    },
  })

  use({ -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  })

  use({ -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })

  -- Git related plugins
  use("lewis6991/gitsigns.nvim")

  use("navarasu/onedark.nvim") -- Theme inspired by Atom
  use("nvim-lualine/lualine.nvim") -- Fancier statusline
  use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
  use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
  use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

  use("folke/which-key.nvim")

  use("akinsho/bufferline.nvim")

  use("windwp/nvim-autopairs")

  use("nvim-tree/nvim-tree.lua")

  use({
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
  })

  -- BufDelete ( close buffer leave the window )
  use("famiu/bufdelete.nvim")

  -- Lightspeed Motion Plugin
  use("ggandor/lightspeed.nvim")

  -- Null Ls
  use("jose-elias-alvarez/null-ls.nvim")

  -- ToggleTerm
  use({
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
  })

  -- vim surround
  -- use("tpope/vim-surround")
  use({
    "kylechui/nvim-surround",
    tag = "*"
  })

end
