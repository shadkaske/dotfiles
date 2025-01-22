return {
  'echasnovski/mini.nvim',
  version = false,
  lazy = false,
  opts = {},
  config = function()
    require('mini.ai').setup()
    require('mini.comment').setup()
    require('mini.diff').setup()
    require('mini.git').setup()
    require('mini.icons').setup()
    require('mini.indentscope').setup({ symbol = '┊', })
    require('mini.jump').setup()
    require('mini.jump2d').setup()
    require('mini.operators').setup()
    require('mini.pairs').setup()
    require('mini.statusline').setup()
    require('mini.surround').setup()

    vim.keymap.set('n', '<leader>j', function() MiniJump2d.start() end, { desc = 'Mini Jump' })
  end,
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "Trouble",
        "alpha",
        "dashboard",
        "fzf",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "notify",
        "snacks_dashboard",
        "snacks_notif",
        "snacks_terminal",
        "snacks_win",
        "toggleterm",
        "trouble",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "SnacksDashboardOpened",
      callback = function(data)
        vim.b[data.buf].miniindentscope_disable = true
      end,
    })
  end,
}
