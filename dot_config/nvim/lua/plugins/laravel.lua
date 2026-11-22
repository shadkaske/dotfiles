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
      -- php/composer/artisan run as `vendor/bin/sail php ...` in the
      -- laravel.test container; the host has no PHP. A per-project choice
      -- from `env:configure` still wins.
      environments = {
        default = "sail",
      },
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
    opts = function(_, opts)
      -- None of these need host PHP: intelephense, php-debug-adapter and
      -- blade-formatter run on Node; laravel-ls runs PHP through Sail.
      vim.list_extend(opts.ensure_installed, {
        "blade-formatter",
        "emmet-ls",
        "eslint_d",
        "html-lsp",
        "intelephense",
        "laravel-ls",
        "php-debug-adapter",
        "prettierd",
        "rustywind",
        "tailwindcss-language-server",
      })
      -- PHP tools that would run on host PHP; the LazyVim php extra adds
      -- phpcs and php-cs-fixer. The projects' own vendor/bin tools run
      -- through Sail instead (below).
      local host_php = { phpcs = true, ["php-cs-fixer"] = true, phpstan = true, pint = true }
      opts.ensure_installed = vim.tbl_filter(function(name)
        return not host_php[name]
      end, opts.ensure_installed)
    end,
  },
  {
    "jwalton512/vim-blade",
  },
  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = function(_, opts)
      local sail = require("util.sail")
      local linter
      linter = {
        -- The project's vendor/bin/phpstan in the container; skipped when
        -- the project has no phpstan or Sail isn't up.
        condition = function(ctx)
          local root = sail.root(ctx.filename)
          if not (root and sail.has_bin(root, "phpstan")) then
            return false
          end
          if not sail.running(root) then
            sail.warn_down(root, "phpstan")
            return false
          end
          linter.cwd = root -- sail runs from the project root
          return true
        end,
        cmd = function()
          return linter.cwd .. "/vendor/bin/sail"
        end,
        args = {
          "bin",
          "phpstan",
          "analyze",
          "--error-format=json",
          "--no-progress",
          function()
            return sail.relative(linter.cwd, vim.api.nvim_buf_get_name(0))
          end,
        },
        append_fname = false,
        stdin = false,
        ignore_exitcode = true,
        parser = function(output, bufnr, cwd)
          local ok, decoded = pcall(vim.json.decode, output)
          if not ok or type(decoded) ~= "table" or type(decoded.files) ~= "table" then
            return {}
          end
          -- phpstan reports container paths (/var/www/html/...)
          local rel = sail.relative(cwd, vim.api.nvim_buf_get_name(bufnr))
          local file = decoded.files[sail.container_root .. "/" .. rel]
          local diagnostics = {}
          for _, message in ipairs(file and file.messages or {}) do
            table.insert(diagnostics, {
              lnum = type(message.line) == "number" and (message.line - 1) or 0,
              col = 0,
              message = message.message,
              source = "phpstan",
              code = message.identifier,
            })
          end
          return diagnostics
        end,
      }
      opts.linters = opts.linters or {}
      opts.linters.sail_phpstan = linter
      opts.linters_by_ft = opts.linters_by_ft or {}
      -- replaces the php extra's host phpcs
      opts.linters_by_ft.php = { "sail_phpstan" }
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      local sail = require("util.sail")
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.blade = { "blade-formatter", "rustywind" }
      -- replaces the php extra's host php_cs_fixer; container start-up is slow
      opts.formatters_by_ft.php = { "pint", timeout_ms = 10000 }
      opts.formatters = opts.formatters or {}
      opts.formatters.injected = { options = { ignore_errors = true } }
      -- The project's vendor/bin/pint in the container. Projects without
      -- Sail and Pint fall back to the LSP formatter. When Sail is down the
      -- command is `true`, so saving leaves the file alone instead of
      -- erroring or falling back to intelephense's style.
      opts.formatters.pint = {
        meta = {
          url = "https://github.com/laravel/pint",
          description = "Laravel Pint, run in the project's Sail container.",
        },
        condition = function(_, ctx)
          local root = sail.root(ctx.filename)
          return root ~= nil and sail.has_bin(root, "pint")
        end,
        cwd = function(_, ctx)
          return sail.root(ctx.filename)
        end,
        require_cwd = true,
        command = function(_, ctx)
          local root = sail.root(ctx.filename)
          if root and sail.running(root) then
            return root .. "/vendor/bin/sail"
          end
          if root then
            sail.warn_down(root, "pint")
          end
          return "true"
        end,
        args = { "bin", "pint", "$RELATIVE_FILEPATH" },
        stdin = false,
      }
    end,
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
