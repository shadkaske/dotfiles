return {
  'stevearc/oil.nvim',
  lazy = true,
  cmd = 'Oil',
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    columns = {
      'icon',
      -- "permissions",
      'size',
      'mtime',
    },
    keymaps = {
      ['<C-h>'] = false,
      ['<C-x'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open Oil in File Dir' }),
  },
}
