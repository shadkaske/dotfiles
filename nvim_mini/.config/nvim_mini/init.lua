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
  source = 'saghen/blink.cmp',
  depends = {
    'rafamadriz/friendly-snippets',
    'nvim-lua/plenary.nvim',
  },
  checkout = 'v0.10.0',
})

add({ source = 'mrjones2014/smart-splits.nvim' })

add({
  source = 'nvim-treesitter/nvim-treesitter',
  hooks = {
    post_checkout = function()
      vim.cmd('TSUpdate')
    end },
})

add({
    source = 'williamboman/mason.nvim',
    depends = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'nvimtools/none-ls.nvim',
    }
})

-- Set vim options
now(function()
  vim.g.loaded_ruby_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.python3_host_prog = '/usr/bin/python3'
  vim.opt.hlsearch = false
  vim.opt.cursorline = true
  vim.opt.hidden = true
  vim.opt.scrolloff = 6
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.cmdheight = 0
  vim.opt.mouse = 'a'
  vim.opt.mousemoveevent = true
  vim.opt.wrap = false
  vim.opt.expandtab = true
  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4
  vim.o.clipboard = 'unnamedplus'
  vim.opt.splitbelow = true
  vim.opt.splitright = true
  vim.o.breakindent = true
  vim.o.undofile = true
  vim.o.ignorecase = true
  vim.o.smartcase = true
  vim.o.updatetime = 250
  vim.o.timeout = true
  vim.o.timeoutlen = 250
  vim.o.completeopt = 'menuone,noselect'
  vim.o.termguicolors = true
end)

-- Early Load Plugins
-- Set Color Scheme
now(function()
  vim.cmd.colorscheme 'tokyonight-night'
end)

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

now(function()
  require('mini.sessions').setup({
    autowrite = true,
  })
  vim.keymap.set("n", "<leader>ss", function()
    vim.cmd('wa')
    require('mini.sessions').write()
    require('mini.sessions').select()
  end, { desc = 'Switch Session' })
  vim.keymap.set("n", "<leader>sw", function()
    local cwd = vim.fn.getcwd()
    local last_folder = cwd:match("([^/]+)$")
    require('mini.sessions').write(last_folder)
  end, { desc = 'Save Session' })
  vim.keymap.set("n", "<leader>sf", function()
    vim.cmd('wa')
    require('mini.sessions').select()
  end,
  { desc = 'Load Session' })
end)

now(function()
  require('mini.notify').setup({ window = { config = { border = 'olid' } } })
  vim.notify = MiniNotify.make_notify()
end)

-- Plugins to Load Later
later(function() require('mini.extra').setup() end)

later(function()
  My_starter_custom = function()
    return {
      { name = 'Recent Files', action = function() require('mini.extra').pickers.oldfiles() end, section = 'Search' },
      { name = 'Session',      action = function() require('mini.sessions').select() end,        section = 'Search' },
    }
  end

  local starter = require('mini.starter')
  starter.setup({
    autoopen = true,
    items = {
      My_starter_custom(),
      starter.sections.recent_files(5, false, false),
      starter.sections.recent_files(5, true, false),
      starter.sections.sessions(5, true),
      starter.sections.builtin_actions(),
    },
    header = [[
                                              
       ███████████           █████      ██
      ███████████             █████ 
      ████████████████ ███████████ ███   ███████
     ████████████████ ████████████ █████ ██████████████
    ██████████████    █████████████ █████ █████ ████ █████
  ██████████████████████████████████ █████ █████ ████ █████
 ██████  ███ █████████████████ ████ █████ █████ ████ ██████
        ]]
  })
  MiniStarter.open()
end)

