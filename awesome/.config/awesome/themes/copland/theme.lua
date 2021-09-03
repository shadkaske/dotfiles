--[[

     Copland Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local awesome, client, os = awesome, client, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

-- local color00                                   = "#2E3440"
-- local color01                                   = "#88C0D0"
-- local color02                                   = "#BF616A"
-- local color03                                   = "#5E81AC"
-- local color04                                   = "#EBCB8B"
-- local color05                                   = "#A3BE8C"
-- local color06                                   = "#D08770"
-- local color07                                   = "#D8DEE9"
-- local color08                                   = "#4C566A"
-- local color09                                   = color01
-- local color10                                   = color02
-- local color11                                   = color03
-- local color12                                   = color04
-- local color13                                   = color05
-- local color14                                   = color06
-- local color15                                   = "#8FBCBB"
-- local color16                                   = "#81A1C1"
-- local color17                                   = "#B48EAD"
-- local color18                                   = "#3B4252"
-- local color19                                   = "#434C5E"
-- local color20                                   = "#D8DEE9"
-- local color21                                   = "#ECEFF4"
-- local color_foreground                          = color07
-- local color_background                          = color00

local background                                = "#2E3440"
local foreground                                = "#D8DEE9"
local foreground_inactive                       = "#434C5E"
local highlight                                 = "#88C0D0"
local urgent                                    = "#BF616A"
local background_alt                            = "#4C566A"

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/copland"
theme.font                                      = "Cantarell 10"
theme.fg_normal                                 = foreground
theme.fg_focus                                  = foreground
theme.bg_normal                                 = background
theme.bg_focus                                  = background
theme.fg_urgent                                 = foreground
theme.bg_urgent                                 = urgent
theme.border_width                              = dpi(2)
theme.border_normal                             = background_alt
theme.border_focus                              = highlight
theme.taglist_fg_focus                          = background
theme.taglist_bg_focus                          = highlight
theme.taglist_bg_empty                          = background
theme.taglist_fg_empty                          = foreground_inactive
theme.taglist_bg_occupied                       = background
theme.taglist_fg_occupied                       = foreground
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_bg_focus                         = theme.bg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(130)
theme.tasklist_disable_icon                     = true
theme.tasklist_fg_normal                        = foreground_inactive
theme.tasklist_fg_focus                         = foreground
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_unsel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.vol                                       = theme.dir .. "/icons/vol.png"
theme.vol_low                                   = theme.dir .. "/icons/vol_low.png"
theme.vol_no                                    = theme.dir .. "/icons/vol_no.png"
theme.vol_mute                                  = theme.dir .. "/icons/vol_mute.png"
theme.disk                                      = theme.dir .. "/icons/disk.png"
theme.ac                                        = theme.dir .. "/icons/ac.png"
theme.bat                                       = theme.dir .. "/icons/bat.png"
theme.bat_low                                   = theme.dir .. "/icons/bat_low.png"
theme.bat_no                                    = theme.dir .. "/icons/bat_no.png"
theme.play                                      = theme.dir .. "/icons/play.png"
theme.pause                                     = theme.dir .. "/icons/pause.png"
theme.stop                                      = theme.dir .. "/icons/stop.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.useless_gap                               = 2
theme.master_width_factor                       = .55
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

-- My Icon Addtions
theme.eth_icon                                       = theme.dir .. "/icons/net_up.png"

-- lain related
theme.layout_centerfair                         = theme.dir .. "/icons/centerfair.png"
theme.layout_termfair                           = theme.dir .. "/icons/termfair.png"
theme.layout_centerwork                         = theme.dir .. "/icons/centerwork.png"

local markup = lain.util.markup
local blue   = highlight
local red    = urgent
local green  = color02

-- Textclock
--os.setlocale(os.getenv("LANG")) -- to localize the clock
local mytextclock = wibox.widget.textclock(markup(foreground, "   %m/%e/%g   %H:%M "))
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "JetBrainsMono Nerd Font 12",
        fg   = foreground,
        bg   = background
    }
})

-- MPD
local mpdicon = wibox.widget.imagebox()
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            title = mpd_now.title .. " "
            artist  = " " .. markup(foreground, mpd_now.artist)  .. markup(foreground_inactive, " <span font='Terminus 2'> </span><span font='Terminus 5'> </span>")
            mpdicon:set_image(theme.play)
        elseif mpd_now.state == "pause" then
            title = "mpd "
            artist  = "paused " .. markup(foreground_inactive, " <span font='Terminus 5'> </span>")
            mpdicon:set_image(theme.pause)
        else
            title  = ""
            artist = ""
            mpdicon._private.image = nil
            mpdicon:emit_signal("widget::redraw_needed")
            mpdicon:emit_signal("widget::layout_changed")
        end

        widget:set_markup(markup.font(theme.font, markup(blue, title) .. artist))
    end
})

