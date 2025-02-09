return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        globalstatus = true,
        component_separators = { left = ")", right = "(" },
        section_separators = { left = " ", right = " " },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          {
            "branch",
            icon = "",
          },
          "diff",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
