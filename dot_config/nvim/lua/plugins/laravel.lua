return {
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "ravitemer/mcphub.nvim", -- optional
    },
    cmd = { "Laravel" },
    keys = {
      {
        "<leader>ll",
        function()
          Laravel.pickers.laravel()
        end,
        desc = "Laravel: Open Laravel Picker",
      },
      {
        "<c-g>",
        function()
          Laravel.commands.run("view:finder")
        end,
        desc = "Laravel: Open View Finder",
      },
      {
        "<leader>la",
        function()
          Laravel.pickers.artisan()
        end,
        desc = "Laravel: Open Artisan Picker",
      },
      {
        "<leader>lt",
        function()
          Laravel.commands.run("actions")
        end,
        desc = "Laravel: Open Actions Picker",
      },
      {
        "<leader>lr",
        function()
          Laravel.pickers.routes()
        end,
        desc = "Laravel: Open Routes Picker",
      },
      {
        "<leader>lh",
        function()
          Laravel.run("artisan docs")
        end,
        desc = "Laravel: Open Documentation",
      },
      {
        "<leader>lm",
        function()
          Laravel.pickers.make()
        end,
        desc = "Laravel: Open Make Picker",
      },
      {
        "<leader>lc",
        function()
          Laravel.pickers.commands()
        end,
        desc = "Laravel: Open Commands Picker",
      },
      {
        "<leader>lo",
        function()
          Laravel.pickers.resources()
        end,
        desc = "Laravel: Open Resources Picker",
      },
      {
        "<leader>lp",
        function()
          Laravel.commands.run("command_center")
        end,
        desc = "Laravel: Open Command Center",
      },
      {
        "gf",
        function()
          local ok, res = pcall(function()
            if Laravel.app("gf").cursorOnResource() then
              return "<cmd>lua Laravel.commands.run('gf')<cr>"
            end
          end)
          if not ok or not res then
            return "gf"
          end
          return res
        end,
        expr = true,
        noremap = true,
      },
    },
    event = { "VeryLazy" },
    opts = {
      features = {
        pickers = {
          provider = "snacks", -- "snacks | telescope | fzf-lua | ui-select"
        },
      },
    },
  },
  {
    "ccaglak/larago.nvim",
    lazy = true,
    event = { "BufRead *.blade.php" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "GoBlade",
    },
    keys = {
      { "<leader>lg", "<cmd>GoBlade<cr>", desc = "Go To Blade..." },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "blade-formatter",
        "emmet-ls",
        "eslint_d",
        "html-lsp",
        "intelephense",
        "laravel-ls",
        "nginx-language-server",
        "php-debug-adapter",
        "phpstan",
        "pint",
        "prettierd",
        "rustywind",
        "tailwindcss-language-server",
      },
    },
  },
  {
    "jwalton512/vim-blade",
  },
  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = {
      linters_by_ft = {
        php = { "phpstan" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        blade = { "blade-formatter", "rustywind" },
        php = { "pint" },
      },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
      pint = {
        meta = {
          url = "https://github.com/laravel/pint",
          description = "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
        },
        command = require("conform.util").find_executable({
          vim.fn.stdpath("data") .. "/mason/bin/pint",
          "vendor/bin/pint",
        }, "pint"),
        args = { "$FILENAME" },
        stdin = false,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        intelephense = {
          filetypes = { "php", "blade", "php_only" },
          settings = {
            intelephense = {
              filetypes = { "php", "blade", "php_only" },
              files = {
                associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
        laravel_ls = {},
      },
    },
  },
}
