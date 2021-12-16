--[[

     Awesome WM configuration template
     github.com/lcpz

--]]

-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
--local menubar       = require("menubar")
-- local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi           = require("beautiful.xresources").apply_dpi
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Notification Settings
    naughty.config.defaults['icon_size'] = 100
-- }}}

-- {{{ Autostart windowless processes

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({
    "picom --config ~/.config/picom/picom.conf",
    "nm-applet",
    "blueman-applet",
    "pasystray",
    "greenclip daemon",
    "unclutter -root",
    "lxpolkit",
    "udevadm monitor",
    -- "onedrive --monitor",
    "nextcloud --background",
    "udiskie",
    "xfce4-power-manager --sm-client-disable",
    "xfce4-screensaver",
    -- "mpDris2",
    "xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --mode 1920x1080 --pos 2560x0 --rotate normal --output HDMI-A-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal --rate 74.99",
}) -- entries must be separated by commas

-- }}}

-- {{{ Variable definitions

local themes = {
    "blackburn",       -- 1
    "copland",         -- 2
    "dremora",         -- 3
    "holo",            -- 4
    "multicolor",      -- 5
    "powerarrow",      -- 6
    "powerarrow-dark", -- 7
    "rainbow",         -- 8
    "steamburn",       -- 9
    "vertex",          -- 10
    "gtk",
}

local chosen_theme = themes[2]
local modkey       = "Mod4"
local altkey       = "Mod1"
local terminal     = "kitty"
-- local vi_focus     = false -- vi-like client focus - https://github.com/lcpz/awesome-copycats/issues/275
-- local cycle_prev   = true -- cycle trough all previous client or just the first -- https://github.com/lcpz/awesome-copycats/issues/274
-- local editor       = os.getenv("EDITOR") or "vim"
local gui_editor   = os.getenv("GUI_EDITOR") or "gvim"
local browser      = os.getenv("BROWSER") or "firefox"
local scrlocker    = "mpc pause; xfce4-screensaver-command -l"
-- local clpmngr      = "dmenu-greenclip"
local filemanager  = terminal .. " --class=RangerFM --title=Ranger -e ranger"
local musicmanager = terminal .. " --class musicmanager -e ncmpcpp"
local quickedit    = terminal .. " --class quickedit -e nvim"

awful.util.terminal = terminal
awful.util.tagnames = { " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " }
-- awful.util.tagnames = { "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  ", "  " }
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.fair,
    awful.layout.suit.max,
}

awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            --c:emit_signal("request::activate", "tasklist", {raise = true})<Paste>

            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 2, function (c) c:kill() end),
    awful.button({ }, 3, function ()
        local instance = nil

        return function ()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = dpi(250)}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = dpi(2)
lain.layout.cascade.tile.offset_y      = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
-- }}}

-- {{{ Screen
-- Screen Geometry Change
screen.connect_signal("property::geometry", function(s)
end)

-- On Screen Connect
-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width
        end
    end
end)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)
-- }}}

