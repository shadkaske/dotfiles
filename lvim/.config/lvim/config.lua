-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "onedarker"

-- My preferred settings
local gblopt = vim.o
-- local buf = vim.bo
-- local win = vim.wo
gblopt.relativenumber = true
gblopt.number = true
gblopt.scrolloff = 3
gblopt.colorcolumn = "80,120"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- TmuxNavigator
lvim.keys.normal_mode["<C-h>"] = ":lua require('Navigator').left()<cr>"
lvim.keys.normal_mode["<C-k>"] = ":lua require('Navigator').up()<cr>"
lvim.keys.normal_mode["<C-l>"] = ":lua require('Navigator').right()<cr>"
lvim.keys.normal_mode["<C-j>"] = ":lua require('Navigator').down()<cr>"
-- lvim.keys.normal_mode["<C-p>"] = ":lua require('Navigator').previous()<cr>"

-- Telescope
lvim.keys.normal_mode["<C-p>"] = "<cmd>Telescope git_files<CR>"

-- Float Term
local map = vim.api.nvim_set_keymap
local keyopts = { noremap = true, silent = true }

map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<cr>', keyopts)
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', keyopts)

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
--   -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-n>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-p>"] = actions.move_selection_previous
end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }
lvim.builtin.which_key.mappings.g.n = {"<cmd>Neogit<cr>", "Neogit"}
lvim.builtin.which_key.mappings["."] = { "<cmd>nohlsearch<cr>", "No Highlight"}
lvim.builtin.which_key.mappings["h"] = {
  name = "+Hop",
  w = { "<cmd>HopWord<cr>", "Word"},
  c = { "<cmd>HopChar2<cr>", "2 Char"},
  l = { "<cmd>HopLine<cr>", "Line"}
}

-- TODO: User Config for predefined plugins
lvim.plugins = {
  {
    'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup()
    end
  },
  {
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  },
  -- {
  --   'lukas-reineke/indent-blankline.nvim'
  -- },
  {
    'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'
  },
  {
    'jghauser/mkdir.nvim',
    config = function()
      require('mkdir')
    end
  },
  {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  {
    "glepnir/indent-guides.nvim"
  },
  {
    "norcalli/nvim-colorizer.lua"
  },
  {
    "shadkaske/vim-blade"
  },
  {
    "sainnhe/edge"
  },
  {
    "tomasiser/vim-code-dark"
  }
}

require('Navigator').setup({
    auto_save = 'current',
    disable_on_zoom = true
})

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=2 sw=2 expandtab" },
  { "BufWinEnter", "*.php", "setlocal ts=4 sw=4 expandtab" },
}
