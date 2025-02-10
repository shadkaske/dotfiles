return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    build = "cargo build --release",
    opts = {
      keymap = {
        preset = "default",
        cmdline = {
          preset = "enter",
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      completion = {
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" } },
        list = {
          selection = {
            preselect = function(ctx)
              return ctx.mode ~= "cmdline"
            end,
            auto_insert = function(ctx)
              return ctx.mode ~= "cmdline"
            end,
          },
        },
      },

      signature = { window = { border = "rounded" } },

      sources = {
        default = { "lsp", "path", "snippets", "buffer", "markdown" },
        providers = {
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { "lsp" },
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
