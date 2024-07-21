local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local c = ls.choice_node
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node

ls.add_snippets('all', {
  s('date', t(os.date '%A, %b %d %Y')),
})
