-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete some built in keymaps
vim.keymap.del("n", "<leader>l")

-- Smart Splits
-- resizing splits
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
-- Buffers
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous" })
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next" })

-- swapping buffers between windows
vim.keymap.set("n", "<leader>bsh", require("smart-splits").swap_buf_left, { desc = "Swap Buffer Left" })
vim.keymap.set("n", "<leader>bsj", require("smart-splits").swap_buf_down, { desc = "Swap Buffer Down" })
vim.keymap.set("n", "<leader>bsk", require("smart-splits").swap_buf_up, { desc = "Swap Buffer Up" })
vim.keymap.set("n", "<leader>bsl", require("smart-splits").swap_buf_right, { desc = "Swap Buffer Right" })
-- terminal mode
vim.keymap.set("t", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("t", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("t", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("t", "<C-l>", require("smart-splits").move_cursor_right)

-- Move Lines
vim.keymap.set("n", "<A-S-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-S-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-S-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-S-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Line Ending Shortcuts
vim.keymap.set("i", "<A-e>", "<C-o>$", { silent = true })
vim.keymap.set("i", "<A-;>", "<C-o>A;<ESC>", { silent = true })
vim.keymap.set("i", "<A-,>", "<C-o>A,<ESC>", { silent = true })
vim.keymap.set("n", "<A-;>", "A;<ESC>", { silent = true })
vim.keymap.set("n", "<A-,>", "A,<ESC>", { silent = true })

-- Center view on jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Close all open buffers
vim.keymap.set("n", "<leader>ba", function()
  Snacks.bufdelete.all()
end, { desc = "Close all Buffers" })
-- Ansible Keymaps @ leader t
vim.keymap.set("n", "<leader>te", "<cmd>!ansible-vault encrypt %<cr>", { desc = "Ansible Vault Encrypt File" })
vim.keymap.set("n", "<leader>td", "<cmd>!ansible-vault decrypt %<cr>", { desc = "Ansible Vault Encrypt File" })

vim.keymap.set("n", "<leader><Space>", function()
  local options = {
    finder = "files",
    format = "file",
    show_empty = true,
    hidden = true,
    ignored = true,
    follow = false,
    supports_live = true,
  }
  Snacks.picker.files(options)
end, { desc = "All Files Picker" })

vim.keymap.set("n", "<leader>e", function()
  Snacks.explorer({
    hidden = true,
    ignored = true,
    supports_live = true,
    auto_close = true,
  })
end, { desc = "File Explorer" })
