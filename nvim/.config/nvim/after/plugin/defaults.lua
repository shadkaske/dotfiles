-- Options
vim.opt.timeoutlen = 300

vim.opt.relativenumber = true

vim.opt.scrolloff = 8

-- Background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Keymaps
local map = vim.keymap.set
local default_options = { silent = true }

-- Colon Add
map("i", ";;", "<C-o><S-a>;")
map("n", ";;", "<S-a>;<esc>")

-- Control S to save, because I'm lazy
map("i", "<C-s>", "<C-o>:write<cr>")
map("n", "<C-s>", "<cmd>write<cr>")

-- Find Files
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", default_options)

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", default_options)
map("n", "<S-TAB>", ":bprev<CR>", default_options)

-- Add line above or below without insert mode
map("n", "[o", "o<esc>", default_options)
map("n", "]o", "O<esc>", default_options)

-- Move lines in visual line mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle for up and down
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Paste without overwritting the register
map("x", "<leader>p", '"_dP', { desc = "[P]aste Over" })

-- Copy to system Clipboard
map("v", "<leader>y", '"+y', { desc = "[Y]ank to Clipboard" })

-- Yank to end of line
map("n", "Y", "y$")

-- Close Buffer
map("n", "<C-q>", ":Bdelete<cr>", { desc = "Close Buffer" })

-- Load Custom Plugin Configs
-- which key maps
require("config.whichkey")

-- bufferline config
require("config.bufferline")

-- null-ls config
-- require("config.null-ls")

-- toggleterm config
require("config.toggleterm")

-- Import my autocmds
require("autocmd")

-- Import Custom functions
-- require("functions")

-- Import NeoGit Config
require("config.neogit")

-- Import Lightspeed Settings
require("config.lightspeed")

-- Import Dap Configuration
-- require("config.dap")

-- Load ColorScheme
require("onedark").setup({
  style = "darker",
})
vim.cmd [[colorscheme onedark]]
