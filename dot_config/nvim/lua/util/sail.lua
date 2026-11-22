-- Laravel Sail helpers: PHP tools run in the project's container, never on
-- the host (the laptop has no php or composer).
local M = {}

-- Where Sail mounts the project inside the container.
M.container_root = "/var/www/html"
M.service = "laravel.test"

local CACHE_MS = 15000
local running_cache = {}
local warned = {}

---Root of the Laravel project holding `path` (default: current buffer, else
---cwd), if it has Sail installed.
---@param path? string
---@return string?
function M.root(path)
  if not path or path == "" then
    path = vim.api.nvim_buf_get_name(0)
  end
  if path == "" then
    path = vim.fn.getcwd()
  end
  local root = vim.fs.root(path, "artisan")
  if root and vim.fn.executable(root .. "/vendor/bin/sail") == 1 then
    return root
  end
end

---Does the project have vendor/bin/<name>?
---@param root string
---@param name string
function M.has_bin(root, name)
  return vim.uv.fs_stat(root .. "/vendor/bin/" .. name) ~= nil
end

---Is the app container up? Cached for a few seconds, so format/lint on save
---doesn't run `docker compose ps` every time.
---@param root string
---@return boolean
function M.running(root)
  local now = vim.uv.now()
  local cached = running_cache[root]
  if cached and now - cached.time < CACHE_MS then
    return cached.up
  end
  local up = false
  local ok, proc = pcall(vim.system, { "docker", "compose", "ps", "--status", "running", "-q", M.service }, {
    cwd = root,
    text = true,
  })
  if ok then
    local res = proc:wait(5000)
    up = res.code == 0 and vim.trim(res.stdout or "") ~= ""
  end
  running_cache[root] = { time = now, up = up }
  return up
end

---Warn once per project that a tool was skipped because Sail is down.
---@param root string
---@param what string
function M.warn_down(root, what)
  local key = root .. "\0" .. what
  if warned[key] then
    return
  end
  warned[key] = true
  vim.notify(
    ("Sail is not running in %s: %s skipped"):format(vim.fn.fnamemodify(root, ":~"), what),
    vim.log.levels.WARN,
    { title = "Sail" }
  )
end

---`path` relative to the project root (the same relative path works inside
---the container, whose working directory is the mount).
---@param root string
---@param path string
function M.relative(root, path)
  return vim.fs.relpath(root, path) or path
end

return M
