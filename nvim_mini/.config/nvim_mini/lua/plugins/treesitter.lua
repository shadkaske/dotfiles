require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'bash',
      'css',
      'gitcommit',
      'gitignore',
      'html',
      'json',
      'lua',
      'markdown',
      'markdown_inline',
      'php',
      'python',
      'regex',
      'sql',
      'toml',
      'vim',
      'vimdoc',
      'yaml',
    },

    auto_install = true,

    highlight = {
      enable = true,
    },
})

---@class parser_config
local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.blade = {
  install_info = {
    url = 'https://github.com/EmranMR/tree-sitter-blade',
    files = { 'src/parser.c' },
    branch = 'main',
  },
  filetype = 'blade',
}

vim.filetype.add {
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
}
