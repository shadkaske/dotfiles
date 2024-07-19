return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = 'Format Code',
    },
  },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      yaml = { 'yamlfix' },
      blade = { 'blade-formatter' },
    },
    formatters = {
      yamlfix = {
        env = {
          YAMLFIX_WHITELINES = '1',
        },
      },
    },
  },
}
