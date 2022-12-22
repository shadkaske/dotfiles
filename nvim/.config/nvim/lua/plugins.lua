return function(use)
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
