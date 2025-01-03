return {
  'debugloop/telescope-undo.nvim',
  event = 'VeryLazy',
  dependencies = {
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
  },
  keys = {
    {
      '<leader>fu',
      '<cmd>Telescope undo<cr>',
      desc = 'Undo History',
    },
  },
  opts = {
    extensions = {
      undo = {
        use_delta = true,
        use_custom_command = nil,
        side_by_side = false,
        vim_diff_opts = { ctxlen = 0 },
        entry_format = 'state #$ID, $STAT, $TIME',
        time_format = '',
        saved_only = false,
      },
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension 'undo'

    require('which-key').add {
      { '<leader>fu', icon = require('util.icons').Undo, desc = "Undo History" },
    }
  end,
}
