local awful = require("awful")
local gears = require("gears")
local icons = require("theme.icons")
local apps = require("configuration.apps")
local theme = require("theme.dracula.theme")

local dots = gears.color.recolor_image(icons.circles, theme.theme.dracula.orange)
local ghost_purple = gears.color.recolor_image(icons.ghost, theme.theme.dracula.purple)
local ghost_pink = gears.color.recolor_image(icons.ghost, theme.theme.dracula.pink)
local ghost_cyan = gears.color.recolor_image(icons.ghost, theme.theme.dracula.cyan)
local ghost_red = gears.color.recolor_image(icons.ghost, theme.theme.dracula.red)
local ghost_yellow = gears.color.recolor_image(icons.ghost, theme.theme.dracula.orange)
local ghosts = { ghost_purple, ghost_pink, ghost_cyan, ghost_red, ghost_yellow }
local focused = gears.color.recolor_image(icons.pacman, theme.theme.dracula.yellow)

local get_ghost = function(n)
    return ghosts[n]
end
local tags = {
    {
        icon = focused,
        type = "code",
        defaultApp = apps.default.terminal,
        screen = 1,
    },
    {
        icon = get_ghost(2),
        type = "web",
        defaultApp = apps.default.browser,
        screen = 1,
    },
    {
        icon = get_ghost(3),
        type = "social",
        defaultApp = apps.default.social,
        screen = 1,
    },
    {
        icon = get_ghost(4),
        type = "web",
        defaultApp = apps.default.browser,
        screen = 1,
    },
    {
        icon = get_ghost(5),
        type = "files",
        defaultApp = apps.default.files,
        screen = 1,
    },
}

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.top,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.floating,
}

awful.screen.connect_for_each_screen(function(s)
    for i, tag in pairs(tags) do
        awful.tag.add(i, {
            icon = tag.icon,
            icon_only = true,
            layout = awful.layout.suit.tile,
            gap_single_client = false,
            gap = 4,
            screen = s,
            defaultApp = tag.defaultApp,
            selected = i == 1,
        })
    end
end)

_G.tag.connect_signal("property::selected", function(t)
    if t.selected then
        t.icon = focused
        local taglist = awful.screen.focused().tags
        for i = 1, tonumber(t.name) - 1 do
            taglist[i].icon = dots
        end
        for i = tonumber(t.name) + 1, #taglist do
            taglist[i].icon = get_ghost(i)
        end
    end
end)
_G.tag.connect_signal("property::layout", function(t)
    local currentLayout = awful.tag.getproperty(t, "layout")
    if currentLayout == awful.layout.suit.max then
        t.gap = 0
    else
        t.gap = 4
    end
end)
