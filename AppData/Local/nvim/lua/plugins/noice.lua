return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        status = {
            lsp_progress = {
                event = "lsp",
                kind = "progress",
            },
        },
        messages = {
            enabled = false,
        },
        notify = {
            enabled = false,
        },
        lsp = {
            hover = { enabled = false },
            signature = { enabled = false },
        },
        routes = {
            {
                filter = {
                    event = "lsp",
                    kind = "progress",
                },
                opts = { skip = true },
            }
        },
    },
}