later(function() require('mini.basics').setup() end)
later(function() require('mini.icons').setup() end)
later(function()
  local animate = require("mini.animate")
  animate.setup({
    scroll = {
      enable = false,
    },
    cursor = {
      timing = animate.gen_timing.cubic({ duration = 50, unit = "total" }),
    },
  })
end)
later(function() require('mini.statusline').setup() end)
later(function() require('mini.surround').setup() end)
later(function()
  local picker = require('mini.pick')
  picker.setup()
  vim.ui.select = MiniPick.ui_select
  local builtin = picker.builtin

  MiniPick.registry.registry = function()
    local items = vim.tbl_keys(MiniPick.registry)
    table.sort(items)
    local source = {items = items, name = 'Registry', choose = function() end}
    local chosen_picker_name = MiniPick.start({ source = source })
    if chosen_picker_name == nil then return end
    return MiniPick.registry[chosen_picker_name]()
  end

  vim.keymap.set('n', '<C-g>',function() builtin.grep_live() end, { desc = 'Live Grep'  })
  vim.keymap.set('n', '<leader>bf',function() builtin.buffers() end, { desc = 'Buffers'  })
  -- vim.keymap.set('n', '<leader>cS',function() builtin.lsp_dynamic_workspace_symbols(theme) end, { desc = 'Workspace Symbols'  })
  -- vim.keymap.set('n', '<leader>cd',function() builtin.diagnostics(theme) end, { desc = 'Buffer Diagnostics'  })
  vim.keymap.set('n', '<leader>cs', "<cmd>Pick lsp scope='document_symbol'<cr>", { desc = 'Document Symbols'  })
  -- vim.keymap.set('n', '<leader>cw',function() builtin.diagnostics(theme) end, { desc = 'Diagnostics'  })
  -- vim.keymap.set('n', '<leader>cu',function() builtin.lsp_references(theme) end, { desc = 'References ( Usage )'  })
  -- vim.keymap.set('n', '<leader>fa',function() builtin.find_files(theme, { hidden = true, no_ignore = true }) end, { desc = 'Find All Files'  })
  vim.keymap.set('n', '<leader><Space>',function() builtin.files() end, { desc = 'Find All Files'  })
  vim.keymap.set('n', '<leader>fb',function() builtin.buffers() end, { desc = 'Buffers'  })
  vim.keymap.set('n', '<leader>fc', "<cmd>Pick registers<cr>", { desc = 'Clipboard Registers'  })
  -- vim.keymap.set('n', '<leader>fd',function() builtin.diagnostics(theme) end, { desc = 'Diagnostics'  })
  -- vim.keymap.set('n', '<leader>ff',function() builtin.find_files(theme) end, { desc = 'Files'  })
  -- vim.keymap.set('n', '<leader>fg',function() builtin.live_grep(theme) end, { desc = 'Live Grep'  })
  vim.keymap.set('n', '<leader>fh',function() builtin.help() end, { desc = 'Help'  })
  -- vim.keymap.set('n', '<leader>fk',function() builtin.keymaps(theme) end, { desc = 'Keymaps'  })
  -- vim.keymap.set('n', '<leader>fr',function() builtin.oldfiles(theme) end, { desc = 'Recent Files'  })
  -- vim.keymap.set('v', '<leader>fw',function() builtin.grep_string(theme) end, { desc = 'Current Word'  })
  -- vim.keymap.set('n', '<leader>gC',function() builtin.git_bcommits(theme) end, { desc = 'Checkout commit(for current file)'  })
  -- vim.keymap.set('n', '<leader>gb',function() builtin.git_branches(theme) end, { desc = 'Checkout Branch'  })
  -- vim.keymap.set('n', '<leader>go',function() builtin.git_status(theme) end, { desc = 'Open changed file'  })
  -- vim.keymap.set('n', '<leader>fi', function() builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy { previewer = true, }) end, { desc = 'In Current Buffer' })
end)
later(function() require('mini.ai').setup() end)
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

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesWindowOpen',
    callback = function(args)
      local win_id = args.data.win_id

      -- Customize window-local settings
      vim.wo[win_id].winblend = 50
      local config = vim.api.nvim_win_get_config(win_id)
      config.border, config.title_pos = 'rounded', 'left'
      vim.api.nvim_win_set_config(win_id, config)
    end,
  })
  vim.keymap.set('n', '-', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, { desc = 'Explore Current Buffers Directory' })
  vim.keymap.set('n', '<leader>-', function() MiniFiles.open(nil, false) end, { desc = 'Explore Current Working Directory' })
end)
later(function() require('mini.git').setup() end)
later(function() require('mini.diff').setup() end)
later(function() require('mini.indentscope').setup() end)
later(function() require('mini.jump').setup() end)
later(function() require('mini.comment').setup() end)
later(function()
  require('mini.jump2d').setup()
  vim.keymap.set('n', '<leader>j', function() MiniJump2d.start() end, { desc = 'Jump' })
end)
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
later(function() require('mini.operators').setup() end)
later(function() require('mini.pairs').setup() end)

later(function()
  local miniclue = require('mini.clue')
  miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

    { mode = "n", keys = "\\" },

    -- Built-in completion
    { mode = "i", keys = "<C-x>" },

    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    -- Window commands
    { mode = "n", keys = "<C-w>" },

    -- `z` key
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },
  },

  clues = {
    { mode = "n", keys = "<Leader>b", desc = " Buffer" },
    { mode = "n", keys = "<Leader>f", desc = " Find" },
    { mode = "n", keys = "<Leader>g", desc = "󰊢 Git" },
    { mode = "n", keys = "<Leader>i", desc = "󰏪 Insert" },
    { mode = "n", keys = "<Leader>c", desc = "󰘦 Code" },
    { mode = "n", keys = "<Leader>m", desc = " Mini" },
    { mode = "n", keys = "<Leader>q", desc = " NVim" },
    { mode = "n", keys = "<Leader>s", desc = "󰆓 Session" },
    { mode = "n", keys = "<Leader>u", desc = "󰔃 UI" },
    { mode = "n", keys = "<Leader>w", desc = " Window" },
    require("mini.clue").gen_clues.g(),
    require("mini.clue").gen_clues.builtin_completion(),
    require("mini.clue").gen_clues.marks(),
    require("mini.clue").gen_clues.registers(),
    require("mini.clue").gen_clues.windows(),
    require("mini.clue").gen_clues.z(),
  },
  window = {
    delay = 300,
  },
})
end)

-- Larger Plugin Configs

-- Treesitter
later(function() require('plugins.treesitter') end)

-- LSP
later(function()
  local mason = require('mason')

  local mason_lspconfig = require('mason-lspconfig')

  mason.setup()

  mason_lspconfig.setup({
    ensure_installed = {
      'lua_ls',
      'intelephense',
      -- 'blade-formatter',
      -- 'ansible-language-server',
      -- 'ansible-lint',
      -- 'stylua'
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
later(function() require('blink.cmp').setup() end)

-- Keymaps
vim.keymap.set('n', '<leader>bp', ':bp<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>bn', ':bn<cr>', { desc = 'Next Buffer' })

-- Save buffer with C-s
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Visual Indent Lines
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- commenting
vim.keymap.set('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
vim.keymap.set('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- Center view on jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
