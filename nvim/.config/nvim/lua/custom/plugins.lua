return function(use)
  use("folke/which-key.nvim")

  use("akinsho/bufferline.nvim")

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end
  })

  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({})
    end
  })

  use({
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- BufDelete ( close buffer leave the window )
  use({ 'famiu/bufdelete.nvim' })

  -- Lightspeed Motion Plugin
  use({ 'ggandor/lightspeed.nvim' })

  -- Null Ls
  -- use({ "jose-elias-alvarez/null-ls.nvim" })

  -- ToggleTerm
  use({
    "akinsho/toggleterm.nvim",
    tag = 'v2.*',
  })

  -- vim surround
  use("tpope/vim-surround")
end