local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true
config.harfbuzz_features = { "calt=0" }
-- config.use_fancy_tab_bar = false
-- config.show_new_tab_button_in_tab_bar = false
-- config.show_tab_index_in_tab_bar = false
-- config.tab_bar_at_bottom = true
-- config.window_background_opacity = 0.96

-- Font and theme
-- TODO: remove the unused fonts
local fonts = {
    "Terminess Nerd Font",
    "ZedMono Nerd Font",
    "MesloLGM Nerd Font",
    "Hack-ZeroSlash",
    "Monaco",
    "Iosevka Nerd Font",
    "JetBrainsMonoNL Nerd Font",
    "FiraMono Nerd Font",
    "UbuntuSansMono Nerd Font",
    "RobotoMono Nerd Font",
    "FantasqueSansM Nerd Font",
    "RecMonoLinear Nerd Font",
}

config.font = wezterm.font(fonts[3])
config.font_size = 12.0

local color_schemes = {
    "nord",
    "nordfox",
    "GruvboxDark",
    "GruvboxDarkHard",
    "Gruvbox dark, hard (base16)",
    "Gruber (base16)",
    "Bamboo",
    "Twilight (Gogh)",
    "s3r0 modified (terminal.sexy)",
    "Sweet Love (terminal.sexy)",
    "Subliminal",
    "Grayscale Dark (base16)",
    "Green Screen (base16)",
    "Black Metal (Burzum) (base16)", -- gray light
    "Black Metal (Marduk) (base16)", -- gray
    "Black Metal (Gorgoroth) (base16)", -- gray warm
    "Black Metal (Nile) (base16)",
    "Black Metal (Immortal) (base16)", -- bluish
    "Black Metal (Bathory) (base16)", -- orange
    "Black Metal (Mayhem) (base16)", -- yellow
}

config.color_scheme = color_schemes[17]

config.colors = {
    -- background = "#0C0C0C"
    background = "#101010"
}

-- No edges
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.inactive_pane_hsb = {
    saturation = 1,
    brightness = 0.8,
}

-- Leader modifier is active when Shift and Space keys are pressed
config.leader = { key = "Space", mods = "SHIFT" }

-- In Leader mode you can choose these
config.keys = {
    -- Activate pane selection mode with the default alphabet
    {
        key = "s",
        mods = "LEADER",
        action = act.PaneSelect,
    },
    -- Show the pane selection mode, but have it swap the active and selected panes
    {
        key = "p",
        mods = "LEADER",
        action = act.PaneSelect({
            mode = "SwapWithActive",
        }),
    },
    -- Resize Pane mode
    {
        key = "r",
        mods = "LEADER",
        action = act.ActivateKeyTable({
            name = "resize_pane",
            one_shot = false,
        }),
    },
    -- Activate Pane
    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
    -- Toggle Vertical Split
    {
        key = "m",
        mods = "LEADER",
        action = wezterm.action_callback(function(_, pane)
            local tab = pane:tab()
            local panes = tab:panes_with_info()
            if #panes == 1 then
                pane:split({
                    direction = "Right",
                    size = 0.4,
                })
            elseif not panes[1].is_zoomed then
                panes[1].pane:activate()
                tab:set_zoomed(true)
            elseif panes[1].is_zoomed then
                tab:set_zoomed(false)
                panes[2].pane:activate()
            end
        end),
    },
    {
        key = "n",
        mods = "LEADER",
        action = wezterm.action_callback(function(_, pane)
            local tab = pane:tab()
            local panes = tab:panes_with_info()
            if #panes == 1 then
                pane:split({
                    direction = "Bottom",
                    size = 0.4,
                })
            elseif not panes[1].is_zoomed then
                panes[1].pane:activate()
                tab:set_zoomed(true)
            elseif panes[1].is_zoomed then
                tab:set_zoomed(false)
                panes[2].pane:activate()
            end
        end),
    },
}

-- Keybinds
config.key_tables = {
    -- In Resize Pane mode these are available
    resize_pane = {
        { key = "h",      action = act.AdjustPaneSize({ "Left", 1 }) },
        { key = "l",      action = act.AdjustPaneSize({ "Right", 1 }) },
        { key = "k",      action = act.AdjustPaneSize({ "Up", 1 }) },
        { key = "j",      action = act.AdjustPaneSize({ "Down", 1 }) },
        { key = "Escape", action = "PopKeyTable" },
    },
}

-- Must return
return config
