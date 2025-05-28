return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
    },
    config = function()
        local dap = require "dap"
        local ui = require "dapui"

        require("dapui").setup()
        require("dap-go").setup()

        require("nvim-dap-virtual-text").setup {
            -- This just tries to mitigate the chance that I leak tokens here.
            -- Probably won't stop it from happening...
            display_callback = function(variable)
                local name = string.lower(variable.name)
                local value = string.lower(variable.value)
                if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
                    return "*****"
                end

                if #variable.value > 15 then
                    return " " .. string.sub(variable.value, 1, 15) .. "... "
                end

                return " " .. variable.value
            end,
        }

        -- Handled by nvim-dap-go
        dap.adapters.go = {
            type = "server",
            port = "${port}",
            executable = {
                command = "dlv",
                args = { "dap", "-l", "127.0.0.1:${port}" },
            },
        }

        local elixir_ls_debugger = vim.fn.exepath "elixir-ls-debugger"
        if elixir_ls_debugger ~= "" then
            dap.adapters.mix_task = {
                type = "executable",
                command = elixir_ls_debugger,
            }

            dap.configurations.elixir = {
                {
                    type = "mix_task",
                    name = "phoenix server",
                    task = "phx.server",
                    request = "launch",
                    projectDir = "${workspaceFolder}",
                    exitAfterTaskReturns = false,
                    debugAutoInterpretAllModules = false,
                },
            }
        end


        -- C/C++/Rust (via LLDB)
        dap.adapters.lldb = {
            type = 'executable',
            command = '/usr/bin/lldb-dap',
            name = 'lldb'
        }

        dap.configurations.cpp = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
            },
        }

        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp


        -- Python
        dap.adapters.python = {
            type = 'executable',
            command = '/usr/bin/python',
            args = { '-m', 'debugpy.adapter' },
        }

        dap.configurations.python = {
            {
                type = 'python',
                request = 'launch',
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    return '/usr/bin/python'
                end,
            },
        }


        vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

        -- Eval var under cursor
        vim.keymap.set("n", "<space>?", function()
            require("dapui").eval(nil, { enter = true })
        end)

        vim.keymap.set("n", "<F1>", dap.continue)
        vim.keymap.set("n", "<F2>", dap.step_into)
        vim.keymap.set("n", "<F3>", dap.step_over)
        vim.keymap.set("n", "<F4>", dap.step_out)
        vim.keymap.set("n", "<F5>", dap.step_back)
        vim.keymap.set("n", "<F12>", dap.restart)

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}

