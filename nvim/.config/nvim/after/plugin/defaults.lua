-- Load Custom Plugin Configs

-- Loop through the files in lua/config to load plugin settings
local configs_dir = vim.fn.stdpath("config") .. "/lua/config"

for _, file in pairs(vim.fn.readdir(configs_dir)) do
  if vim.fn.filereadable(file) then
    require("config." .. file:match("(.+)%..+$"))
  end
end

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
