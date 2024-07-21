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

ls.add_snippets('php', {
  s(
    'func',
    fmt(
      [[
    {}function {}({}){}
    {{
      return {};
    }}
    ]],
      {
        c(1, { t 'public ', t 'protected ', t 'private ', t '' }),
        i(2, 'funcName'),
        i(3),
        c(4, { t ': void', t '' }),
        i(0),
      }
    )
  ),
  s(
    'attrib',
    fmt(
      [[
    protected function {}(): Attribute
    {{
        return Attribute::make(
            get: fn (string $value{}) => {},
            {}{}
        );
    }}
    ]],
      {
        i(1, 'attribName'),
        c(2, { t ', array $attributes', t '' }),
        i(3),
        c(4, { t 'set: fn (string $value) => ,', t '' }),
        i(0),
      }
    )
  ),
  s('scope', fmt('public function scope{}(Builder $query): void\n{{\t$query->{}\n}}', { i(1, 'Name'), i(0) })),
})
