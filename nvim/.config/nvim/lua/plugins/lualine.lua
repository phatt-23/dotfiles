local compact_mode_map = {
    ["NORMAL"]    = "N",
    ["O-PENDING"] = "N?",
    ["INSERT"]    = "I",
    ["VISUAL"]    = "V",
    ["V-BLOCK"]   = "VB",
    ["V-LINE"]    = "VL",
    ["V-REPLACE"] = "VR",
    ["REPLACE"]   = "R",
    ["COMMAND"]   = "!",
    ["EX"]        = "X",
    ["S-BLOCK"]   = "SB",
    ["S-LINE"]    = "SL",
    ["SELECT"]    = "S",
    ["CONFIRM"]   = "Y?",
    ["MORE"]      = "M",
}

local lowercase_mode_map = {
    ["NORMAL"]    = "normal",
    ["O-PENDING"] = "o pending",
    ["INSERT"]    = "insert",
    ["VISUAL"]    = "visual",
    ["V-BLOCK"]   = "visual block",
    ["V-LINE"]    = "visual line",
    ["V-REPLACE"] = "visual replace",
    ["REPLACE"]   = "replace",
    ["COMMAND"]   = "command",
    ["EX"]        = "execute",
    ["S-BLOCK"]   = "select block",
    ["S-LINE"]    = "select line",
    ["SELECT"]    = "select",
    ["CONFIRM"]   = "confirm",
    ["MORE"]      = "more",
}

-- gruber colors
local gruber = {
    fg1      = "#f4f4ff",
    fg2      = "#f5f5f5",
    white    = "#ffffff",
    black    = "#000000",
    bg_1     = "#101010",
    bg       = "#181818",
    bg1      = "#282828",
    bg2      = "#453d41",
    bg3      = "#484848",
    bg4      = "#52494e",
    red_1    = "#c73c3f",
    red      = "#f43841",
    red1     = "#ff4f58",
    green    = "#73c936",
    yellow   = "#ffdd33",
    brown    = "#cc8c3c",
    quartz   = "#95a99f",
    niagara1 = "#5f627f",
    niagara  = "#96a6c8",
    wisteria = "#9e95c7",
    orange   = "#ff9933",
    violet   = "#8e6fcc",
}

-- for lualine
local color_scheme = {
    normal = {
        a = { fg = gruber.yellow, bg = nil, gui = "bold" },
        b = { fg = gruber.white, bg = nil },
        c = { fg = gruber.white, bg = nil },
    },
    insert = {
        a = { fg = gruber.niagara, bg = nil, gui = "bold" },
        b = { fg = gruber.white, bg = nil },
        c = { fg = gruber.white, bg = nil },
    },
    visual = {
        a = { fg = gruber.green, bg = nil, gui = "bold" },
        b = { fg = gruber.white, bg = nil },
        c = { fg = gruber.white, bg = nil },
    },
    replace = {
        a = { fg = gruber.wisteria, bg = nil, gui = "bold" },
        b = { fg = gruber.white, bg = nil },
        c = { fg = gruber.white, bg = nil },
    },
    command = {
        a = { fg = gruber.orange, bg = nil, gui = "bold" },
        b = { fg = gruber.white, bg = nil },
        c = { fg = gruber.white, bg = nil },
    },
    inactive = {
        a = { fg = gruber.yellow, bg = nil, gui = "bold" },
        b = { fg = gruber.white, bg = nil },
        c = { fg = gruber.white, bg = nil },
    },
}


return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                globalstatus = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                -- component_separators = { left = "│", right = "│" },
                -- section_separators = { left = "", right = "" },
                -- theme = color_scheme,
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(mode)
                            -- return " " .. mode_map[mode] .. " " or mode
                            return mode
                        end,
                        color = { gui = "bold" },
                        padding = { left = 1, right = 1 },
                    },
                },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                        color = { gui = 'bold' }
                    }
                },
                lualine_x = {
                    {
                        cond = require("noice").api.statusline.mode.has,
                        require("noice").api.statusline.mode.get,
                    },
                    'encoding',
                    'fileformat',
                    'filetype',
                },
                lualine_y = { 'progress' },
                lualine_z = {
                    {
                        'location',
                        fmt = function(loc)
                            return loc
                        end,
                        color = { gui = 'bold' }
                    }
                }
            },
        })
    end,
}
