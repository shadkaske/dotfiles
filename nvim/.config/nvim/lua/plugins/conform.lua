return {
  'stevearc/conform.nvim',
  dependencies = {
    {
      'williamboman/mason.nvim',
      config = true,
    },
    { "zapling/mason-conform.nvim" },
  },
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo', 'Format' },
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
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      yaml = { 'yamlfix' },
      blade = { 'blade-formatter' },
      php = { 'pint' },
      xml = { 'xmlformat' },
      sh = { 'shellcheck', 'shfmt' },
      sql = { 'sql-formatter' },
    },
    formatters = {
      yamlfix = {
        env = {
          YAMLFIX_WHITELINES = '1',
        },
      },
    },
  },
  init = function()
    -- conform format commadn
    vim.api.nvim_create_user_command('Format', function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ['end'] = { args.line2, end_line:len() },
        }
      end
      require('conform').format { async = true, lsp_format = 'fallback', range = range }
    end, { range = true })
  end,
}
