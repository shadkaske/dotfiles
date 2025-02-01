return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  dependancies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({ keymaps = { ["<Esc>"] = "actions.close" } })
  end,
  keys = {
    { "-", "<cmd>Oil<cr>", mode = "n", desc = "Open Filesystem" },
    { "=", "<cmd>Oil --float<cr>", mode = "n", desc = "Open Floating Filesystem" },
  },
}
