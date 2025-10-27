return {
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open Oil Buffer" },
    },
  },
}
