return {
  {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    command = { "Oil" },
    opts = {
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", { desc = "Open Directory" } },
    },
  },
}
