return {
  {
    "adalessa/laravel.nvim",
    dependencies = {
      { "tpope/vim-dotenv" },
      { "nvim-telescope/telescope.nvim" },
      { "MunifTanjim/nui.nvim" },
      { "kevinhwang91/promise-async" },
    },
    event = { "VeryLazy" },
    cmd = { "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    opts = {
      lsp_server = "intelephense",
      pickers = {
        enable = true,
        provider = "snacks",
      },
      features = {
        model_info = {
          enable = false,
        },
        route_info = {
          enable = false,
        },
      },
    },
    config = true,
  },
}
