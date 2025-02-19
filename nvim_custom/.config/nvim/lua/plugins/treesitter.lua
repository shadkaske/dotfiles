return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      ignore_install = {},
      modules = {},
      ensure_installed = {
        "bash",
        "css",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        "hyprlang",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "query",
        "regex",
        "sql",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      ---@class parser_config
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
  },
}
