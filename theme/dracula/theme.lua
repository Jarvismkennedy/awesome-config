local filesystem = require("gears.filesystem")
local mat_colors = require("theme.mat-colors")
local theme_dir = filesystem.get_configuration_dir() .. "/theme"
local dpi = require("beautiful").xresources.apply_dpi
local dracula = {
    background = "#282a36",
    currentLine = "#44475a",
    foreground = "#f8f8f2",
    comment = "#6272a4",
    cyan = "#8be9fd",
    green = "#50fa7b",
    orange = "#ffb86c",
    pink = "#ff79c6",
    purple = "#bd93f9",
    red = "#ff5555",
    yellow = "#f1fa8c",
}

local theme = {}
theme.dracula = dracula
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

    theme.bg_normal = dracula.background
    theme.bg_focus = "#5a5a5a"
    theme.bg_urgent = "#3F3F3F"
    theme.bg_systray = dracula.background

    -- Borders

    theme.border_width = dpi(2)
    theme.border_normal = dracula.comment
    theme.border_focus = dracula.purple
    theme.border_marked = "#CC9393"

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

    theme.taglist_bg_empty = dracula.background
    theme.taglist_bg_occupied = dracula.background
    theme.taglist_bg_urgent = "linear:0,0:"
        .. dpi(40)
        .. ",0:0,"
        .. dracula.pink
        .. ":0.08,"
        .. dracula.pink
        .. ":0.08,"
        .. dracula.background
        .. ":1,"
        .. dracula.background
    theme.taglist_bg_focus = "linear:0,0:"
        .. dpi(40)
        .. ",0:0,"
        .. dracula.currentLine
        .. ":0.08,"
        .. dracula.currentLine
        .. ":0.08,"
        .. dracula.background
        .. ":1,"
        .. dracula.background

    -- Tasklist

    theme.tasklist_font = "JetBrainsMono Nerd Font 8"
    theme.tasklist_bg_normal = dracula.background
    theme.tasklist_bg_focus = "linear:0,0:0,"
        .. dpi(40)
        .. ":0,"
        .. dracula.background
        .. ":0.95,"
        .. dracula.background
        .. ":0.95,"
        .. theme.fg_normal
        .. ":1,"
        .. theme.fg_normal
    theme.tasklist_bg_urgent = theme.primary.hue_800
    theme.tasklist_fg_focus = "#DDDDDD"
    theme.tasklist_fg_urgent = theme.fg_normal
    theme.tasklist_fg_normal = "#AAAAAA"

    theme.icon_theme = "Papirus-Dark"

    --Client
    theme.border_width = dpi(2)
    theme.border_focus = dracula.purple
    theme.border_normal = dracula.background
end
return {
    theme = theme,
    awesome_overrides = awesome_overrides,
}
