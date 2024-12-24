local compact_mode_map = {
    ["NORMAL"] = "N",
    ["O-PENDING"] = "N?",
    ["INSERT"] = "I",
    ["VISUAL"] = "V",
    ["V-BLOCK"] = "VB",
    ["V-LINE"] = "VL",
    ["V-REPLACE"] = "VR",
    ["REPLACE"] = "R",
    ["COMMAND"] = "!",
    ["EX"] = "X",
    ["S-BLOCK"] = "SB",
    ["S-LINE"] = "SL",
    ["SELECT"] = "S",
    ["CONFIRM"] = "Y?",
    ["MORE"] = "M",
}

local lowercase_mode_map = {
    ["NORMAL"] = "normal",
    ["O-PENDING"] = "o pending",
    ["INSERT"] = "insert",
    ["VISUAL"] = "visual",
    ["V-BLOCK"] = "visual block",
    ["V-LINE"] = "visual line",
    ["V-REPLACE"] = "visual replace",
    ["REPLACE"] = "replace",
    ["COMMAND"] = "command",
    ["EX"] = "execute",
    ["S-BLOCK"] = "select block",
    ["S-LINE"] = "select line",
    ["SELECT"] = "select",
    ["CONFIRM"] = "confirm",
    ["MORE"] = "more",
}

local mode_map = lowercase_mode_map

-- gruber colors
local gruber = {
	fg1 = "#f4f4ff",
	fg2 = "#f5f5f5",
	white = "#ffffff",
	black = "#000000",
	bg_1 = "#101010",
	bg = "#181818",
	bg1 = "#282828",
	bg2 = "#453d41",
	bg3 = "#484848",
	bg4 = "#52494e",
	red_1 = "#c73c3f",
	red = "#f43841",
	red1 = "#ff4f58",
	green = "#73c936",
	yellow = "#ffdd33",
	brown = "#cc8c3c",
	quartz = "#95a99f",
	niagara1 = "#5f627f",
	niagara = "#96a6c8",
	wisteria = "#9e95c7",
	orange = "#ff9933",
	violet = "#8e6fcc",
}

-- for lualine
local color_scheme = {
	normal = {
		a = { bg = gruber.yellow, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
	insert = {
		a = { bg = gruber.niagara, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
	visual = {
		a = { bg = gruber.green, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
	replace = {
		a = { bg = gruber.wisteria, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
	command = {
		a = { bg = gruber.orange, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
	inactive = {
		a = { bg = gruber.yellow, fg = gruber.black, gui = "bold" },
		b = { bg = gruber.bg2, fg = gruber.white },
		c = { bg = gruber.bg1, fg = gruber.white },
	},
}

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    -- theme = "zenburn",
                    globalstatus = true,
                    -- component_separators = { left = "", right = "" },
                    -- section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            fmt = function(s)
                                return mode_map[s] or s
                            end,
                        },
                    },
                },
            })
        end,
    },
}
