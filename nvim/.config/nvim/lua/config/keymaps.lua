-- Don't Override Leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Insert Mode Shortcuts
vim.keymap.set('i', '<A-e>', '<C-o>$', { silent = true })
vim.keymap.set('i', '<A-;>', '<C-o>A;<ESC>', { silent = true })
vim.keymap.set('i', '<A-,>', '<C-o>A,<ESC>', { silent = true })
vim.keymap.set('n', '<A-;>', 'A;<ESC>', { silent = true })
vim.keymap.set('n', '<A-,>', 'A,<ESC>', { silent = true })

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

-- [F]ile Keymaps
vim.keymap.set('n', '<leader>nf', '<cmd>enew<cr>', { desc = 'New File' })

-- Insert Lines in Normal Mode
vim.keymap.set('n', '[o', 'O<ESC>')
vim.keymap.set('n', ']o', 'o<ESC>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- yank Prefix
vim.keymap.set({ 'n', 'v' }, '<leader>yo', '"_dP', { desc = 'Paste Over' })
vim.keymap.set({ 'n', 'v' }, '<leader>yp', '"+p', { desc = 'Paste System' })
vim.keymap.set({ 'n', 'v' }, '<leader>yy', '"+y', { desc = 'Yank to System' })
vim.keymap.set({ 'n', 'v' }, '<leader>yd', '"+d', { desc = 'Delete to System' })

-- b Prefix
vim.keymap.set({ 'n' }, '<leader>br', '<cmd>e %<cr>', { desc = 'Reload Buffer' })
vim.keymap.set({ 'n' }, '<leader>bn', '<cmd>bn<cr>', { desc = 'Next Buffer' })
vim.keymap.set({ 'n' }, '<leader>bp', '<cmd>bp<cr>', { desc = 'Prev Buffer' })
vim.keymap.set({ 'n' }, '<leader>bw', '<cmd>bd<cr>', { desc = ' Close Buffer and Window' })

-- q Prefix
vim.keymap.set({ 'n', 'v' }, '<leader>qq', '<cmd>cclose<cr>', { desc = 'Close QuickFix' })

-- Buffer related
vim.keymap.set('n', '<leader>ba', '<cmd>bufdo bd<cr>', { desc = 'Close All Buffers' })

-- terminal mode maps
vim.keymap.set('t', '<C-n>', [[<C-\><C-n>]], { noremap = true })

-- Window Keymaps for leader
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Close Window' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Only Window' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split Window Down' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split Window Right' })
