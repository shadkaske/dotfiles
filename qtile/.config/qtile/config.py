# Qtile Config for my needs
# Author: Shad Kaske
import os
import subprocess

from typing import List

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

mod = "mod4"
terminal = "kitty"

keys = [
    # Switch between windows
    Key(
        [mod],
        "h",
        lazy.layout.left().when(layout='columns'),
        lazy.layout.shrink().when(layout='monadtall'),
        desc="Move focus to left"
    ),
    Key(
        [mod],
        "l",
        lazy.layout.right().when(layout='columns'),
        lazy.layout.grow().when(layout='monadtall'),
        desc="Move focus to right"
    ),
    Key(
        [mod],
        "j",
        lazy.group.next_window(),
        desc="Move focus down"
    ),
    Key(
        [mod],
        "k",
        lazy.group.prev_window(),
        desc="Move focus up"
    ),
    Key(
        [mod],
        "m",
        lazy.layout.maximize()
    ),

    # Toggle Window Float
    Key(
        [mod],
        "space",
        lazy.window.toggle_floating(),
        desc="Change Window to Floating"
    ),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"
    ),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod, "shift"], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # Go to previous group
    Key(
        [mod],
        "apostrophe",
        lazy.screen.toggle_group(),
        desc = "Switch to Previous Group",
    ),

    # Lock Screen
    Key(
        [mod],
        "Escape",
        lazy.spawn('mpc pause; xfce4-screensaver-command -l'),
        desc = "Lock Screen"
    ),
]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        Key([mod, "control"], i.name, lazy.window.togroup(i.name),
            desc="move focused window to group {}".format(i.name)),
    ])


# 'background': '#2E3440',
# 'foreground': '#D8DEE9',
# 'inactive':   '#434C5E',
# 'highlight':  '#88C0D0',
# 'active high': '#5294E2',
# 'urgent':     '#BF616A',
# 'bg_alt':     '#4C566A',

colors = {
    'background':    '2E3440',
    'foreground':    'D8DEE9',
    'inactive':      '434C5E',
    'highlight':     '88C0D0',
    'alt_highlight': '5294E2',
    'urgent':        'BF616A',
    'bg_alt':        '4C566A',
}

layouts = [
    layout.MonadTall(
        border_focus = "#" + colors['highlight'],
        border_normal = "#" + colors['inactive'],
        border_width = 1,
        ratio = 0.55,
        single_border_width = 0,
        single_margin = 0,
        margin = 8,
    ),
    layout.RatioTile(
        border_focus = "#" + colors['highlight'],
        border_normal = "#" + colors['inactive'],
        border_width = 1,
        margin = 2,
    ),
    layout.Max(),
    layout.Floating(
        border_focus = "#" + colors['highlight'],
        border_normal = "#" + colors['inactive'],
        border_width = 1,
    ),
    # Try more layouts by unleashing below layouts.
    # layout.Columns(border_focus_stack='#d75f5f'),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='JetBrainsMono Nerd Font',
    foreground = colors['foreground'],
    fontsize=12,
    padding=4,
)
extension_defaults = widget_defaults.copy()

sep_defaults = dict(
    foreground = colors['bg_alt'],
    padding = 4,
    size_percent = 60,
    linewidth = 4,
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(scale=0.4),
                widget.GroupBox(
                    highlight_color = colors['highlight'],
                    block_highlight_text_color = colors['foreground'],
                    disable_drag = True,
                    urgent_border = colors['urgent'],
                    borderwidth = 2,
                    active = colors['foreground'],
                    inactive = colors['bg_alt'],
                    this_current_screen_border = colors['alt_highlight'],
                    other_current_screen_border = colors['highlight'],
                ),
                widget.TextBox(
                    text="◤",
                    fontsize=52,
                    padding=-1,
                    foreground=colors['background'],
                    background=colors['bg_alt'],
                ),
                widget.Prompt(),
                widget.WindowName(
                    border = colors['alt_highlight'],
                    background=colors['bg_alt'],
                ),
                # widget.TaskList(
                #     border = colors['alt_highlight'],
                #     background=colors['bg_alt'],
                #     borderwidth = 1,
                # ),
                widget.TextBox(
                    text="◤",
                    fontsize=52,
                    padding=-1,
                    background=colors['background'],
                    foreground=colors['bg_alt'],
                ),
                widget.Mpd2(idle_message = 'idle '),
                widget.TextBox(
                    text="◤",
                    fontsize=52,
                    padding=-1,
                    foreground=colors['background'],
                    background=colors['bg_alt'],
                ),
                widget.CheckUpdates(background=colors['bg_alt']),
                widget.TextBox(
                    text="◤",
                    fontsize=52,
                    padding=-1,
                    background=colors['background'],
                    foreground=colors['bg_alt'],
                ),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.TextBox(
                    text="◤",
                    fontsize=52,
                    padding=-1,
                    foreground=colors['background'],
                    background=colors['bg_alt'],
                ),
                widget.Systray(background=colors['bg_alt']),
                widget.Spacer(10,background=colors['bg_alt'])
            ],
            24,
            background="#" + colors['background'],
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='Virtual Machine Manager'),
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
],
    border_focus = "#" + colors['highlight'],
    border_normal = "#" + colors['inactive'],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

@hook.subscribe.startup_once
def autostart():
    startup = os.path.expanduser('~/.config/qtile/scripts/autostart.sh')
    subprocess.call([startup])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
