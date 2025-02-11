return {
  {
    "echasnovski/mini-git",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.git").setup()
    end,
  },
}