-- return {
--     {
--         "rcarriga/nvim-dap-ui",
--         dependencies = {
--             "mfussenegger/nvim-dap",
--             "nvim-neotest/nvim-nio",
--         },
--         config = function()
--             local dap, dapui = require("dap"), require("dapui")
--
--
--             dap.adapters.coreclr = {
--                 type = 'executable',
--                 command = '/usr/local/bin/netcoredbg/netcoredbg',
--                 args = { '--interpreter=vscode' }
--             }
--
--             dap.configurations.cs = {
--                 {
--                     type = "coreclr",
--                     name = "launch - netcoredbg",
--                     request = "launch",
--                     env = "ASPNETCORE_ENVIRONMENT=Development",
--                     args = function()
--                         return {
--                             vim.fn.input("Arguments: ", "file")
--                         }
--                         -- "/p:EnvironmentName=Development", -- this is a msbuild jk
--                         -- "--urls=http://localhost:5002",
--                         -- "--environment=Development",
--                     end,
--                     program = function()
--                         return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
--                     end,
--                 },
--             }
--
--             dap.adapters.gdb = {
--                 type = "executable",
--                 command = "gdb",
--                 args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
--             }
--
--             dap.configurations.c = {
--                 {
--                     name = "Launch",
--                     type = "gdb",
--                     request = "launch",
--                     program = function()
--                         return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--                     end,
--                     cwd = "${workspaceFolder}",
--                     stopAtBeginningOfMainSubprogram = false,
--                 },
--                 -- {
--                 --     name = "Select and attach to process",
--                 --     type = "gdb",
--                 --     request = "attach",
--                 --     program = function()
--                 --         return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--                 --     end,
--                 --     pid = function()
--                 --         local name = vim.fn.input("Executable name (filter): ")
--                 --         return require("dap.utils").pick_process({ filter = name })
--                 --     end,
--                 --     cwd = "${workspaceFolder}",
--                 -- },
--             }
--
--             dap.configurations.cpp = {
--                 {
--                     name = "Launch",
--                     type = "gdb",
--                     request = "launch",
--                     program = function()
--                         return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--                     end,
--                     cwd = "${workspaceFolder}",
--                     stopAtBeginningOfMainSubprogram = false,
--                 },
--             }
--
--             dapui.setup({
--                 icons = { expanded = "", collapsed = "", current_frame = "" },
--                 mappings = {
--                     -- Use a table to apply multiple mappings
--                     expand = { "<CR>", "<2-LeftMouse>" },
--                     open = "o",
--                     remove = "d",
--                     edit = "e",
--                     repl = "r",
--                     toggle = "t",
--                 },
--                 -- Use this to override mappings for specific elements
--                 element_mappings = {
--                     -- Example:
--                     -- stacks = {
--                     --   open = "<CR>",
--                     --   expand = "o",
--                     -- }
--                 },
--                 -- Expand lines larger than the window
--                 -- Requires >= 0.7
--                 expand_lines = vim.fn.has("nvim-0.7") == 1,
--                 -- Layouts define sections of the screen to place windows.
--                 -- The position can be "left", "right", "top" or "bottom".
--                 -- The size specifies the height/width depending on position. It can be an Int
--                 -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
--                 -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
--                 -- Elements are the elements shown in the layout (in order).
--                 -- Layouts are opened in order so that earlier layouts take priority in window sizing.
--                 layouts = {
--                     {
--                         elements = {
--                             -- Elements can be strings or table with id and size keys.
--                             { id = "scopes", size = 0.25 },
--                             "breakpoints",
--                             "stacks",
--                             "watches",
--                         },
--                         size = 40, -- 40 columns
--                         position = "left",
--                     },
--                     {
--                         elements = {
--                             "repl",
--                             "console",
--                         },
--                         size = 0.25, -- 25% of total lines
--                         position = "bottom",
--                     },
--                 },
--                 controls = {
--                     -- Requires Neovim nightly (or 0.8 when released)
--                     enabled = false,
--                     -- Display controls in this element
--                     element = "repl",
--                     icons = {
--                         -- pause = "󰏤",
--                         -- play = "",
--                         -- step_into = "",
--                         -- step_over = "",
--                         -- step_out = "",
--                         -- step_back = "",
--                         -- run_last = "",
--                         -- terminate = "",
--                     },
--                 },
--                 floating = {
--                     max_height = nil,   -- These can be integers or a float between 0 and 1.
--                     max_width = nil,    -- Floats will be treated as percentage of your screen.
--                     border = "rounded", -- Border style. Can be "single", "double" or "rounded"
--                     mappings = {
--                         close = { "q", "<Esc>" },
--                     },
--                 },
--                 windows = { indent = 1 },
--                 render = {
--                     max_type_length = nil, -- Can be integer or nil.
--                     max_value_lines = 100, -- Can be integer or nil.
--                 }
--             })
--
--             dap.listeners.before.attach.dapui_config = function()
--                 dapui.open()
--             end
--             dap.listeners.after.event_initialized["dapui_config"] = function()
--                 dapui.open()
--             end
--
--             -- vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
--             -- vim.keymap.set("n", "<leader>dc", dap.continue, {})
--             -- vim.keymap.set("n", "<leader>dj", dap.step_into, {})
--             -- vim.keymap.set("n", "<leader>dl", dap.step_over, {})
--             -- vim.keymap.set("n", "<leader>do", dap.step_out, {})
--             -- vim.keymap.set("n", "<leader>dr", dap.repl.open, {})
--             -- vim.keymap.set("n", "<leader>da", dap.run_last, {})
--             -- vim.keymap.set("n", "<leader>dt", dapui.toggle, {})
--
--             require("which-key").add({
--                 mode = { "n", "v" },
--                 { "<leader>d",  group = "debugger" },
--                 { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint() <cr> ", desc = "breakpoint", },
--                 { "<leader>dc", "<cmd>lua require'dap'.continue()          <cr> ", desc = "continue" },
--                 { "<leader>dj", "<cmd>lua require'dap'.step_into()         <cr> ", desc = "step into" },
--                 { "<leader>dl", "<cmd>lua require'dap'.step_over()         <cr> ", desc = "step over" },
--                 { "<leader>do", "<cmd>lua require'dap'.step_out()          <cr> ", desc = "step out" },
--                 { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()       <cr> ", desc = "repl" },
--                 { "<leader>dt", "<cmd>lua require'dapui'.toggle()          <cr> ", desc = "dapui" },
--             })
--         end,
--     },
-- }
