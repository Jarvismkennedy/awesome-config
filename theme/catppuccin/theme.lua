local filesystem = require("gears.filesystem")
local mat_colors = require("theme.mat-colors")
local theme_dir = filesystem.get_configuration_dir() .. "/theme"
local dpi = require("beautiful").xresources.apply_dpi
local theme_colors = {
    background = "#24273a",
    foreground = "#cad3f5",
    border = "#494d64",
    borderfocus = "#b7bdf8",
    cyan = "#8bd5ca",
    green = "#a6da95",
    orange = "#f5a97f",
    pink = "#f5bde6",
    purple = "#c6a0f6",
    red = "#ed8796",
    yellow = "#eed49f",
}

local theme = {}
theme.colors = theme_colors
theme.icons = theme_dir .. "/icons/"
theme.font = "JetBrainsMono Nerd Font 10"

-- Colors Pallets

-- Primary
theme.primary = mat_colors.deep_orange

-- Accent
theme.accent = mat_colors.pink

-- Background
theme.background = mat_colors.grey

local awesome_overrides = function(theme)
    theme.dir = os.getenv("HOME") .. "/.config/awesome/theme"
    theme.icons = theme.dir .. "/icons/"
    theme.font = "JetBrainsMono Nerd Font 10"
    theme.title_font = "JetBrainsMono Nerd Font 10"

    theme.fg_normal = "#ffffffde"

    theme.fg_focus = "#e4e4e4"
    theme.fg_urgent = "#CC9393"
    theme.bat_fg_critical = "#232323"

    theme.bg_normal = theme.colors.background
    theme.bg_focus = "#5a5a5a"
    theme.bg_urgent = "#3F3F3F"
    theme.bg_systray = theme.colors.background

    -- Borders
    theme.border_width = dpi(2)
    theme.border_normal = theme.colors.border
    theme.border_focus = theme.colors.borderfocus
    theme.border_marked = theme.colors.border

    -- Menu

    theme.menu_height = dpi(16)
    theme.menu_width = dpi(160)

    -- Tooltips
    theme.tooltip_bg = "#232323"
    --theme.tooltip_border_color = '#232323'
    theme.tooltip_border_width = 0
    theme.tooltip_shape = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, dpi(6))
    end

    theme.wallpaper = "/home/jarvisk/wallpapers/robot-armor.jpg"
    -- Layout
    theme.layout_max = theme.icons .. "layouts/arrow-expand-all.png"
    theme.layout_tile = theme.icons .. "layouts/view-quilt.png"

    -- Taglist

    theme.taglist_bg_empty = theme.colors.background
    theme.taglist_bg_occupied = theme.colors.background
    theme.taglist_bg_focus = theme.colors.background
    theme.taglist_bg_urgent = "linear:0,0:"
        .. dpi(40)
        .. ",0:0,"
        .. theme.colors.pink
        .. ":0.08,"
        .. theme.colors.pink
        .. ":0.08,"
        .. theme.colors.background
        .. ":1,"
        .. theme.colors.background

    -- Tasklist
    theme.tasklist_font = "JetBrainsMono Nerd Font 8"
    theme.tasklist_bg_normal = theme.colors.background
    theme.tasklist_bg_focus = "linear:0,0:0,"
        .. dpi(40)
        .. ":0,"
        .. theme.colors.background
        .. ":0.95,"
        .. theme.colors.background
        .. ":0.95,"
        .. theme.fg_normal
        .. ":1,"
        .. theme.fg_normal
    theme.tasklist_bg_urgent = theme.primary.hue_800
    theme.tasklist_fg_focus = "#DDDDDD"
    theme.tasklist_fg_urgent = theme.fg_normal
    theme.tasklist_fg_normal = "#AAAAAA"

    theme.icon_theme = "Papirus-Dark"
end
return {
    theme = theme,
    awesome_overrides = awesome_overrides,
}
