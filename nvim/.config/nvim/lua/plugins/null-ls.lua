return {
  -- TODO: Replace this with conform.nvim
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'jay-babu/mason-null-ls.nvim',
  },
  config = function()
    require('mason').setup()
    local formatting = require('null-ls').builtins.formatting
    -- Can use this if you need diagnostics
    local diagnostics = require('null-ls').builtins.diagnostics

    require('null-ls').setup {
      debug = false,
      sources = {
        formatting.sql_formatter,
        formatting.shfmt,
        formatting.black,
        diagnostics.ansiblelint,
      },
    }

    require('mason-null-ls').setup {
      ensure_installed = { 'black' },
      automatic_installation = true,
    }
  end,
}
