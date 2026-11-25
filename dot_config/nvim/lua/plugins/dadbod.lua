-- SQL Server connections for vim-dadbod-ui, mirrored from VSCode's
-- mssql.connections. "Integrated" ones use the Kerberos ticket (sqlcmd -E);
-- SQL logins read their password from an env var (e.g. via env-secrets), and
-- connect without one (and fail) when it is unset.

---@param s string
local function urlencode(s)
  return (s:gsub("[^%w%-%._~]", function(c)
    return string.format("%%%02X", string.byte(c))
  end))
end

---@param host string
---@param opts? { user?: string, password_env?: string, encrypt?: "o" }
local function mssql(host, opts)
  opts = opts or {}
  local auth = ""
  if opts.user then
    local password = opts.password_env and os.getenv(opts.password_env)
    auth = urlencode(opts.user) .. (password and password ~= "" and (":" .. urlencode(password)) or "") .. "@"
  end
  -- sqlcmd 18 encrypts (Mandatory) by default; "o" is Optional.
  local params = { "trustServerCertificate=true" }
  if opts.encrypt then
    table.insert(params, "encrypt=" .. opts.encrypt)
  end
  return ("sqlserver://%s%s?%s"):format(auth, host, table.concat(params, "&"))
end

return {
  "kristijanhusak/vim-dadbod-ui",
  init = function()
    vim.g.dbs = {
      { name = "Insight - Production", url = mssql("swp-insightdb.showplacewood.com") },
      { name = "Insight - Dev", url = mssql("swp-insightdev.showplacewood.com", { encrypt = "o" }) },
      { name = "Insight - Local", url = mssql("localhost") },
      { name = "Tagnet", url = mssql("192.168.127.96", { user = "sa", password_env = "MSSQL_TAGNET_PASSWORD" }) },
      { name = "Webdocs Server", url = mssql("192.168.127.10", { user = "sa", password_env = "MSSQL_WEBDOCS_PASSWORD" }) },
      {
        name = "Automatech Router",
        url = mssql("10.10.225.218", { user = "supplier", password_env = "MSSQL_AUTOMATECH_PASSWORD" }),
      },
      {
        name = "BiesseSupervisor - Production",
        url = mssql(
          "supervisor.biesse.showplacewood.com",
          { user = "sa", password_env = "MSSQL_BIESSE_PASSWORD", encrypt = "o" }
        ),
      },
      {
        name = "Winstore Supervisor",
        url = mssql("10.10.225.10", { user = "algoritmo", password_env = "MSSQL_WINSTORE_PASSWORD" }),
      },
    }
  end,
}
