--[[

     Copland Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
-- local nofications = require("beautiful.nofications")
local dpi = require("beautiful.xresources").apply_dpi

local awesome, client, os = awesome, client, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local background = "#23272e"
local foreground = "#f8fafd"
local foreground_inactive = "#515a6b"
local highlight = "#4d78cc"
local urgent = "#C24038"
local background_alt = "#4C566A"

local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/copland"
theme.font = "FiraCode Nerd Font 11"
theme.fg_normal = foreground
theme.fg_focus = foreground
theme.bg_normal = background
theme.bg_focus = background
theme.fg_urgent = foreground
theme.bg_urgent = urgent
theme.border_width = dpi(2)
theme.border_normal = background_alt
theme.border_focus = highlight
theme.taglist_fg_focus = background
theme.taglist_bg_focus = highlight
theme.taglist_bg_empty = background
theme.taglist_fg_empty = foreground_inactive
theme.taglist_bg_occupied = background
theme.taglist_fg_occupied = foreground
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_bg_focus = theme.bg_focus
theme.menu_height = dpi(16)
theme.menu_width = dpi(130)
theme.tasklist_disable_icon = true
theme.tasklist_fg_normal = foreground_inactive
theme.tasklist_fg_focus = foreground
theme.awesome_icon = theme.dir .. "/icons/awesome.png"
theme.menu_submenu_icon = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel = theme.dir .. "/icons/square_unsel.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/square_unsel.png"
theme.vol = theme.dir .. "/icons/vol.png"
theme.vol_low = theme.dir .. "/icons/vol_low.png"
theme.vol_no = theme.dir .. "/icons/vol_no.png"
theme.vol_mute = theme.dir .. "/icons/vol_mute.png"
theme.disk = theme.dir .. "/icons/disk.png"
theme.ac = theme.dir .. "/icons/ac.png"
theme.bat = theme.dir .. "/icons/bat.png"
theme.bat_low = theme.dir .. "/icons/bat_low.png"
theme.bat_no = theme.dir .. "/icons/bat_no.png"
theme.play = theme.dir .. "/icons/play.png"
theme.pause = theme.dir .. "/icons/pause.png"
theme.stop = theme.dir .. "/icons/stop.png"
theme.layout_tile = theme.dir .. "/icons/tile.png"
theme.layout_tileleft = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv = theme.dir .. "/icons/fairv.png"
theme.layout_fairh = theme.dir .. "/icons/fairh.png"
theme.layout_spiral = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle = theme.dir .. "/icons/dwindle.png"
theme.layout_max = theme.dir .. "/icons/max.png"
theme.layout_fullscreen = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.dir .. "/icons/magnifier.png"
theme.layout_floating = theme.dir .. "/icons/floating.png"
theme.useless_gap = 4
theme.master_width_factor = 0.55
theme.titlebar_close_button_focus = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

-- lain related
theme.layout_centerfair = theme.dir .. "/icons/centerfair.png"
theme.layout_termfair = theme.dir .. "/icons/termfair.png"
theme.layout_centerwork = theme.dir .. "/icons/centerwork.png"

local markup = lain.util.markup
local blue = highlight
local red = urgent
local green = color02

-- Textclock
--os.setlocale(os.getenv("LANG")) -- to localize the clock
local mytextclock = wibox.widget.textclock(markup(foreground, "   %m/%e/%g   %H:%M "))
mytextclock.font = theme.font

-- Set Icon Size on Notifcations

-- Calendar
theme.cal = lain.widget.cal({
	attach_to = { mytextclock },
	week_start = 1,
	notification_preset = {
		font = "FiraCode Nerd Font 12",
		fg = foreground,
		bg = background,
	},
})

-- MPD
local mpdicon = wibox.widget.imagebox()
theme.mpd = lain.widget.mpd({
	settings = function()
		if mpd_now.state == "play" then
			title = mpd_now.title
			artist = " "
				.. mpd_now.artist
				.. markup("#777777", " <span font='Terminus 2'> </span>|<span font='Terminus 5'> </span>")
			mpdicon:set_image(theme.play)
		elseif mpd_now.state == "pause" then
			title = "mpd "
			artist = "paused" .. markup("#777777", " |<span font='Terminus 5'> </span>")
			mpdicon:set_image(theme.pause)
		else
			title = ""
			artist = ""
			mpdicon._private.image = nil
			mpdicon:emit_signal("widget::redraw_needed")
			mpdicon:emit_signal("widget::layout_changed")
		end

		widget:set_markup(markup.font(theme.font, markup(blue, title) .. artist))
	end,
})

-- Battery
local baticon = wibox.widget.imagebox(theme.bat)
local batbar = wibox.widget({
	forced_height = dpi(1),
	forced_width = dpi(59),
	color = theme.fg_normal,
	background_color = theme.bg_normal,
	margins = 1,
	paddings = 1,
	ticks = true,
	ticks_size = dpi(6),
	widget = wibox.widget.progressbar,
})
local batupd = lain.widget.bat({
	settings = function()
		if (not bat_now.status) or bat_now.status == "N/A" or type(bat_now.perc) ~= "number" then
			return
		end

		if bat_now.status == "Charging" then
			baticon:set_image(theme.ac)
			if bat_now.perc >= 98 then
				batbar:set_color(green)
			elseif bat_now.perc > 50 then
				batbar:set_color(theme.fg_normal)
			elseif bat_now.perc > 15 then
				batbar:set_color(theme.fg_normal)
			else
				batbar:set_color(red)
			end
		else
			if bat_now.perc >= 98 then
				batbar:set_color(green)
			elseif bat_now.perc > 50 then
				batbar:set_color(theme.fg_normal)
				baticon:set_image(theme.bat)
			elseif bat_now.perc > 15 then
				batbar:set_color(theme.fg_normal)
				baticon:set_image(theme.bat_low)
			else
				batbar:set_color(red)
				baticon:set_image(theme.bat_no)
			end
		end
		batbar:set_value(bat_now.perc / 100)
	end,
})
local batbg = wibox.container.background(batbar, "#474747", gears.shape.rectangle)
local batwidget = wibox.container.margin(batbg, dpi(2), dpi(7), dpi(4), dpi(4))

-- /home fs
--[[ commented because it needs Gio/Glib >= 2.54
local fsicon = wibox.widget.imagebox(theme.disk)
local fsbar = wibox.widget {
    forced_height    = dpi(1),
    forced_width     = dpi(59),
    color            = theme.fg_normal,
    background_color = theme.bg_normal,
    margins          = 1,
    paddings         = 1,
    ticks            = true,
    ticks_size       = dpi(6),
    widget           = wibox.widget.progressbar,
}
theme.fs = lain.widget.fs {
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10.5" },
    settings  = function()
        if fs_now["/home"].percentage < 90 then
            fsbar:set_color(theme.fg_normal)
        else
            fsbar:set_color("#EB8F8F")
        end
        fsbar:set_value(fs_now["/home"].percentage / 100)
    end
}
local fsbg = wibox.container.background(fsbar, "#474747", gears.shape.rectangle)
local fswidget = wibox.container.margin(fsbg, dpi(2), dpi(7), dpi(4), dpi(4))
--]]

-- ALSA volume bar
local volicon = wibox.widget.imagebox(theme.vol)
theme.volume = lain.widget.alsabar({
	width = dpi(59),
	border_width = 0,
	ticks = true,
	ticks_size = dpi(6),
	notification_preset = { font = theme.font },
	--togglechannel = "IEC958,3",
	settings = function()
		if volume_now.status == "off" then
			volicon:set_image(theme.vol_mute)
		elseif volume_now.level == 0 then
			volicon:set_image(theme.vol_no)
		elseif volume_now.level <= 50 then
			volicon:set_image(theme.vol_low)
		else
			volicon:set_image(theme.vol)
		end
	end,
	colors = {
		background = theme.bg_normal,
		mute = red,
		unmute = theme.fg_normal,
	},
})
theme.volume.tooltip.wibox.fg = theme.fg_focus
theme.volume.bar:buttons(my_table.join(
	awful.button({}, 1, function()
		awful.spawn(string.format("%s -e alsamixer", awful.util.terminal))
	end),
	awful.button({}, 2, function()
		os.execute(string.format("%s set %s 100%%", theme.volume.cmd, theme.volume.channel))
		theme.volume.update()
	end),
	awful.button({}, 3, function()
		os.execute(
			string.format("%s set %s toggle", theme.volume.cmd, theme.volume.togglechannel or theme.volume.channel)
		)
		theme.volume.update()
	end),
	awful.button({}, 4, function()
		os.execute(string.format("%s set %s 1%%+", theme.volume.cmd, theme.volume.channel))
		theme.volume.update()
	end),
	awful.button({}, 5, function()
		os.execute(string.format("%s set %s 1%%-", theme.volume.cmd, theme.volume.channel))
		theme.volume.update()
	end)
))
local volumebg = wibox.container.background(theme.volume.bar, "#474747", gears.shape.rectangle)
local volumewidget = wibox.container.margin(volumebg, dpi(2), dpi(7), dpi(4), dpi(4))

-- Weather
--[[ to be set before use
theme.weather = lain.widget.weather({
    --APPID =
    city_id = 2643743, -- placeholder (London)
})
--]]

-- Separators
local first = wibox.widget.textbox(markup.font("Terminus 3", " "))
-- local spr       = wibox.widget.textbox(' ')
local small_spr = wibox.widget.textbox(markup.font("Terminus 4", " "))
local bar_spr = wibox.widget.textbox(
	markup.font("Terminus 3", " ") .. markup.fontfg(theme.font, "#777777", "|") .. markup.font("Terminus 5", " ")
)

-- Eminent-like task filtering
local orig_filter = awful.widget.taglist.filter.all

-- Taglist label functions
awful.widget.taglist.filter.all = function(t, args)
	if t.selected or #t:clients() > 0 then
		return orig_filter(t, args)
	end
end

function theme.at_screen_connect(s)
	-- Quake application
	-- s.quake = lain.util.quake({ app = awful.util.terminal })
	s.quake = lain.util.quake({
		app = "kitty",
		argname = "--title %s",
		extra = "--override window_padding_width=5 --class=QuakeDD",
		-- app = "kitty",argname = "--title %s",extra = "--override window_padding_width=5 --class=QuakeDD tmux new-session -A -s DropDown",
		visible = false,
		border = 0,
		-- height = 0.35,
		width = 0.45,
		-- vert = "center",
		horiz = "center",
		-- border = 2,
		overlap = true,
		-- followtag = true,
	})

	-- If wallpaper is a function, call it with the screen
	local wallpaper = theme.wallpaper
	if type(wallpaper) == "function" then
		wallpaper = wallpaper(s)
	end
	gears.wallpaper.maximized(wallpaper, s, true)

	-- Tags
	awful.tag(awful.util.tagnames, s, awful.layout.layouts)

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(my_table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 2, function()
			awful.layout.set(awful.layout.layouts[1])
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = dpi(28),
		bg = theme.bg_normal,
		fg = theme.fg_normal,
		ontop = false,
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			small_spr,
			s.mylayoutbox,
			first,
			bar_spr,
			s.mytaglist,
			first,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			--theme.mail.widget,
			mpdicon,
			theme.mpd.widget,
			-- baticon,
			-- batwidget,
			-- bar_spr,
			--fsicon,
			--fswidget,
			-- bar_spr,
			-- volicon,
			-- volumewidget,
			-- bar_spr,
			mytextclock,
			small_spr,
			bar_spr,
			wibox.widget.systray({
				forced_height = 18,
			}),
		},
	})
end

return theme