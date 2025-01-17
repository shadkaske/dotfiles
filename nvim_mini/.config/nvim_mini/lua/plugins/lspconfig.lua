require('mason').setup()
require('mason-lspconfig').setup()

-- Lua
require('lspconfig').lua_ls.setup {}

-- Folke LazyDev
require('lazydev').setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})
