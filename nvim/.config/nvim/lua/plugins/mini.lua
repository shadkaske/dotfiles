return {
  'echasnovski/mini.nvim',
  version = false,
  lazy = false,
  opts = {},
  config = function()
    require('mini.icons').setup()
    require('mini.ai').setup()
    require('mini.diff').setup()
    require('mini.pairs').setup()
    require('mini.files').setup()
    require('mini.git').setup()
    require('mini.operators').setup()
    require('mini.jump2d').setup()
    require('mini.statusline').setup()
    require('mini.surround').setup({
      mappings = {
        add = 'gza',            -- Add surrounding in Normal and Visual modes
        delete = 'gzd',         -- Delete surrounding
        find = 'gzf',           -- Find surrounding (to the right)
        find_left = 'gzF',      -- Find surrounding (to the left)
        highlight = 'gzh',      -- Highlight surrounding
        replace = 'gzr',        -- Replace surrounding
        update_n_lines = 'gzn', -- Update `n_lines`
      },
    })

    vim.keymap.set('n', '-', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end,
      { desc = 'Explore Current Buffers Directory' })
    vim.keymap.set('n', '<leader>e', function() MiniFiles.open(nil, false) end,
      { desc = 'Explore Current Working Directory' })
    vim.keymap.set('n', '<leader>j', function() MiniJump2d.start() end, { desc = 'Mini Jump' })
  end,
}
