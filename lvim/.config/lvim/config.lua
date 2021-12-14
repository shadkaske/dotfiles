-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

vim.o.scrolloff = 4
vim.o.relativenumber = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode[";;"] = "A;<ESC>"
lvim.keys.normal_mode["<Tab>"] = ":bnext<cr>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprev<cr>"
lvim.keys.insert_mode[";;"] = "<C-o>A;"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}
lvim.builtin.which_key.mappings["j"] = {
  name = "+Jumps",
  c = { "<cmd>HopChar2<cr>", "Hop 2 Char"},
  w = { "<cmd>HopWord<cr>", "Hop Word" },
  l = { "<cmd>HopLine<cr>", "Hop Line"  },
}

-- Dashboard
lvim.builtin.dashboard.active = false

-- NvimTree Settings
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- ToggleTerm Settings

-- local Terminal  = require('toggleterm.terminal').Terminal
-- local bottomTerm = Terminal:new({ hidden = true, direction = "horizontal"})

-- function _BottomTerm_toggle()
--   bottomTerm:toggle()
-- end

lvim.builtin.terminal.active = true
-- lvim.builtin.which_key.mappings["'"] = { "<cmd>lua _BottomTerm_toggle()<cr>", "Terminal" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "php",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Debug Adapter
lvim.builtin.dap.active = true

-- local dap = require('dap')

-- dap.adapters.php = {
--   type = 'executable',
--   command = 'node',
--   args = { '/home/shadkaske/.config/lvim/vscode-php-debug/out/phpDebug.js' }
-- }

-- dap.configurations.php = {
--   {
--     type = 'php',
--     request = 'launch',
--     name = 'Xdebug on Homestead',
--     port = 9003
--   }
-- }

-- generic LSP settings

-- Additional Plugins
lvim.plugins = {
  {"phaazon/hop.nvim",
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require"hop".setup { keys = "etovxqpdygfblzhckisuran" }
    end
  },
  {"blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "sandwich"}
    end
  },
}

-- Plugin Settings

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal expandtab ts=2 sw=2" },
  { "BufWinEnter", "*.php", "setlocal expandtab ts=4 sw=4" },
}

