return {
  {
    "folke/snacks.nvim",
    opts = { explorer = {} },
    keys = {
      {
        "<leader>fe",
        function()
          Snacks.explorer({ cwd = LazyVim.root(), auto_close = true })
        end,
        desc = "Explorer Snacks (root dir)",
      },
      {
        "<leader>fE",
        function()
          Snacks.explorer({ auto_close = true })
        end,
        desc = "Explorer Snacks (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer Snacks (root dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },
    },
  },
}
