return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "onsails/lspkind.nvim",
        { "zbirenbaum/copilot-cmp", opts = {} },
    },
    config = function()
        local cmp     = require("cmp")
        local lspkind = require("lspkind")

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol",
                    max_width = 50,
                    symbol_map = { Copilot = "" },
                })
            },
            window = {
                completion = cmp.config.window.bordered({}),
                documentation = cmp.config.window.bordered({}),
            },
            sources = {
                { name = "copilot",  group_index = 2 },
                { name = "nvim_lsp", group_index = 2 },
                { name = "buffer",   group_index = 2 },
            },
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-q>"] = cmp.mapping.close(),
                ["<C-y>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
            },
        })
    end,
}
