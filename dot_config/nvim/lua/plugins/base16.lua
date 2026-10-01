-- Colorscheme driven by noctalia shell.
--
-- Noctalia's "neovim" template regenerates lua/matugen.lua every time the
-- shell's colors change, then sends SIGUSR1 to running nvim instances. The
-- module installs its own SIGUSR1 handler, so live reloads work too.

-- Groups whose background we drop so the terminal shows through, matching the
-- transparent setup used by the other colorschemes in colorscheme.lua.
local transparent = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "FloatBorder",
  "FloatTitle",
  "EndOfBuffer",
  "SignColumn",
  "LineNr",
  "LineNrAbove",
  "LineNrBelow",
  "CursorLineNr",
  "FoldColumn",
  "Folded",
  "MsgArea",
  "StatusLine",
  "StatusLineNC",
  "TabLine",
  "TabLineFill",
  "WinBar",
  "WinBarNC",
  "WinSeparator",
  "Pmenu",
  "PmenuSbar",
  "DiagnosticVirtualTextError",
  "DiagnosticVirtualTextWarn",
  "DiagnosticVirtualTextInfo",
  "DiagnosticVirtualTextHint",
  -- matugen.lua sets explicit backgrounds on these
  "TelescopeNormal",
  "TelescopeBorder",
  "TelescopePromptNormal",
  "TelescopePromptBorder",
  "TelescopePromptPrefix",
  "TelescopePromptCounter",
  -- snacks.nvim (LazyVim's default picker/explorer)
  "SnacksNormal",
  "SnacksNormalNC",
  "SnacksWinBar",
  "SnacksBackdrop",
  "SnacksPickerPreview",
  "SnacksDashboardNormal",
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeEndOfBuffer",
  "NeoTreeWinSeparator",
}

local function clear_backgrounds()
  for _, group in ipairs(transparent) do
    -- link = false resolves linked groups so clearing bg actually takes effect
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    if ok and hl then
      hl.bg = nil
      hl.ctermbg = nil
      pcall(vim.api.nvim_set_hl, 0, group, hl)
    end
  end
end

return {
  "RRethy/base16-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Patch base16-colorscheme rather than matugen: the SIGUSR1 handler in
    -- matugen.lua wipes package.loaded['matugen'] and re-requires it, so a
    -- wrapper on matugen.setup would be lost on the first live reload. This
    -- module stays loaded, so the wrapper survives.
    local base16 = require("base16-colorscheme")
    local setup = base16.setup
    base16.setup = function(...)
      setup(...)
      clear_backgrounds()
      -- matugen.setup() applies its own Telescope highlights *after* calling
      -- base16.setup, so clear again on the next tick to catch those too.
      vim.schedule(clear_backgrounds)
    end
  end,
}
