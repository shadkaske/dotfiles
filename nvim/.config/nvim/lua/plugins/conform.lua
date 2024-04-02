return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      yaml = { 'yamlfix' },
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
