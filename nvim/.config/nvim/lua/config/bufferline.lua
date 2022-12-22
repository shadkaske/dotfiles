require("bufferline").setup({
  options = {
    close_command = "bdelete! %d",
    show_close_icon = false,
    show_buffer_close_icon = false,
    alway_show_bufferline = false,
    offsets = {
      {
        filetype = "undotree",
        text = "Undotree",
        padding = 1,
      },
      {
        filetype = "NvimTree",
        text = "Explorer",
        padding = 1,
      },
      { filetype = "DiffviewFiles",
        text = "Diff View",
        padding = 1,
      },
      {
        filetype = "flutterToolsOutline",
        text = "Flutter Outline",
      },
      {
        filetype = "packer",
        text = "Packer",
        padding = 1,
      },
    },
  },
})
