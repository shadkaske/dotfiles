return {
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  lazy = false,
  opts = {
    signcolumn = false,
  },
  keys = {
    { '<leader>gP', "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                           desc = 'Preview Hunk' },
    { '<leader>gR', "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                           desc = 'Reset Buffer' },
    { '<leader>gd', '<cmd>Gitsigns diffthis HEAD<cr>',                                          desc = 'Git Diff' },
    { '<leader>gn', "<cmd>lua require('gitsigns').next_hunk({navigation_message=false})<cr>zz", desc = 'Next Hunk' },
    { '<leader>gp', "<cmd>lua require('gitsigns').prev_hunk({navigation_message=false})<cr>zz", desc = 'Previous Hunk' },
    { '<leader>gr', "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                             desc = 'Reset Hunk' },
    { '<leader>gs', "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                             desc = 'Stage Hunk' },
    { '<leader>gu', "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",                        desc = 'Undo Stage Hunk' },
  },
}
