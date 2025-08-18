local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono NFM Thin")

config.font_size = 13

config.color_scheme = "Tokyo Night"

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "NONE"

config.window_background_opacity = 0.95

config.keys = {
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
}

config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"fish",
	"tmux",
	"nu",
	"cmd.exe",
	"pwsh.exe",
	"powershell.exe",
	"zellij",
}

return config
