-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
  -- Package manager
  use("wbthomason/packer.nvim")

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, "plugins")
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require("packer").sync()
  end
end)

-- Bootstrap Message
if is_bootstrap then
  print("==================================")
  print("    Plugins are being installed")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")
  return
end

-- Load Editor options
require("options")

-- Load Key Mappings
require("keymaps")

-- Import my autocmds
require("autocmd")

-- Import Custom functions
-- require("functions")

local function require_all_files(required)
  local directory = vim.fn.stdpath("config") .. "/lua/" .. required

  for _, file in pairs(vim.fn.readdir(directory)) do
    require(required .. "." .. file:match("(.+)%..+$"))
  end
end

-- Loop through the files in lua/config to load plugin settings
local config_dirs = { "config", "lsp" }

for _, dir in pairs(config_dirs) do
  require_all_files(dir)
end

-- Load ColorScheme
-- To set up additional color themes, install in plugins.lua and add a name
--  lua config file in lua/colors and update the require statement below
require("colors.onedark")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
