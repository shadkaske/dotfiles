return {
  {
    "mrjones2014/smart-splits.nvim",
    build = "./kitty/install-kittens.bash",
    keys = {
      {
        "<A-h>",
        function()
          require("smart-splits").resize_left()
        end,
        desc = "",
      },
      {
        "<A-j>",
        function()
          require("smart-splits").resize_down()
        end,
        desc = "",
      },
      {
        "<A-k>",
        function()
          require("smart-splits").resize_up()
        end,
        desc = "",
      },
      {
        "<A-l>",
        function()
          require("smart-splits").resize_right()
        end,
        desc = "",
      },
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "",
      },
      {
        "<C-\\>",
        function()
          require("smart-splits").move_cursor_previous()
        end,
        desc = "",
      },
      {
        "<leader>mh",
        function()
          require("smart-splits").swap_buf_left()
        end,
        desc = "",
      },
      {
        "<leader>mj",
        function()
          require("smart-splits").swap_buf_down()
        end,
        desc = "",
      },
      {
        "<leader>mk",
        function()
          require("smart-splits").swap_buf_up()
        end,
        desc = "",
      },
      {
        "<leader>ml",
        function()
          require("smart-splits").swap_buf_right()
        end,
        desc = "",
      },
    },
  },
}
