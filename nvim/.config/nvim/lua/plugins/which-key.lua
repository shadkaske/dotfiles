return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    init = function()
      require("which-key").add({
        {
          mode = { "n", "v" },
          { "<leader>b", group = "Buffers" },
          { "<leader>bs", group = "swap" },
          { "<leader>c", group = "Code" },
          { "<leader>d", group = "Debug" },
          { "<leader>f", group = "Find" },
          { "<leader>g", group = "Git" },
          { "<leader>gh", group = "Hunks" },
          { "<leader>h", group = "Harppon", icon = { icon = "󱡅", color = "cyan" } },
          { "<leader>l", group = "Laravel", icon = { icon = "󰫐", color = "red" } },
          { "<leader>n", group = "New", icon = { icon = "", color = "blue" } },
          { "<leader>q", group = "Quit" },
          { "<leader>s", group = "Session" },
          { "<leader>w", group = "Windows", icon = { icon = "", color = "cyan" } },
          { "<leader>u", group = "UI Toggles" },
          { "<leader>y", group = "Clipboard", icon = { icon = "", color = "azure" } },
        },
      })
    end,
  },
}
