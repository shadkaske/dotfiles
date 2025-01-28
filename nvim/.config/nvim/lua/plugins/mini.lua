return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.ai").setup()
      require("mini.comment").setup()
      require("mini.operators").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.move").setup({
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = "<M-S-h>",
          right = "<M-S-l>",
          down = "<M-S-j>",
          up = "<M-S-k>",

          -- Move current line in Normal mode
          line_left = "<M-S-h>",
          line_right = "<M-S-l>",
          line_down = "<M-S-j>",
          line_up = "<M-S-k>",
        },
      })
      require("mini.bracketed").setup()
      require("mini.bufremove").setup()
      require("mini.git").setup()
      require("mini.diff").setup({
        view = {
          style = "sign",
        },
      })
      require("mini.jump").setup()
      require("mini.jump2d").setup()

      -- Keymaps
      vim.keymap.set("n", "<leader>bd", function()
        MiniBufremove.delete()
      end, { desc = "Close Buffer" })
      vim.keymap.set("n", "<leader>j", function()
        MiniJump2d.start()
      end, { desc = "Jump" })
    end,
  },
}
