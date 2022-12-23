local mason_ok, mason = pcall(require, "mason")

if not mason_ok then
  return
end

-- Setup mason so it can manage external tooling
mason.setup()

