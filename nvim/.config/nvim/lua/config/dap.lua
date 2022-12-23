local dap_ok, dap = pcall(require, "dap")

if not dap_ok then
  return
end

require("dapui").setup()

require("nvim-dap-virtual-text").setup({})

-- Install php debug adapter
local php_debug_path = vim.fn.stdpath("data") .. "/debuggers/vscode-php-debug/"

if vim.fn.empty(vim.fn.glob(php_debug_path)) > 0 then
  print("Installing vscode php adapter...")
  vim.fn.execute("!git clone https://github.com/xdebug/vscode-php-debug.git " .. php_debug_path)
  vim.fn.execute("!cd " .. php_debug_path .. " && npm install && npm run build")
  print("vscode-php-debug installed")
end

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { php_debug_path .. "out/phpDebug.js" }
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003
  }
}

