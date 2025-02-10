return {
  {
    "ccaglak/larago.nvim",
    lazy = true,
    event = "BufReadPost",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "GoBlade",
    },
    keys = {
      { "<leader>lg", "<cmd>GoBlade<cr>", desc = "Go To Blade..." },
    },
  },
}
