local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono NFM Thin")

config.font_size = 13

config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "NONE"

config.window_background_opacity = 0.96

config.window_close_confirmation = "NeverPrompt"

config.keys = {
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
}

return config
