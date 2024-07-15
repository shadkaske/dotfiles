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
        { '<leader>b', group = string.format('%s Buffers', icons.Buffers) },
        { '<leader>bs', group = 'swap' },
        { '<leader>c', group = string.format('%s Code', icons.LSP) },
        { '<leader>d', group = string.format('%s Debug', icons.Debugger) },
        { '<leader>f', group = string.format('%s Find', icons.Search) },
        { '<leader>g', group = string.format('%s Git', icons.Git) },
        { '<leader>h', group = string.format('%s Harppon', icons.kinds.Enum) },
        { '<leader>l', group = string.format('%s Laravel', icons.Laravel) },
        { '<leader>o', group = string.format('%s Org', icons.Spellcheck) },
        { '<leader>q', group = string.format('%s Quit', icons.BufferClose) },
        { '<leader>s', group = string.format('%s Session', icons.Session) },
        { '<leader>t', group = string.format('%s Terminal', icons.Terminal) },
        { '<leader>y', group = string.format('%s Clipboard', icons.Paste) },
      },
    }
  end,
}
