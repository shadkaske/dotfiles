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
    { '<leader>lr', ':Laravel routes<cr>', desc = 'Laravel Routes' },
    {
      '<leader>l.',
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        local idehelper = Terminal:new {
          cmd = [[
            tput setaf 2 && echo "Updating IDE Helper" && \
            php artisan ide-helper:meta --no-interaction --quiet && \
            php artisan ide-helper:eloquent --no-interaction --quiet && \
            php artisan ide-helper:generate --no-interaction --quiet && \
            php artisan ide-helper:models --no-interaction --nowrite --quiet
          ]],
          dir = 'git_dir',
          direction = 'horizontal',
          size = 30,
          hidden = true,
        }

        idehelper:toggle()
      end,
      desc = 'Build Ide Helper',
    },
  },
  config = function()
    require('laravel').setup {
      lsp_server = 'intelephense',
      features = {
        null_ls = {
          enable = true,
        },
      },
    }
    require('telescope').load_extension 'laravel'
  end,
}
