-- Options
vim.opt.timeoutlen = 300

vim.opt.relativenumber = true

vim.opt.scrolloff = 4

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 350
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
-- vim.opt.completeopt = { "menu" , "menuone" , "noselect", "noinsert" }

-- Split Options
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.opt.expandtab = true

-- No Wrap
vim.opt.wrap = false

-- No SwapFile
vim.opt.swapfile = false

-- show matching parens
vim.opt.showmatch  = true

-- highlight cursorline
vim.opt.cursorline = true

-- Set Hidden
vim.opt.hidden = true

vim.opt.shortmess:append("c")
vim.opt.encoding = "utf-8"
