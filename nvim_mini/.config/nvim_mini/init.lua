vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Disable Netrw before loading plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Add Plugins
add({
  source = 'folke/tokyonight.nvim',
})

add({
  source = 'nvim-telescope/telescope.nvim',
  depends = { 'nvim-lua/plenary.nvim' },
})

add({
  source = 'saghen/blink.cmp',
  depends = {
    'rafamadriz/friendly-snippets',
  },
  checkout = 'v0.10.0',
})

add({ source = 'folke/which-key.nvim' })

add({ source = 'mrjones2014/smart-splits.nvim' })

add({
  source = 'nvim-treesitter/nvim-treesitter',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})

-- Set Color Scheme
now(function()
  vim.cmd.colorscheme 'tokyonight-night'
end)

-- Plugins to Load Early
now(function() require('mini.animate').setup() end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.basics').setup() end)
now(function() require('mini.icons').setup() end)
now(function() require('mini.starter').setup() end)
now(function() require('mini.sessions').setup() end)
now(function()
  require('mini.trailspace').setup()
  vim.api.nvim_create_autocmd({ 'BufWritePre' }, { pattern = { '*' }, command = [[lua MiniTrailspace.trim()]] })
end)

-- Plugins to Load Later
later(function() require('mini.surround').setup() end)
later(function() require('mini.pick').setup() end)
later(function() require('mini.ai').setup() end)
later(function() require('mini.animate').setup() end)
later(function() require('mini.bracketed').setup() end)
later(function() require('mini.bufremove').setup() end)
later(function()
  require('mini.bufremove').setup()
  vim.keymap.set('n', '<leader>bd', function() MiniBufremove.delete() end, { desc = 'Delete Current Buffer' })
end)
later(function()
  require('mini.files').setup()
  vim.keymap.set('n', '-', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, { desc = 'Explore Current Buffers Directory' })
  vim.keymap.set('n', '<leader>-', function() MiniFiles.open(nil, false) end, { desc = 'Explore Current Working Directory' })
end)
later(function() require('mini.git').setup() end)
later(function() require('mini.diff').setup() end)
-- TODO: Can we make the indent line ( hl group ) tranlucent
later(function() require('mini.indentscope').setup() end)
later(function() require('mini.jump').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.jump2d').setup() end)
later(function()
  require('mini.move').setup({
    mappings = {
      left = '<M-S-h>',
      right = '<M-S-l>',
      down = '<M-S-j>',
      up = '<M-S-k>',

      line_left = '<M-S-h>',
      line_right = '<M-S-l>',
      line_down = '<M-S-j>',
      line_up = '<M-S-k>',
    },
  })
end)
later(function() require('mini.notify').setup() end)
later(function() require('mini.operators').setup() end)
later(function() require('mini.pairs').setup() end)
later(function() require('mini.pick').setup() end)

-- Larger Plugin Configs
later(function() require('plugins.telescope') end)
later(function() require('plugins.smart-splits') end)

-- Options
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Keymaps