-- {{{ Key bindings
globalkeys = my_table.join(
    -- X screen locker
    awful.key({ modkey }, "Escape", function () os.execute(scrlocker) end,
              {description = "lock screen", group = "hotkeys"}),

    -- Hotkeys
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description = "show help", group="awesome"}),
    -- Tag browsing
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "'", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    -- Client Focus
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey }, ".", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey }, ",", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    -- Show/Hide Wibox
    awful.key({ modkey }, "b", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
        {description = "toggle wibox", group = "awesome"}),

    -- On the fly useless gaps change
    awful.key({ modkey, "Control" }, "=", function () lain.util.useless_gaps_resize(1) end,
              {description = "increment useless gaps", group = "tag"}),
    awful.key({ modkey, "Control" }, "-", function () lain.util.useless_gaps_resize(-1) end,
              {description = "decrement useless gaps", group = "tag"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Dismiss all notifications
    awful.key({modkey, altkey}, ".", function () naughty.destroy_all_notifications() end,
            {description = "Dismiss All Notifications", group = "hotkeys"}),
    -- Dropdown application
    awful.key({ modkey }, "`", function() awful.screen.focused().quake:toggle() end,
              {description = "Dropdown Terminal", group = "applications"}),

    -- Brightness
    awful.key({ }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 10") end,
              {description = "+10%", group = "hotkeys"}),
    awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 10") end,
              {description = "-10%", group = "hotkeys"}),

    -- Pulse Audio Volume Control
    awful.key({}, "XF86AudioRaiseVolume",
        function ()
            os.execute("pactl set-sink-volume @DEFAULT_SINK@ +5%")
            beautiful.volume.update()
        end,
        {description = "volume up", group = "hotkeys"}),
    awful.key({}, "XF86AudioLowerVolume",
        function ()
            os.execute("pactl set-sink-volume @DEFAULT_SINK@ -5%")
            beautiful.volume.update()
        end,
        {description = "volume down", group = "hotkeys"}),
    awful.key({}, "XF86AudioMute",
        function ()
            os.execute("pactl set-sink-mute @DEFAULT_SINK@ toggle")
            beautiful.volume.update()
        end,
        {description = "toggle mute", group = "hotkeys"}),
    awful.key({ "Shift" }, "XF86AudioMute",
        function ()
            os.execute("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
        end,
        {description = "toggle mute default input", group = "hotkeys"}),

    -- MPD control
    awful.key({}, "XF86AudioPlay",
        function()
            os.execute("mpc toggle")
        end,
        {description = "MPRIS Play/Pause", group = "Media"}),
    awful.key({}, "XF86AudioPause",
        function()
            os.execute("mpc toggle")
        end,
        {description = "MPRIS Play/Pause", group = "Media"}),
    awful.key({}, "XF86AudioNext",
        function()
            os.execute("mpc next")
            beautiful.mpd.update()
        end,
        {description = "MPRIS Next", group = "Media"}),

    awful.key({}, "XF86AudioPrev",
        function()
            os.execute("mpc prev")
            beautiful.mpd.update()
        end,
        {description = "MPRIS Previous", group = "Media"}),

    -- User programs
    awful.key({modkey, "Shift"}, "m", function() awful.spawn(musicmanager) end,
                {description = "run music manager", group = "launcher"}),
    awful.key({modkey, "Shift"}, "e", function() awful.spawn(quickedit) end,
                {description = "pop up editor", group = "launcher"}),
    -- awful.key({ modkey }, "q", function () awful.spawn(browser) end,
    --           {description = "run browser", group = "launcher"}),
    awful.key({ modkey }, "a", function () awful.spawn(gui_editor) end,
              {description = "run gui editor", group = "launcher"}),

    awful.key({ modkey }, "p", function() awful.spawn("rofi -show run") end,
              {description = "show the rofi", group = "launcher"}),

    awful.key({ modkey }, "Tab", function() awful.spawn("rofi -show window") end,
              {description = "rofi window switcher", group = "launcher"}),

    awful.key({ modkey, "Shift" }, "p", function() awful.spawn("rofi -show drun") end,
              {description = "show the rofi drun", group = "launcher"}),

    -- Dmenu Greenclip
    awful.key({ modkey, altkey }, "v", function() awful.spawn("dmenu-greenclip") end,
              {description = "clipboard manager", group = "launcher"}),

    -- Toggle Systray
    awful.key({ modkey }, "=", function()
        awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
    end, {description = "Toggle Systray", group = "custom"}),

    -- Dmenu Calc
    awful.key({ modkey, altkey }, "=", function() awful.spawn("=") end,
            {description = "Toggle Systray", group = "custom"}),

    -- Dmenu virsh list
    -- awful.key({ modkey, altkey }, "i", function() awful.spawn("dmenu-virtmanager") end,
    --           {description = "virt-manager vms", group = "launcher"}),
    awful.key({ modkey, altkey }, "i", function() awful.spawn("rofi-vbox") end,
              {description = "virtualbox vms", group = "launcher"}),

    -- Dmenu pacman
    awful.key({ modkey, altkey }, "u", function() awful.spawn("dmenu-pacman") end,
              {description = "pacman", group = "launcher"}),

    -- Dmenu Network Manager
    awful.key({ modkey, altkey }, "n", function() awful.spawn("dmenu-networkmanager") end,
              {description = "dmenu network manager", group = "launcher"}),

    -- Dmenu Music Manager
    awful.key({ modkey, altkey }, "m", function() awful.spawn("dmenu-mpd") end,
              {description = "dmenu music manager", group = "launcher"}),

    -- Dmenu Remote Desktop
    awful.key({ modkey, altkey }, "r", function() awful.spawn("dmenu-remmina") end,
              {description = "dmenu remmina connections", group = "launcher"}),

    -- Dmenu QuteBrowser
    awful.key({ modkey, altkey }, "b", function() awful.spawn("dmenu-qutebrowser") end,
              {description = "dmenu qutebrowser", group = "launcher"}),

    -- Firefox
    awful.key({ modkey }, "F2", function() awful.spawn("firefox") end,
              {description = "Firefox", group = "applications"}),

    -- Chrome
    awful.key({ modkey }, "F3", function() awful.spawn("google-chrome-stable") end,
              {description = "Chrome", group = "applications"}),

    -- Evolution
    awful.key({ modkey }, "F4", function() awful.spawn("emacsclient -c -a emacs") end,
              {description = "Emacs", group = "applications"}),

    -- File Manager
    awful.key({ modkey }, "F6", function() awful.spawn(filemanager) end,
              {description = "File Manager", group = "applications"}),

    -- Database Manager
    awful.key({ modkey }, "F7", function() awful.spawn("dbeaver") end,
              {description = "Database Manager", group = "applications"}),

    -- Virt Manager
    awful.key({ modkey }, "F8", function() awful.spawn("virt-manager") end,
              {description = "Virt-Manager", group = "applications"}),

    -- Lazy Git Dots
    awful.key({ modkey, altkey }, "d", function() awful.spawn("lazygit-dots") end,
              {description = "Dot Files Manager", group = "applications"}),

    -- -- Run Prompt
    -- awful.key({ modkey }, "r", function() awful.spawn("rofi -show run") end,
    --           {description = "show the menubar", group = "launcher"}),

    -- Edit Configs
    awful.key({ modkey, altkey }, "e", function() awful.spawn("dmenu-edit-configs") end,
              {description = "edit configs", group = "launcher"}),

    -- Pulse Audio Source Selection
    awful.key({ modkey, altkey }, "s", function() awful.spawn("dmenu-audio-select") end,
              {description = "audio source", group = "launcher"}),

    -- BitWarden
    awful.key({ modkey, altkey }, "p", function() awful.spawn("bwmenu") end,
             {description = "Rofi BitWarden", group = "launcher"}),

    -- Scrot
    awful.key({ modkey, altkey }, "/", function() awful.spawn("dmenu-scrot") end,
             {description = "Screen Shot", group = "launcher"}),

    -- LastPass
    awful.key({ modkey, altkey }, "l", function() awful.spawn("dmenu-lastpass copy") end,
             {description = "LastPass", group = "launcher"})

)

clientkeys = my_table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey            }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_toggle = {description = "toggle tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
    end
    globalkeys = my_table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  descr_toggle),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  descr_move),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  descr_toggle_focus)
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = false
     }
    },

    -- Titlebars
    { rule_any = { type = { "dialog", "normal" } },
      properties = { titlebars_enabled = false } },

    -- Set Firefox to always map on the first tag on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = awful.util.tagnames[1] } },

    { rule = { class = "Gimp", role = "gimp-image-window" },
          properties = { maximized = true } },

    -- Outlook Web App
    { rule = { instance = "outlook.office.com" },
        properties = {
            floating = false,
            maximized = false,
            tag = "4"
    },

    -- Monday.com Web App
    { rule = { instance = "crx_kbegbiojgpfnnakkdgkiemnjamcbfbem" },
        properties = {
            floating = false,
            maximized = false,
        }
    },

    -- Zendesk Web App
    { rule = { instance = "crx_okmffjclobflnklomoilphpkpoadpbkd" },
        properties = {
            floating = false,
            maximized = false,
        }
    },
},

    -- iForms Wine Window likes to open as Maximized
    -- { rule = { class = "iforms designer64.exe" },
    --       properties = {
    --           maximized = false,
    --           floating = false,
    --       } },

    -- Games full screen
    { rule = { class = "valheim.x86_64" },
          properties = { fullscreen = true } },

    -- Music manager floating and centered
    { rule = { class = "musicmanager" }, properties = {
        floating = true,
        placement = awful.placement.centered
    }},

    -- Quick Editor floating and centered
    { rule = { class = "quickedit" }, properties = {
        floating = true,
        placement = awful.placement.centered
    }},

    -- Floating Clients
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
        },
        class = {
          "Arandr",
          "VirtualBox Manager",
          "Blueman-manager",
          "Gpick",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "Evolution-alarm-notify",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = { -- Title
          "Event Tester",  -- xev.
          "scratchpad",
          "Virtual Machine Manager",
          "Remmina Remote Desktop Client"
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = {
          floating = true,
          placement = awful.placement.centered
      }},
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = my_table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 2, function() c:kill() end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {size = dpi(16)}) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

beautiful.gap_single_client = true

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

awful.spawn.with_shell("feh --bg-fill --randomize ~/.local/share/backgrounds/*")
