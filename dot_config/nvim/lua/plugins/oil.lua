return {
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            vim.g.oil_details = not vim.g.oil_details
            if vim.g.oil_details then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open Oil Buffer" },
    },
  },
}
