return {
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
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
