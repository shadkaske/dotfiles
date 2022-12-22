local gitsigns_ok, gitsigns = pcall(require, "gitsigns")

if not gitsigns_ok then
  return
end

-- Gitsigns
-- See `:help gitsigns.txt`
gitsigns.setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
})

