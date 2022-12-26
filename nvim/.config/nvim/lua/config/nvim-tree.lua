local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")

if not nvim_tree_ok then
  return
end

nvim_tree.setup({
  disable_netrw = true,
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  view = {
    adaptive_size = true,
    width = 35,
  },
  git = {
    ignore = false,
  },
  diagnostics = {
    enable = true,
  },
})
