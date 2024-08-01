local wezterm = require 'wezterm'
local hx = require 'open_helix'
local act = wezterm.action
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
-- config.show_tab_index_in_tab_bar = false
config.harfbuzz_features = { 'calt=0' }

-- Font and theme
-- config.font = wezterm.font 'Iosevka Nerd Font Propo'
config.font = wezterm.font 'FiraCode Retina'
config.font_size = 12.0
-- config.color_scheme = 'Gruber (base16)'
-- config.color_scheme = 'Tangoesque (terminal.sexy)'
config.color_scheme = 'Catppuccin Mocha (Gogh)'

-- config.window_frame = {
--     font = wezterm.font { family = 'UbuntuSansMono Nerd Font' },
--     font_size = 14.0,
--     active_titlebar_bg = '#282828',
--     inactive_titlebar_bg = '#282828',
-- }

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


-- Leader modifier is active when Shift and Space keys are pressed
config.leader = { key = 'Space', mods = 'SHIFT' }

-- In Leader mode you can choose these
config.keys = {
    -- Activate pane selection mode with the default alphabet
    {
        key = 's',
        mods = 'LEADER',
        action = act.PaneSelect
    },
    -- Show the pane selection mode, but have it swap the active and selected panes
    {
        key = 'p',
        mods = 'LEADER',
        action = act.PaneSelect {
            mode = 'SwapWithActive',
        },
    },
    -- Resize Pane mode
    {
        key = 'r',
        mods = 'LEADER',
        action = act.ActivateKeyTable {
            name = 'resize_pane',
            one_shot = false,
        },
    },
    -- Activate Pane
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
    { key = 'q', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },
    -- Toggle Vertical Split
    {
        key = 'm',
        mods = 'LEADER',
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
        key = 'n',
        mods = 'LEADER',
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
    {
        key = 'g',
        mods = 'LEADER',
        action = act.QuickSelectArgs {
            label = 'open url',
            patterns = { 
                '[^ ]+\\.rs:\\d+:\\d+',
                '[^ ]+\\.asm:\\d+:\\d+',
                '[^ ]+\\.cpp:\\d+:\\d+',
                '[^ ]+\\.c:\\d+:\\d+',
                '[^ ]+\\.h:\\d+:\\d+',
                '[^ ]+\\.lox:\\d+:\\d+',
            },
            action = wezterm.action_callback(function(window, pane)
                local url = window:get_selection_text_for_pane(pane)
                hx.open(window, pane, url)
            end),
        },
    }
}

-- Keybinds
config.key_tables = {
    -- In Resize Pane mode these are available
    resize_pane = {
        { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },
        { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },
        { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },
        { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },
        { key = 'Escape',     action = 'PopKeyTable' },
    },

}

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Regex for file:line:column links
-- Rust, C, C++, Header
table.insert(config.hyperlink_rules, {
    regex = [[[^ ]+\.(rs|c|cpp|h|p|asm|lox):\d+:\d+]],
    format = '$0',
})

-- Url onclick handler
wezterm.on('open-uri', function(window, pane, uri)
    -- Check if the link is an HTTPS link
    if uri:sub(1, 8) == 'https://' then
        window:perform_action(
            act.SpawnCommandInNewWindow { args = { 'firefox', uri } },
            pane
        )
    -- Custom action for file:line:col links
    elseif uri:match("[^ ]+%.[^ ]+:%d+:%d+") then
        hx.open(window, pane, uri)
    -- Otherwise can't resolve
    else
        return false
    end
end)

wezterm.on('update-right-status', function(window, pane)
    local stat = window:active_workspace()
    if window:leader_is_active() then stat = "LEADER " end
    if window:active_key_table() then stat = window:active_key_table() end

    local cmd = pane:get_foreground_process_name()
    local time = wezterm.strftime("%H:%M %A %d.%m.%Y")
    -- window:set_right_status(stat)
     local host  = wezterm.hostname();

    window:set_right_status(wezterm.format({
        -- { Foreground = { Color = "a89984" } },
        { Text = " | "},
        -- "ResetAttributes",
        -- { Foreground = { Color = "e4e4ef" } },
        { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
        -- "ResetAttributes",
        -- { Foreground = { Color = "a89984" } },
        { Text = " | "},
        -- "ResetAttributes",
        -- { Foreground = { Color = "e4e4ef" } },
        { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
        -- "ResetAttributes",
        -- { Foreground = { Color = "a89984" } },
        { Text = " | "},
        -- "ResetAttributes",
        -- { Foreground = { Color = "e4e4ef" } },
        { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
        -- "ResetAttributes",
        -- { Foreground = { Color = "a89984" } },
        { Text = " | "},
        -- "ResetAttributes",
        -- { Foreground = { Color = "e4e4ef" } },
        { Text = wezterm.nerdfonts.oct_person .. "  " .. host },
        -- "ResetAttributes",
        -- { Foreground = { Color = "a89984" } },
        { Text = " | "},
        "ResetAttributes",
    }))
end)

-- Must return
return config
