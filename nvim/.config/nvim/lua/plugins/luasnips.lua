return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  lazy = true,
  dependencies = {
    {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
  },
  opts = {
    history = true,
    delete_check_events = 'TextChanged',
    updateevents = 'TextChanged, TextChangedI',
  },
  init = function()
    require('luasnip.loaders.from_lua').load './luasnippets'
  end,
}
