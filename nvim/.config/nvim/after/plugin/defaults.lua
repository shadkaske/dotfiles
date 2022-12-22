-- Load Custom Plugin Configs
-- which key maps
require("config.whichkey")

-- bufferline config
require("config.bufferline")

-- null-ls config
require("config.null-ls")

-- toggleterm config
require("config.toggleterm")

-- Import my autocmds
require("autocmd")

-- Import Custom functions
-- require("functions")

-- Import NeoGit Config
require("config.neogit")

-- Import Autopairs
require("config.autopairs")

-- Import Nvim Tree
require("config.nvim-tree")

-- Import Lightspeed Settings
require("config.lightspeed")

-- Import nvim-surround
require("config.nvim-surround")

-- Import Comment Settings
require("config.comment")

-- Import Indent Blanklines
require("indent_blankline")

-- Import GitSigns Config
require("gitsigns")

-- Import GitSigns Config
require("gitsigns")

-- Import GitSigns Config
require("config.treesitter")

-- Import Dap Configuration
-- require("config.dap")

-- Load ColorScheme
local onedark_ok, onedark = pcall(require, "onedark")
if not onedark_ok then
  return
else
  require("onedark").setup({
    style = "darker",
  })

  onedark.load()
end
