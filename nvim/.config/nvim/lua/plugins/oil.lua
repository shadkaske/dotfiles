return {
  'stevearc/oil.nvim',
  lazy = true,
  cmd = 'Oil',
  dependencies = {
    'echasnovski/mini.icons',
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
    float = {
      max_width = 40,
      max_height = 24,
    },
    keymaps = {
      ['<C-h>'] = false,
      ['<C-x'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
      ['<C-s>'] = false,
      ['<C-v'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
    },
  },
  keys = {
    vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open Oil in File Dir' }),
    vim.keymap.set('n', '<leader>e', function() require('oil').toggle_float() end, { desc = 'Open Oil in File Dir' }),
  },
}
