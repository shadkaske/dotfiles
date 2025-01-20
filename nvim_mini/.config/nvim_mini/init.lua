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

add({
    source = 'williamboman/mason.nvim',
    depends = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'nvimtools/none-ls.nvim',
    }
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
  require('smart-splits').setup()

  -- resizing splits
  vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
  vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
  vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
  vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
  -- moving between splits
  vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
  vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
  vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
  vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
  -- swapping buffers between windows
  vim.keymap.set('n', '<leader>bsh', require('smart-splits').swap_buf_left, { desc = 'Swap Buffer Left' })
  vim.keymap.set('n', '<leader>bsj', require('smart-splits').swap_buf_down, { desc = 'Swap Buffer Down' })
  vim.keymap.set('n', '<leader>bsk', require('smart-splits').swap_buf_up, { desc = 'Swap Buffer Up' })
  vim.keymap.set('n', '<leader>bsl', require('smart-splits').swap_buf_right, { desc = 'Swap Buffer Right' })
  -- terminal mode
  vim.keymap.set('t', '<C-h>', require('smart-splits').move_cursor_left)
  vim.keymap.set('t', '<C-j>', require('smart-splits').move_cursor_down)
  vim.keymap.set('t', '<C-k>', require('smart-splits').move_cursor_up)
  vim.keymap.set('t', '<C-l>', require('smart-splits').move_cursor_right)
end)


-- Plugins to Load Later
later(function() require('mini.surround').setup() end)
later(function() require('mini.pick').setup() end)
later(function() require('mini.ai').setup() end)
later(function() require('mini.animate').setup() end)
later(function() require('mini.bracketed').setup() end)
later(function()
  require('mini.trailspace').setup()
  vim.api.nvim_create_autocmd({ 'BufWritePre' }, { pattern = { '*' }, command = [[lua MiniTrailspace.trim()]] })
end)
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
-- LSP
later(function()
  require('mason').setup()

  require('mason-lspconfig').setup({
    ensure_installed = {
      'lua_ls',
      'intelephense',
      'blade-formatter',
      'ansible-language-server',
      'ansible-lint',
      'stylua'
    },
  })

  local null_ls = require('null-ls')
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.completion.spell,
    }
  })
end)

-- Telescope
later(function()
  local theme = require('telescope.themes').get_ivy()
  local theme_string = 'ivy'
  local builtin = require('telescope.builtin')

  require('telescope').setup({
      defaults = {
        prompt_prefix = ' 󰭎  ',
        selection_caret = '  ',
        -- sorting_strategy = 'descending',
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            width = 0.4,
            height = 0.35,
          },
        },
        file_ignore_patterns = { 'node_modules' },
        path_display = { 'truncate' },
        set_env = { ['COLORTERM'] = 'truecolor' },
        mappings = {
          n = {
            ['<M-p>'] = require('telescope.actions.layout').toggle_preview,
          },
          i = {
            ['<M-p>'] = require('telescope.actions.layout').toggle_preview,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--iglob', '!.git', '--iglob', '!node_modules', '--iglob', '!vendor', '--hidden' },
        },
        grep_string = {
          additional_args = { '--hidden' },
        },
        live_grep = {
          additional_args = { '--hidden' },
        },
        buffers = {
          mappings = {
            i = {
              ['<M-d>'] = require('telescope.actions').delete_buffer + require('telescope.actions').move_to_top,
            },
          },
        },
      },
  })

  -- Telescope Keymaps
  vim.keymap.set('n', '<C-g>',function() builtin.live_grep(theme) end, { desc = 'Telescope Live Grep'  })
  vim.keymap.set('n', '<leader>bf',function() builtin.buffers(theme) end, { desc = 'Buffers'  })
  vim.keymap.set('n', '<leader>cS',function() builtin.lsp_dynamic_workspace_symbols(theme) end, { desc = 'Workspace Symbols'  })
  vim.keymap.set('n', '<leader>cd',function() builtin.diagnostics(theme) end, { desc = 'Buffer Diagnostics'  })
  vim.keymap.set('n', '<leader>cs',function() builtin.lsp_document_symbols(theme) end, { desc = 'Document Symbols'  })
  vim.keymap.set('n', '<leader>cw',function() builtin.diagnostics(theme) end, { desc = 'Diagnostics'  })
  vim.keymap.set('n', '<leader>cu',function() builtin.lsp_references(theme) end, { desc = 'References ( Usage )'  })
  vim.keymap.set('n', '<leader>fa',function() builtin.find_files(theme, { hidden = true, no_ignore = true }) end, { desc = 'Find All Files'  })
  vim.keymap.set('n', '<leader><Space>',function() builtin.find_files(theme, { hidden = true, no_ignore = true }) end, { desc = 'Find All Files'  })
  vim.keymap.set('n', '<leader>fb',function() builtin.buffers(theme) end, { desc = 'Buffers'  })
  vim.keymap.set('n', '<leader>fc',function() builtin.registers(theme) end, { desc = 'Clipboard Registers'  })
  vim.keymap.set('n', '<leader>fd',function() builtin.diagnostics(theme) end, { desc = 'Diagnostics'  })
  vim.keymap.set('n', '<leader>ff',function() builtin.find_files(theme) end, { desc = 'Files'  })
  vim.keymap.set('n', '<leader>fg',function() builtin.live_grep(theme) end, { desc = 'Live Grep'  })
  vim.keymap.set('n', '<leader>fh',function() builtin.help_tags(theme) end, { desc = 'Help'  })
  vim.keymap.set('n', '<leader>fk',function() builtin.keymaps(theme) end, { desc = 'Keymaps'  })
  vim.keymap.set('n', '<leader>fr',function() builtin.oldfiles(theme) end, { desc = 'Recent Files'  })
  vim.keymap.set('v', '<leader>fw',function() builtin.grep_string(theme) end, { desc = 'Current Word'  })
  vim.keymap.set('n', '<leader>gC',function() builtin.git_bcommits(theme) end, { desc = 'Checkout commit(for current file)'  })
  vim.keymap.set('n', '<leader>gb',function() builtin.git_branches(theme) end, { desc = 'Checkout Branch'  })
  vim.keymap.set('n', '<leader>go',function() builtin.git_status(theme) end, { desc = 'Open changed file'  })
  vim.keymap.set('n', '<leader>fi', function() builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy { previewer = true, }) end, { desc = 'In Current Buffer' })
end)

later(function() require('plugins.which-key') end)
later(function() require('blink.cmp').setup() end)

-- Options
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = '/usr/bin/python3'

-- Set highlight on search
vim.opt.hlsearch = false

-- Set Cursor Line on
vim.opt.cursorline = true

vim.opt.hidden = true

-- Set Scrolloff
vim.opt.scrolloff = 4

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Set command line height to 0
vim.opt.cmdheight = 0

-- Enable mouse mode
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

-- Keymaps
vim.keymap.set('n', '<leader>bp', ':bp<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>bn', ':bn<cr>', { desc = 'Next Buffer' })
