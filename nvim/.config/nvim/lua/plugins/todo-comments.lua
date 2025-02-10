return {
  {
    "folke/todo-comments.nvim",
    event = { "VeryLazy" },
    cmd = {
      "TodoTrouble",
      "TodoTelescope",
      "TodoLocList",
      "TodoQuickFix",
    },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("todo-comments").setup({
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--glob=!lib/",
            "--glob=!.git",
            "--glob=!vendor",
            "--glob=!node_modules",
            "--glob=!public/",
          },
        },
      })
    end,
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { "<leader>ct", "<cmd>TodoTelescope<cr>", desc = "Code Todos" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find Todos" },
    },
  },
}
