-- Pull in the wezterm API
local wezterm = require("wezterm")

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

wezterm.on("update-right-status", function(window)
	window:set_right_status(window:active_workspace())
end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
config = wezterm.config_builder()

config.initial_rows = 40
config.initial_cols = 120

-- Stop nagging me about closing
config.window_close_confirmation = "NeverPrompt"

-- Spawn a fish shell in login mode
config.default_prog = { "/bin/zsh", "-l" }

-- ColorScheme
config.color_scheme = "Catppuccin Mocha"

-- Window Background Opacitry
config.window_background_opacity = 0.9

-- Disable Scrollbar
config.enable_scroll_bar = false

-- Fonts
config.font = wezterm.font("JetBrainsMono NFM")

config.font_size = 13

-- Window Decorations
config.window_decorations = "RESIZE"

-- Cursor
config.default_cursor_style = "BlinkingUnderline"

-- WindowPadding
config.window_padding = {
	left = 2,
	right = 2,
	top = 4,
	bottom = 4,
}

-- Tabs
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "t",
		mods = "ALT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "Enter",
		mods = "ALT|CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = wezterm.action.Multiple({
			wezterm.action.ClearScrollback("ScrollbackAndViewport"),
			wezterm.action.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
	{
		key = "z",
		mods = "ALT",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "'",
		mods = "ALT",
		action = wezterm.action.ActivateLastTab,
	},
	{
		key = "1",
		mods = "ALT",
		action = wezterm.action.ActivateTab(0),
	},
	{
		key = "2",
		mods = "ALT",
		action = wezterm.action.ActivateTab(1),
	},
	{
		key = "3",
		mods = "ALT",
		action = wezterm.action.ActivateTab(2),
	},
	{
		key = "4",
		mods = "ALT",
		action = wezterm.action.ActivateTab(3),
	},
	{
		key = "5",
		mods = "ALT",
		action = wezterm.action.ActivateTab(4),
	},
	{
		key = "6",
		mods = "ALT",
		action = wezterm.action.ActivateTab(5),
	},
	{
		key = "7",
		mods = "ALT",
		action = wezterm.action.ActivateTab(6),
	},
	{
		key = "8",
		mods = "ALT",
		action = wezterm.action.ActivateTab(7),
	},
	{
		key = "9",
		mods = "ALT",
		action = wezterm.action.ActivateTab(8),
	},
	{
		key = "p",
		mods = "ALT",
		action = wezterm.action.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.ShowLauncherArgs({
			flags = "FUZZY|DOMAINS",
		}),
	},
	{
		key = "G",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "lazygit" },
		}),
	},
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnCommandInNewTab({
			domain = "CurrentPaneDomain",
			args = { "ranger" },
		}),
	},
	{
		key = "q",
		mods = "ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "e",
		mods = "ALT",
		action = wezterm.action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter Tab Name: " },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- New Workspace
	{
		key = "w",
		mods = "ALT",
		action = wezterm.action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						wezterm.action.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
}

-- Smart Splits
smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	-- modifier keys to combine with direction_keys
	modifiers = {
		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
		resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
})

-- and finally, return the configuration to wezterm
return config
-- vim: tw=4 ts=4 sw=4 et ft=lua
