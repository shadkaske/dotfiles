local ls_ok, ls = pcall(require, "luasnip")

if ls_ok then
  return
end

local snip = ls.snippet
local func = ls.function_node
-- local node = ls.snippet_node
-- local text = ls.text_node
-- local insert = ls.insert_node
-- local choice = ls.choice_node
-- local dynamicn = ls.dynamic_node

local date = function()
    return { os.date "%Y-%m-%d" }
end

ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = false,
})

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in form of YYYY-MM-DD",
    }, {
      func(date, {}),
    })
  }
})

