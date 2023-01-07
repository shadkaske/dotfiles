local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_lspconfig_ok then
  return
end

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = {
  "tsserver",
  "sumneko_lua",
  "ansiblels",
  "bashls",
  "eslint",
  "html",
  "jsonls",
  "intelephense",
  "marksman",
  "pyright",
  "tailwindcss",
  "vuels",
  "yamlls",
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
mason_lspconfig.setup({
  ensure_installed = servers,
})

for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
