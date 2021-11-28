-- Set Options
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.title = true
vim.opt.scrolloff = 3
vim.opt.shell = os.getenv('SHELL')
vim.opt.laststatus = 2
vim.opt.timeoutlen = 500
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftround = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.wrap = true

-- Completion Clean Up
vim.opt.shortmess:append('c')

-- Turn on AutoRead for Changed files
vim.opt.autoread = true

-- Turn off autocomments
vim.opt.formatoptions:append('cro')

-- Treat dashes as part of word object
vim.opt.iskeyword:append('-')

-- Searching
vim.opt.wildmenu = true
vim.opt.wildmode = 'full'
vim.opt.wildignorecase = true
vim.opt.wildignore:append('*.a','*.o','*.bmp','*.gif','*.ico','*.jpg','*.png','.DS_Store','.git','.hg','.svn')
vim.opt.wildignore:append('*~','*.swp','*.tmp','*/tmp/*','*.so','*.swp','*.zip','*/.git/','*/storage/')

vim.opt.wildoptions = 'pum'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true

-- Turn off Dinging Noises
vim.opt.errorbells = true
vim.opt.visualbell = true

-- Turn off backup files
vim.opt.backup = true
vim.opt.writebackup = true

-- Turn on autoindent
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Set short update time for async processes
vim.opt.updatetime = 300

-- Set Sign Column To Always Show
vim.opt.signcolumn = 'yes'

-- Set cursorline on by default
vim.opt.cursorline = true
