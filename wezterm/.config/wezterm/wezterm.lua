local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--  Font and theme
config.font = wezterm.font 'UbuntuSansMono Nerd Font'
config.color_scheme = 'Gruber (base16)'

config.window_frame = {
    font = wezterm.font { family = 'UbuntuSansMono Nerd Font', weight = 'Medium' },
    font_size = 10.0,
    active_titlebar_bg = '#282828',
    inactive_titlebar_bg = '#282828',
}

-- Custom colors
config.colors = {
    selection_fg = 'none',
    selection_bg = 'rgba(30% 30% 30% 80%)',
    tab_bar = {
        inactive_tab_edge = '#282828',
        active_tab = {
            bg_color  = '#181818',
            fg_color  = '#c0c0c0',
            intensity = 'Half',
        },
        inactive_tab = {
            bg_color  = '#282828',
            fg_color  = '#c0c0c0',
            intensity = 'Half',
        },
        inactive_tab_hover = {
          bg_color    = '#303540',
          fg_color    = '#c0c0c0',
        },
    }
}

-- No edges
config.window_padding = {
    left   = 0,
    right  = 0,
    top    = 0,
    bottom = 0,
}

wezterm.on('update-right-status', function(window, _)
    local name = window:active_key_table()
        if name then
            name = 'Table: ' .. name
        end
    window:set_right_status(name or '')
end)

-- Leader modifier is active when Shift and Space keys are pressed
config.leader = { key = 'Space', mods = 'SHIFT' }

-- In Leader mode you can choose these
config.keys = {
    -- Pressing 'R' will put you into Resize Pane mode
    {
        key = 'r',
        mods = 'LEADER',
        action = wezterm.action.ActivateKeyTable {
            name = 'resize_pane',
            one_shot = false,
        },
    },
    -- Pressing 'A' will put you into Activate Pane mode
    {
        key = 'a',
        mods = 'LEADER',
        action = wezterm.action.ActivateKeyTable {
            name = 'activate_pane',
            timeout_milliseconds = 1000, -- be quick
        },
    },
}

-- Keybinds
config.key_tables = {
    -- In Resize Pane mode these are available
    resize_pane = {
        { key = 'LeftArrow',  action = wezterm.action.AdjustPaneSize { 'Left', 1 } },
        { key = 'h',          action = wezterm.action.AdjustPaneSize { 'Left', 1 } },
        { key = 'RightArrow', action = wezterm.action.AdjustPaneSize { 'Right', 1 } },
        { key = 'l',          action = wezterm.action.AdjustPaneSize { 'Right', 1 } },
        { key = 'UpArrow',    action = wezterm.action.AdjustPaneSize { 'Up', 1 } },
        { key = 'k',          action = wezterm.action.AdjustPaneSize { 'Up', 1 } },
        { key = 'DownArrow',  action = wezterm.action.AdjustPaneSize { 'Down', 1 } },
        { key = 'j',          action = wezterm.action.AdjustPaneSize { 'Down', 1 } },
        { key = 'Escape',     action = 'PopKeyTable' },
    },
    -- In Activate Pane mode these are available
    activate_pane = {
        { key = 'LeftArrow',  action = wezterm.action.ActivatePaneDirection 'Left' },
        { key = 'h',          action = wezterm.action.ActivatePaneDirection 'Left' },
        { key = 'RightArrow', action = wezterm.action.ActivatePaneDirection 'Right' },
        { key = 'l',          action = wezterm.action.ActivatePaneDirection 'Right' },
        { key = 'UpArrow',    action = wezterm.action.ActivatePaneDirection 'Up' },
        { key = 'k',          action = wezterm.action.ActivatePaneDirection 'Up' },
        { key = 'DownArrow',  action = wezterm.action.ActivatePaneDirection 'Down' },
        { key = 'j',          action = wezterm.action.ActivatePaneDirection 'Down' },
        { key = 'q',          action = wezterm.action.CloseCurrentPane { confirm = true } },
    },
}

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Regex for file:line:column links
table.insert(config.hyperlink_rules, {
    regex = [[[^ ]+\.*:\d+:\d+]],
    format = '$0',
})

-- Url onclick handler
wezterm.on('open-uri', function(window, pane, uri)
    -- Check if the link is an HTTPS link
    if uri:sub(1, 8) == 'https://' then
        window:perform_action(
            wezterm.action.SpawnCommandInNewWindow { args = { 'firefox', uri } },
            pane
        )
    -- Custom action for file:line:col links
    elseif uri:match("^[^ ]+%.*:%d+:%d+$") then
        local direction = 'Up'
        local hx_pane = pane:tab():get_pane_direction(direction)
        if hx_pane == nil then
            local action = wezterm.action {
                SplitPane = {
                    direction = 'Up',
                    command = { args = { 'hx', uri } }
                }
            }
            window:perform_action(action, pane)
        else
            local action = wezterm.action.SendString(':open ' .. uri .. '\r\n')
            window:perform_action(action, hx_pane)
        end
    -- Otherwise can't resolve
    else
        return false
    end
end)


-- Must return
return config
