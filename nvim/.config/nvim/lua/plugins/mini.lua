return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('plugins.mini.mini-ai')
    require('plugins.mini.mini-git')
    require('plugins.mini.mini-files')
    require('plugins.mini.mini-pairs')
    require('plugins.mini.mini-surround')
  end,
  keys = {
    { '-',         function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, desc = 'Open Mini Files in Buffers Current Path' },
    { '<leader>-', function() MiniFiles.open(nil, false) end,                   desc = 'Explore Current Working Directory' },
  }
}
