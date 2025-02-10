return {
  {
    "norcalli/nvim-colorizer.lua",
    event = { "VeryLazy" },
    cmd = {
      "ColorizerAttachToBuffer",
      "ColorizerDetachFromBuffer",
      "ColorizerReloadAllBuffers",
      "ColorizerToggle",
    },
    keys = {
      { "<leader>bc", "<mcd>ColorizerToggle<cr>", desc = "ColorizerToggle" },
    },
  },
}
