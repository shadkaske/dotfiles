return {
  "folke/which-key.nvim",
  opts = {
    preset = "modern",
  },
  init = function()
    require("which-key").add({
      { "<leader>l", group = "Laravel", icon = { icon = "", color = "red" } },
      { "<leader>t", group = "Ansible", icon = { icon = "", color = "blue" } },
    })
  end,
}
