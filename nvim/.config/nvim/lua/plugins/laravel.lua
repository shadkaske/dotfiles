return {
  'adalessa/laravel.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'tpope/vim-dotenv',
    'MunifTanjim/nui.nvim',
    'nvimtools/none-ls.nvim',
  },
  cmd = { 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
  event = { 'VeryLazy' },
  keys = {
    { '<leader>la', ':Laravel artisan<cr>', desc = 'Artisan Commands' },
    { '<leader>lr', ':Laravel routes<cr>',  desc = 'Laravel Routes' },
    {
      '<leader>lb',
      function()
        local run = require "laravel.run"
        run("artisan", { "ide-helper:meta --no-interaction --quiet" }, {})
        run("artisan", { "ide-helper:eloquent --no-interaction --quiet" }, {})
        run("artisan", { "ide-helper:generate --no-interaction --quiet" }, {})
        run("artisan", { "ide-helper:models --no-interaction --nowrite --quiet" }, {})
      end,
      desc = 'Build Ide Helper'
    },
  },
  config = function()
    require('laravel').setup({
      lsp_server = "intelephense",
      features = {
        null_ls = {
          enable = false,
        },
      }
    })
    require('telescope').load_extension 'laravel'
  end,
}
