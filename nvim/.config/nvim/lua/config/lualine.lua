local lualine_ok, lualine = pcall(require, "lualine")

if not lualine_ok then
  return
end

-- Set lualine as statusline
-- See `:help lualine.txt`
lualine.setup({
  options = {
    icons_enabled = true,
    theme = "onedark",
  },
})


