local lightspeed_ok, lightspeed = pcall(require, "lightspeed")

if not lightspeed_ok then
  return
end

lightspeed.setup({
  repeat_ft_with_target_char = true,
})
