local open_hx = {}

local w = require 'wezterm'

function open_hx.existing_direction(window, pane, url, direction)
    local hx_pane = pane:tab():get_pane_direction(direction)
    if hx_pane then
        local action = w.action.SendString(':open ' .. url .. ' \r\n')
        window:perform_action(action, hx_pane)
        hx_pane:activate()
        return true
    end
    return false
end

function open_hx.direction(window, pane, url, direction)
    local action = w.act {
        SplitPane = {
            direction = direction,
            command = { args = { 'hx', url } }
        }
    }
    window:perform_action(action, pane)
end

function open_hx.open(window, pane, url)
    if open_hx.existing_direction(window, pane, url, 'Up') == false then
        if open_hx.existing_direction(window, pane, url, 'Left') == false then
            open_hx.direction('Up')
        end
    end
end

return open_hx
