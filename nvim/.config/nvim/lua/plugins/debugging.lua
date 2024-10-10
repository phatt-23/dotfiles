-- return {}
return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")


            dap.adapters.coreclr = {
                type = 'executable',
                command = '/usr/local/bin/netcoredbg/netcoredbg',
                args = { '--interpreter=vscode' }
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    env = "ASPNETCORE_ENVIRONMENT=Development",
                    args = function()
                        return {
                            vim.fn.input("Arguments: ", "file")
                        }
                        -- "/p:EnvironmentName=Development", -- this is a msbuild jk
                        -- "--urls=http://localhost:5002",
                        -- "--environment=Development",
                    end,
                    program = function()
                        return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                    end,
                },
            }

            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
            }

            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
                -- {
                --     name = "Select and attach to process",
                --     type = "gdb",
                --     request = "attach",
                --     program = function()
                --         return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                --     end,
                --     pid = function()
                --         local name = vim.fn.input("Executable name (filter): ")
                --         return require("dap.utils").pick_process({ filter = name })
                --     end,
                --     cwd = "${workspaceFolder}",
                -- },
            }

            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
            }

            dapui.setup({
                icons = { expanded = "", collapsed = "", current_frame = "" },
                mappings = {
                    -- Use a table to apply multiple mappings
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                -- Use this to override mappings for specific elements
                element_mappings = {
                    -- Example:
                    -- stacks = {
                    --   open = "<CR>",
                    --   expand = "o",
                    -- }
                },
                -- Expand lines larger than the window
                -- Requires >= 0.7
                expand_lines = vim.fn.has("nvim-0.7") == 1,
                -- Layouts define sections of the screen to place windows.
                -- The position can be "left", "right", "top" or "bottom".
                -- The size specifies the height/width depending on position. It can be an Int
                -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
                -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
                -- Elements are the elements shown in the layout (in order).
                -- Layouts are opened in order so that earlier layouts take priority in window sizing.
                layouts = {
                    {
                        elements = {
                            -- Elements can be strings or table with id and size keys.
                            { id = "scopes", size = 0.25 },
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 40, -- 40 columns
                        position = "left",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 0.25, -- 25% of total lines
                        position = "bottom",
                    },
                },
                controls = {
                    -- Requires Neovim nightly (or 0.8 when released)
                    enabled = false,
                    -- Display controls in this element
                    element = "repl",
                    icons = {
                        -- pause = "󰏤",
                        -- play = "",
                        -- step_into = "",
                        -- step_over = "",
                        -- step_out = "",
                        -- step_back = "",
                        -- run_last = "",
                        -- terminate = "",
                    },
                },
                floating = {
                    max_height = nil,   -- These can be integers or a float between 0 and 1.
                    max_width = nil,    -- Floats will be treated as percentage of your screen.
                    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 1 },
                render = {
                    max_type_length = nil, -- Can be integer or nil.
                    max_value_lines = 100, -- Can be integer or nil.
                }
            })

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            -- vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
            -- vim.keymap.set("n", "<leader>dc", dap.continue, {})
            -- vim.keymap.set("n", "<leader>dj", dap.step_into, {})
            -- vim.keymap.set("n", "<leader>dl", dap.step_over, {})
            -- vim.keymap.set("n", "<leader>do", dap.step_out, {})
            -- vim.keymap.set("n", "<leader>dr", dap.repl.open, {})
            -- vim.keymap.set("n", "<leader>da", dap.run_last, {})
            -- vim.keymap.set("n", "<leader>dt", dapui.toggle, {})

            require("which-key").add({
                mode = { "n", "v" },
                { "<leader>d",  group = "debugger" },
                { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint() <cr> ", desc = "breakpoint", },
                { "<leader>dc", "<cmd>lua require'dap'.continue()          <cr> ", desc = "continue" },
                { "<leader>dj", "<cmd>lua require'dap'.step_into()         <cr> ", desc = "step into" },
                { "<leader>dl", "<cmd>lua require'dap'.step_over()         <cr> ", desc = "step over" },
                { "<leader>do", "<cmd>lua require'dap'.step_out()          <cr> ", desc = "step out" },
                { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()       <cr> ", desc = "repl" },
                { "<leader>dt", "<cmd>lua require'dapui'.toggle()          <cr> ", desc = "dapui" },
            })
        end,
    },
}
