return {
  'stevearc/oil.nvim',
  lazy = true,
  cmd = 'Oil',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git'
      end,
    },
    win_options = { wrap = true },
    keymaps = {
      ['<C-h>'] = false,
      ['<C-x'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
      ['<C-s>'] = false,
      ['<C-v'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
    },
  },
  keys = {
    vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open Oil in File Dir' }),
  },
}
