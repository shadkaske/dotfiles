return {
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup {
      plugins = {
        registers = false,
      },
      layout = {
        align = 'center',
        spacing = 4,
      },
      icons = {
        breadcrumb = '»',
        separator = '➜',
        group = '',
      },
    }

    local wk = require 'which-key'

    -- Which key labels
    local icons = require 'util.icons'

    wk.add {
      {
        mode = { 'n', 'v' },
        { '<leader>b', group = 'Buffers' },
        { '<leader>bs', group = 'swap' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Debug' },
        { '<leader>f', group = 'Find' },
        { '<leader>g', group = 'Git' },
        { '<leader>h', group = 'Harppon' },
        { '<leader>l', group = string.format('%s Laravel', icons.Laravel) },
        { '<leader>q', group = 'Quit' },
        { '<leader>s', group = 'Session' },
        { '<leader>y', group = string.format('%s Clipboard', icons.Paste) },
      },
    }
  end,
}
