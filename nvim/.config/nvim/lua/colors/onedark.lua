local onedark_ok, onedark = pcall(require, "onedark")

if not onedark_ok then
  return
end

onedark.setup({
  transparent = false,
  style = "darker",
})

onedark.load()
