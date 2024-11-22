return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- Other neotest dependencies here
        { "pcorbineau/neotest-ctest", branch = "fix-windows-diagnostics " },
    },
    keys = function()
        local neotest = require("neotest")
        local config = require("plugins.config.neotest_save_and_run")

        return {
            { "<leader>ts", function() neotest.summary.toggle() end,                                                    desc = "[Test] Summary toggle" },
            { "<leader>tf", function() config.build_before_run(function() neotest.run.run(vim.fn.expand("%")) end) end, desc = "[Test] current File" },
            { "<leader>tn", function() config.build_before_run(function() neotest.run.run() end) end,                   desc = "[Test] Nearest" },
            { "<leader>tw", function() config.build_before_run(function() neotest.run.run(vim.loop.cwd()) end) end,     desc = "[Test] Workspace" },
            {
                "<leader>tr",
                function()
                    -- This will only show the output from the test framework
                    neotest.output.open({ short = true, auto_close = true })
                end,
                desc = "[Test] Results (short)",
            },
            {
                "<leader>tR",
                function()
                    -- This will show the classic CTest log output.
                    -- The output usually spans more than can fit the neotest floating window,
                    -- so using 'enter = true' to enable normal navigation within the window
                    -- is recommended.
                    neotest.output.open({ enter = true })
                end,
                desc = "[Test] Results (full)",
            },
            -- Other keybindings
        }
    end,
    config = function()
        -- Optional, but recommended, if you have enabled neotest's diagnostic option
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    -- Convert newlines, tabs and whitespaces into a single whitespace
                    -- for improved virtual text readability
                    local message = diagnostic.message:gsub("[\r\n\t%s]+", " ")
                    -- return diagnostic.message
                    return message
                end,
            },
        }, neotest_ns)

        require("neotest").setup({
            status = {
                virtual_text = true,
                signs = true,
            },
            adapters = {
                -- Load with default config
                require("neotest-ctest").setup({})
            }
        })
    end
}
