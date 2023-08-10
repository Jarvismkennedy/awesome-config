local filesystem = require("gears.filesystem")

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require("beautiful").xresources.apply_dpi
local get_dpi = require("beautiful").xresources.get_dpi
local rofi_command = "env /usr/bin/rofi -dpi "
    .. get_dpi()
    .. " -width "
    .. with_dpi(400)
    .. " -show drun  -run-command \"/bin/bash -c -i 'shopt -s expand_aliases; {cmd}'\""

return {
    -- List of apps to start by default on some actions
    default = {
        terminal = "kitty",
        rofi = rofi_command,
        lock = "i3lock-fancy",
        quake = "kitty",
        screenshot = "flameshot screen -p ~/Pictures",
        region_screenshot = "flameshot gui -p ~/Pictures",
        delayed_screenshot = "flameshot screen -p ~/Pictures -d 5000",
        browser = "firefox",
        editor = "emacsclient -nca ''", -- gui text editor
        social = "slack",
        game = rofi_command,
        files = "thunar",
        music = rofi_command,
    },
    -- List of apps to start once on start-up
    run_on_start_up = {
        "picom --config '/home/jarvisk/.config/awesome/configuration/picom.conf'",
        "nm-applet --indicator", -- wifi
        "pasystray", -- shows an audiocontrol applet in systray when installed.
        "numlockx on", -- enable numlock
        "feh --bg-fill  '/home/jarvisk/wallpapers/eos_wallpapers_community/Endy_vector_satelliet.png'",
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)", -- credential manager
        "xfce4-power-manager", -- Power manager
        "flameshot",
        "synology-drive -minimized",
        "/usr/bin/variety",
        "mictray",
        -- Set the appropraite screen outputs for my dual monitor setup.
        "xrandr --output DP-4 --mode 2560x1440 --rate 239.97 --primary --output DP-2 --right-of DP-4 --mode 2560x1440 --rate 143.97 --rotate right",
        -- Add applications that need to be killed between reloads
        -- to avoid multipled instances, inside the awspawn script
        "~/.config/awesome/configuration/awspawn", -- Spawn "dirty" apps that can linger between sessions
    },
}
