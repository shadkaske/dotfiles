local bufferline_ok, bufferline = pcall(require, "bufferline")

if not bufferline_ok then
  return
end

bufferline.setup({
  options = {
    close_command = "Bdelete! %d",
    show_buffer_icons = true,
    diagnostics = "nvim_lsp",
    show_close_icon = false,
    show_buffer_close_icon = false,
    alway_show_bufferline = false,
    show_tab_indicators = true,
    separator_style = "slant",
    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,
    color_icons = true,
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
