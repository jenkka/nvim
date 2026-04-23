return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                dependencies = { "nvim-neotest/nvim-nio" },
            },
            {
                "leoluz/nvim-dap-go",
                opts = {},
            },
        },
        keys = {
            { "<F5>",       function() require("dap").continue() end,
                desc = "DAP continue" },
            { "<F10>",      function() require("dap").step_over() end,
                desc = "DAP step over" },
            { "<F11>",      function() require("dap").step_into() end,
                desc = "DAP step into" },
            { "<F12>",      function() require("dap").step_out() end,
                desc = "DAP step out" },
            { "<leader>b",  function() require("dap").toggle_breakpoint() end,
                desc = "Toggle breakpoint" },
            { "<leader>B",  function()
                require("dap").set_breakpoint(
                    vim.fn.input("Condition: "))
            end, desc = "Conditional breakpoint" },
            { "<leader>dr", function() require("dap").repl.open() end,
                desc = "DAP REPL" },
            { "<leader>dl", function() require("dap").run_last() end,
                desc = "DAP run last" },
            { "<leader>du", function() require("dapui").toggle() end,
                desc = "Toggle DAP UI" },
            { "<leader>dt", function() require("dap-go").debug_test() end,
                desc = "Debug Go test" },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()

            -- Auto-open/close UI with debug session
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            -- Breakpoint sign
            vim.fn.sign_define("DapBreakpoint",
                { text = "●", texthl = "DiagnosticError",
                    linehl = "", numhl = "" })
        end,
    },
}
