local dapconfig = require("plugins.config.dap")

return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
    },

    keys = dapconfig.keys,
    config = function()
        local dap = require("dap")
        local dapui_keys = dapconfig.keys
        -- allow multiple threads to be stopped
        -- dap.defaults.fallback.auto_continue_if_many_stopped = false

        local dapui = require("dapui")
        dapui.setup({
            controls = {
                icons = dapconfig.icons_from_keys,
            },
        })

        vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })

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
    end,
}
