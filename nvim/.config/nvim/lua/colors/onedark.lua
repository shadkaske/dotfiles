local onedark_ok, onedark = pcall(require, "onedark")

if not onedark_ok then
  return
end

onedark.setup({
  transparent = true,
  style = "darker",
})

onedark.load()
