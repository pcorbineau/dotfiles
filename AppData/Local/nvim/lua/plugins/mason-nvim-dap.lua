return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    opts = {
        ensure_installed = { "codelldb" },
        automatic_install = true,
        handlers = {
            function(config)
                require("mason-nvim-dap").default_setup(config)
            end,
            codelldb = function(config)
                config.adapter = {
                    type = "server",
                    port = "${port}",
                    host = "127.0.0.1",
                    executable = {
                        command = "codelldb",
                        args = {
                            "--port",
                            "${port}",
                            "--settings",
                            vim.json.encode {
                                showDisassembly = "never",
                            },
                        },
                    },
                }

                require("mason-nvim-dap").default_setup(config)
            end
        },
    },
}
