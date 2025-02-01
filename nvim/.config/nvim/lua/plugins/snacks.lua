return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = "",
        },
      },
      indent = { enabled = false },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      notify = { enabled = true },
      picker = { enabled = false },
      quickfile = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      terminal = { enabled = true },
      words = { enabled = true },
      styles = {
        lazygit = {
          border = "rounded",
        },
      },
      toggle = {
        map = vim.keymap.set, -- keymap.set function to use
        which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
        notify = true, -- show a notification when toggling
        -- icons for enabled/disabled states
        icon = {
          enabled = " ",
          disabled = " ",
        },
        -- colors for enabled/disabled states
        color = {
          enabled = "green",
          disabled = "yellow",
        },
      },
    },
    keys = {
      { "<leader>gg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },
      {
        "<leader>.",
        "<cmd>lua Snacks.scratch()<cr>",
        desc = "Toggle Scratch Buffer",
      },
      {
        "<leader>S",
        "<cmd>lua Snacks.scratch.select()<cr>",
        desc = "Select Scratch Buffer",
      },
      {
        "<leader>cR",
        function()
          Snacks.rename.rename_file()
        end,
        desc = "Rename File",
      },
      {
        "<leader>gB",
        function()
          Snacks.gitbrowse()
        end,
        desc = "Git Browse",
        mode = { "n", "v" },
      },
      {
        "<leader>gb",
        function()
          Snacks.git.blame_line()
        end,
        desc = "Git Blame Line",
      },
      {
        "<leader>gf",
        function()
          Snacks.lazygit.log_file()
        end,
        desc = "Lazygit Current File History",
      },
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gl",
        function()
          Snacks.lazygit.log()
        end,
        desc = "Lazygit Log (cwd)",
      },
      {
        "<leader>.",
        function()
          Snacks.scratch()
        end,
        desc = "Toggle Scratch Buffer",
      },
      {
        "<leader>S",
        function()
          Snacks.scratch.select()
        end,
        desc = "Select Scratch Buffer",
      },
      {
        "<leader>uN",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
      {
        "<leader>t",
        function()
          Snacks.terminal.toggle()
        end,
        desc = "Terminal",
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Create some toggle mappings
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.dim():map("<leader>uD")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
          Snacks.toggle.option("hlsearch", { name = "Highlight Search" }):map("<leader>u.")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.scroll():map("<leader>uS")
          Snacks.toggle.treesitter():map("<leader>uT")
        end,
      })
    end,
  },
}
