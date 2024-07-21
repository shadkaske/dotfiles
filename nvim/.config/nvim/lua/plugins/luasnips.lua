return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  event = 'BufReadPre',
  opt = {},
  init = function()
    require('luasnip.loaders.from_lua').load './luasnippets'
  end,
  config = function()
    local ls = require 'luasnip'
    local types = require 'luasnip.util.types'

    ls.config.set_config {
      history = true,
      updateevents = 'TextChanged, TextChangedI',
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { '<-', 'Choice' } },
          },
        },
      },
    }

    vim.keymap.set({ 'i' }, '<C-Y>', function()
      ls.expand()
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-L>', function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-H>', function()
      ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-E>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end,
}
