-- [[ Basic Keymaps ]]
local map = vim.keymap.set
local default_options = { silent = true, noremap = true }

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Colon Add
map("n", ";;", "<S-a>;<esc>")

-- Control S to save, because I'm lazy
map("i", "<C-s>", "<C-o>:write<cr>")
map("n", "<C-s>", "<cmd>write<cr>")

-- Find Files
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", default_options)

-- Don't jump when using *
map("n", "*", "*<C-o>", default_options)

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

-- Reselect visual block after indent/outdent
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- Paste without overwritting the register
map("x", "<leader>p", '"_dP', { desc = "[P]aste Over" })

-- Copy to system Clipboard
map("v", "<leader>y", '"+y', { desc = "[Y]ank to Clipboard" })

-- Yank to end of line
map("n", "Y", "y$")

-- Close Buffer
map("n", "<C-q>", ":Bdelete<cr>", { desc = "Close Buffer" })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
