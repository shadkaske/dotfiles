return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = {
      { "saghen/blink.cmp" },
      {
        "williamboman/mason.nvim",
        config = true,
      },
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            { path = "snacks.nvim", words = { "Snacks" } },
          },
        },
      },
    },
    opts = {
      servers = {
        ansiblels = {},
        bashls = {},
        dockerls = {},
        docker_compose_language_service = {},
        jsonls = {},
        marksman = {},
        pyright = {},
        sqlls = {},
        intelephense = {},
        yamlls = {},
        lua_ls = {},
        tailwindcss = {},
      },
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        require("lspconfig")[server].setup(config)
      end

      require("mason").setup()

      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = vim.tbl_keys(opts.servers),
      })
    end,
  },
}
