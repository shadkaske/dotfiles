require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-t]],
  hide_numbers = true,
  shade_terminals = true,
  float_opts = {
    border = 'single',
  },
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Lazygit Terminal
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float"
})

function _lazygit_toggle()
  lazygit:toggle()
end

-- Tinker Terminal
local tinker = Terminal:new({
  cmd = "php artisan tinker",
  hidden = true,
})

function _tinker_here()
  tinker:toggle()
end

-- Yarn Watch Terminal
local yarn_watch = Terminal:new({
  cmd = "yarn run watch",
  hidden = true,
})

function _yarn_watch()
  yarn_watch:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua _tinker_here()<cr>", {noremap = true, silent = true, desc = "Tinker Here"})
vim.api.nvim_set_keymap("n", "<leader>yw", "<cmd>lua _yarn_watch()<cr>", {noremap = true, silent = true, desc = "Yarn Run Watch"})
vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<cr>", {noremap = true, silent = true, desc = "LazyGit"})