-- Battery
local baticon = wibox.widget.imagebox(theme.bat)
local batbar = wibox.widget {
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
-- local batupd = lain.widget.bat({
--     settings = function()
--         if (not bat_now.status) or bat_now.status == "N/A" or type(bat_now.perc) ~= "number" then return end

--         if bat_now.status == "Charging" then
--             baticon:set_image(theme.ac)
--             if bat_now.perc >= 98 then

-- Pulse volume bar
local volicon = wibox.widget.imagebox(theme.vol)
theme.volume = lain.widget.pulsebar {
    width = dpi(59), border_width = 0, ticks = true, ticks_size = dpi(4),
    notification_preset = { font = theme.font },
    --togglechannel = "IEC958,3",
    settings = function()
        if volume_now.muted == "yes" then
            volicon:set_image(theme.vol_mute)
        else
            volicon:set_image(theme.vol)
        end
    end,
    colors = {
        background   = background_alt,
        mute         = urgent,
        unmute       = foreground
    }
}
theme.volume.tooltip.wibox.fg = theme.fg_focus
theme.volume.bar:buttons(my_table.join (
          awful.button({}, 1, function()
            os.execute("pactl set-sink-mute @DEFAULT_SINK@ toggle")
            theme.volume.update()
          end),
          awful.button({}, 3, function()
            awful.spawn(string.format("pavucontrol --tab 3", awful.util.terminal))
          end),
          awful.button({}, 4, function()
            os.execute("pactl set-sink-volume @DEFAULT_SINK@ +5%")
            theme.volume.update()
          end),
          awful.button({}, 5, function()
            os.execute("pactl set-sink-volume @DEFAULT_SINK@ -5%")
            theme.volume.update()
          end)
))
local volumebg = wibox.container.background(theme.volume.bar, background, gears.shape.rectangle)
local volumewidget = wibox.container.margin(volumebg, dpi(2), dpi(7), dpi(4), dpi(4))

-- Weather
local myweather = lain.widget.weather({
    city_id = 5231851,
    units = "imperial"
})

-- Separators
local first     = wibox.widget.textbox(markup.font("Terminus 3", " "))
local spr       = wibox.widget.textbox(' ')
local small_spr = wibox.widget.textbox(markup.font("Terminus 4", " "))
local bar_spr   = wibox.widget.textbox(markup.font("Terminus 3", " ") .. markup.fontfg(theme.font, foreground_inactive, "|") .. markup.font("Terminus 5", " "))

-- {{{ Filter Taglist to show only used tags
-- local orig_filter = awful.widget.taglist.filter.all

-- -- Taglist label functions
-- awful.widget.taglist.filter.all = function (t, args)
--     if t.selected or #t:clients() > 0 then
--         return orig_filter(t, args)
--     end
-- end
-- }}}

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({
            app = "kitty",argname = "--title %s",extra = "--override window_padding_width=5 --class=QuakeDD tmux new-session -A -s DropDown",
            visible = false,
            height = 0.35,
            width = 0.45,
            vert = "center",
            horiz = "center",
            border = 2,
            overlap = true,
            followtag = true,
        })

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Network Icons
    -- local wifi_icon = wibox.widget.imagebox()
    -- local pia_icon = wibox.widget.imagebox()
    -- local vpn_icon = wibox.widget.imagebox()
    local eth_icon = wibox.widget.imagebox()
    local net = lain.widget.net {
        notify = "off",
        wifi_state = "on",
        eth_state = "on",
        settings = function()
            local enp6s0 = net_now.devices.enp6s0
            if enp6s0 then
                if enp6s0.ethernet then
                    eth_icon:set_image(eth_icon)
                else
                    eth_icon:set_image()
                end
            end

            -- local wlan0 = net_now.devices.wlan0
            -- if wlan0 then
            --     if wlan0.wifi then
            --         local signal = wlan0.signal
            --         if signal < -83 then
            --             wifi_icon:set_image(wifi_weak_filename)
            --         elseif signal < -70 then
            --             wifi_icon:set_image(wifi_mid_filename)
            --         elseif signal < -53 then
            --             wifi_icon:set_image(wifi_good_filename)
            --         elseif signal >= -53 then
            --             wifi_icon:set_image(wifi_great_filename)
            --         end
            --     else
            --         wifi_icon:set_image()
            --     end
            -- end
        end
    }

    -- Systray
    s.systray = wibox.widget.systray()
    s.systray.visible = true
    s.systray.force_height = 12

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(24),
        bg = theme.bg_normal,
        fg = theme.fg_normal,
        opacity = 0.92
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            first,
            small_spr,
            s.mytaglist,
            -- first,
            -- s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --theme.mail.widget,
            mpdicon,
            theme.mpd.widget,
            spr,
            -- baticon,
            -- batwidget,
            -- bar_spr,
            --fsicon,
            --fswidget,
            -- bar_spr,
            small_spr,
            eth_icon,
            small_spr,
            volicon,
            volumewidget,
            small_rpr,
            spr,
            spr,
            mytextclock,
            small_spr,
            s.systray,
            small_spr,
            s.mylayoutbox,
            small_spr
        },
    }
end

return theme
