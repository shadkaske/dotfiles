return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      disable_netrw = true,
      view = {
        width = '20%',
        side = 'left',
      },
      diagnostics = {
        enable = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = '',
          info = '',
          warning = '',
          error = '',
        },
      },
      update_focused_file = {
        enable = false,
      },
      filters = {
        git_ignored = false,
        custom = {
          '^.null-ls.*',
        },
      },
      actions = {
        open_file = {
          resize_window = false,
        },
      },
    }

    -- auto close
    local function is_modified_buffer_open(buffers)
      for _, v in pairs(buffers) do
        if v.name:match 'NvimTree_' == nil then
          return true
        end
      end
      return false
    end

    vim.api.nvim_create_autocmd('BufEnter', {
      nested = true,
      callback = function()
        if
          #vim.api.nvim_list_wins() == 1
          and vim.api.nvim_buf_get_name(0):match 'NvimTree_' ~= nil
          and is_modified_buffer_open(vim.fn.getbufinfo { bufmodified = 1 }) == false
        then
          vim.cmd 'quit'
        end
      end,
    })
    -- Toggle NvimTree
    vim.keymap.set({ 'n', 'v' }, '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'NvimTree Toggle' })
  end,
}
