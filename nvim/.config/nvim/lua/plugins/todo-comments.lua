return {
  {
    "folke/todo-comments.nvim",
    event = { "VeryLazy" },
    cmd = {
      "TodoTrouble",
      "TodoLocList",
      "TodoQuickFix",
    },
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
      {
        "<leader>st",
        function()
          Snacks.picker.todo_comments()
        end,
        desc = "Todo",
      },
      {
        "<leader>sT",
        function()
          Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
  },
}
