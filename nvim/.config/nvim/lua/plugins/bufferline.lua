return {
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '<leader>bj', '<cmd>BufferLinePick<cr>', desc = 'Jump to Buffer' },
    },
    opts = {
      options = {
        diagnostics = 'nvim-lsp',
        always_show_bufferline = false,
        show_close_icon = false,
        show_buffer_close_icons = false,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'Nvim Tree',
            separator = false,
            text_align = 'left',
          },
        },
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },
}
