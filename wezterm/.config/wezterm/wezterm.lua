-- Pull in the wezterm API
local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window)
	window:set_right_status(window:active_workspace())
end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.initial_rows = 40
config.initial_cols = 120

-- Stop nagging me about closing
config.window_close_confirmation = 'NeverPrompt'

-- Spawn a fish shell in login mode
config.default_prog = { '/bin/zsh', '-l' }

-- ColorScheme
config.color_scheme = "Catppuccin Mocha"

-- Disable Scrollbar
config.enable_scroll_bar = false

-- Fonts
config.font = wezterm.font("JetBrains Mono", { weight = "ExtraLight" })

config.font_size = 12

-- Window Decorations
-- config.window_decorations = "RESIZE"

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
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- SmartSplit

-- local function is_vim(pane)
-- 	return pane:get_user_vars().IS_NVIM == "true"
-- end
--
-- local direction_keys = {
-- 	Left = "h",
-- 	Down = "j",
-- 	Up = "k",
-- 	Right = "l",
-- 	-- reverse lookup
-- 	h = "Left",
-- 	j = "Down",
-- 	k = "Up",
-- 	l = "Right",
-- }
--
-- local function split_nav(resize_or_move, key)
-- 	return {
-- 		key = key,
-- 		mods = resize_or_move == "resize" and "META" or "CTRL",
-- 		action = wezterm.action_callback(function(win, pane)
-- 			if is_vim(pane) then
-- 				-- pass the keys through to vim/nvim
-- 				win:perform_action({
-- 					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
-- 				}, pane)
-- 			else
-- 				if resize_or_move == "resize" then
-- 					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
-- 				else
-- 					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
-- 				end
-- 			end
-- 		end),
-- 	}
-- end
--
-- -- Keymaps
-- config.keys = {
-- 	split_nav("move", "h"),
-- 	split_nav("move", "j"),
-- 	split_nav("move", "k"),
-- 	split_nav("move", "l"),
-- 	-- resize panes
-- 	split_nav("resize", "h"),
-- 	split_nav("resize", "j"),
-- 	split_nav("resize", "k"),
-- 	split_nav("resize", "l"),
-- 	-- New Workspace
-- 	{
-- 		key = "w",
-- 		mods = "ALT",
-- 		action = act.PromptInputLine({
-- 			description = wezterm.format({
-- 				{ Attribute = { Intensity = "Bold" } },
-- 				{ Foreground = { AnsiColor = "Fuchsia" } },
-- 				{ Text = "Enter name for new workspace" },
-- 			}),
-- 			action = wezterm.action_callback(function(window, pane, line)
-- 				-- line will be `nil` if they hit escape without entering anything
-- 				-- An empty string if they just hit enter
-- 				-- Or the actual line of text they wrote
-- 				if line then
-- 					window:perform_action(
-- 						act.SwitchToWorkspace({
-- 							name = line,
--                             -- spawn = {
--                             --     args = { "fzf-cd" },
--                             -- },
-- 						}),
-- 						pane
-- 					)
-- 				end
-- 			end),
-- 		}),
-- 	},
-- 	{
-- 		key = "t",
-- 		mods = "ALT",
-- 		action = act.SpawnTab("DefaultDomain"),
-- 	},
-- 	{
-- 		key = "Enter",
-- 		mods = "ALT",
-- 		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		key = "Enter",
-- 		mods = "ALT|CTRL",
-- 		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		key = "L",
-- 		mods = "CTRL|SHIFT",
-- 		action = act.Multiple({
-- 			act.ClearScrollback("ScrollbackAndViewport"),
-- 			act.SendKey({ key = "L", mods = "CTRL" }),
-- 		}),
-- 	},
-- 	{
-- 		key = "e",
-- 		mods = "ALT",
-- 		action = act.PromptInputLine({
-- 			description = wezterm.format({
-- 				{ Attribute = { Intensity = "Bold" } },
-- 				{ Foreground = { AnsiColor = "Fuchsia" } },
-- 				{ Text = "Enter Tab Name: " },
-- 			}),
-- 			action = wezterm.action_callback(function(window, pane, line)
-- 				if line then
-- 					window:active_tab():set_title(line)
-- 				end
-- 			end),
-- 		}),
-- 	},
-- 	{
-- 		key = "z",
-- 		mods = "ALT",
-- 		action = act.TogglePaneZoomState,
-- 	},
-- 	{
-- 		key = "'",
-- 		mods = "ALT",
-- 		action = wezterm.action.ActivateLastTab,
-- 	},
-- 	{
-- 		key = "1",
-- 		mods = "ALT",
-- 		action = act.ActivateTab(0),
-- 	},
-- 	{
-- 		key = "2",
-- 		mods = "ALT",
-- 		action = act.ActivateTab(1),
-- 	},
-- 	{
-- 		key = "3",
-- 		mods = "ALT",
-- 		action = act.ActivateTab(2),
-- 	},
-- 	{
-- 		key = "4",
-- 		mods = "ALT",
-- 		action = act.ActivateTab(3),
-- 	},
-- 	{
-- 		key = "5",
-- 		mods = "ALT",
-- 		action = act.ActivateTab(4),
-- 	},
-- 	{
-- 		key = "6",
-- 		mods = "ALT",
-- 		action = act.ActivateTab(5),
-- 	},
-- 	{
-- 		key = "7",
-- 		mods = "ALT",
-- 		action = act.ActivateTab(6),
-- 	},
-- 	{
-- 		key = "8",
-- 		mods = "ALT",
-- 		action = act.ActivateTab(7),
-- 	},
-- 	{
-- 		key = "9",
-- 		mods = "ALT",
-- 		action = act.ActivateTab(8),
-- 	},
-- 	{
-- 		key = "p",
-- 		mods = "ALT",
-- 		action = act.ShowLauncherArgs({
-- 			flags = "FUZZY|WORKSPACES",
-- 		}),
-- 	},
-- 	{
-- 		key = "W",
-- 		mods = "CTRL|SHIFT",
-- 		action = act.ShowLauncherArgs({
-- 			flags = "FUZZY|WORKSPACES",
-- 		}),
-- 	},
-- 	{
-- 		key = "S",
-- 		mods = "CTRL|SHIFT",
-- 		action = act.ShowLauncherArgs({
-- 			flags = "FUZZY|DOMAINS",
-- 		}),
-- 	},
--     {
--         key = "G",
--         mods = "CTRL|SHIFT",
--         action = act.SpawnCommandInNewTab {
--             args = { 'lazygit' },
--         },
--     },
--     {
--         key = "E",
--         mods = "CTRL|SHIFT",
--         action = act.SpawnCommandInNewTab {
--             domain = 'CurrentPaneDomain',
--             args = { 'ranger' },
--         },
--     },
--     {
--         key = "q",
--         mods = "ALT",
--         action = act.CloseCurrentPane { confirm = false },
--     },
-- }

-- and finally, return the configuration to wezterm
return config
-- vim: tw=4 ts=4 sw=4 et ft=lua
