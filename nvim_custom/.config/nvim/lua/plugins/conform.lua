return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "zapling/mason-conform.nvim" },
    },
    event = { "BufWritePre" },
    cmd = { "ConformInfo", "Format" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "Format Code",
      },
    },
    config = function()
      -- Set Conform
      require("conform").setup({
        formatters_by_ft = {
          blade = { "blade-formatter" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          lua = { "stylua" },
          php = { "pint" },
          python = { "black" },
          yml = { "yamlfmt" },
        },
        default_format_opts = {
          lsp_format = "fallback",
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })

      -- Set up mason-conform
      require("mason-conform").setup({ automatic_installation = true })

      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      -- Set up Format User Command
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true })
    end,
  },
}
