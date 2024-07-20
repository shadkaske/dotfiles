return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  event = 'BufReadPre',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node

    ls.add_snippets('all', {
      s('req', t 'require'),
      s('reqs', t 'require "'),
    })
  end,
}
