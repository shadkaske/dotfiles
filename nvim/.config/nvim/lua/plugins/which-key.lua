return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    require('which-key').setup {
      plugins = {
        registers = false,
      },
      preset = 'helix',
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
        { '<leader>b',  group = 'Buffers' },
        { '<leader>bs', group = 'swap' },
        { '<leader>c',  group = 'Code' },
        { '<leader>d',  group = 'Debug' },
        { '<leader>f',  group = 'Find' },
        { '<leader>g',  group = 'Git' },
        { '<leader>h',  group = 'Harppon',   icon = { icon = icons.Harpoon, color = 'cyan' } },
        { '<leader>l',  group = 'Laravel',   icon = { icon = icons.Laravel, color = 'red' } },
        { '<leader>n',  group = 'New',       icon = { icon = icons.New, color = 'blue' } },
        { '<leader>q',  group = 'Quit' },
        { '<leader>s',  group = 'Session' },
        { '<leader>w',  group = 'Windows',   icon = { icon = icons.Window, color = 'cyan' } },
        { '<leader>u',  group = 'UI Toggles' },
        { '<leader>y',  group = 'Clipboard', icon = { icon = icons.Paste, color = 'azure' } },
      },
    }
  end,
}
