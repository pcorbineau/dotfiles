return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>ff",  function() require("telescope.builtin").find_files() end,                                                   desc = "Find Files" },
        { "<leader>fg",  function() require("telescope.builtin").live_grep() end,                                                    desc = "Live Grep" },
        { "<leader>fh",  function() require("telescope.builtin").help_tags() end,                                                    desc = "Help Tags" },
        { "<leader>fr",  function() require("telescope.builtin").resume() end,                                                       desc = "Resume Telescope" },
        { "<leader>fa",  function() require("telescope.builtin").find_files({ no_ignore = true, follow = true, hidden = true }) end, desc = "Find all files" },
        { "gr",          function() require("telescope.builtin").lsp_references() end,                                               desc = "LSP references" }, -- override default gr
        { "<leader>lds", function() require("telescope.builtin").lsp_document_symbols() end,                                         desc = "Document Symbols" },
        { "<leader>lwd", function() require("telescope.builtin").diagnostics({ bufnr = nil }) end,                                   desc = "Workspace diagnostics" },
    },
    opts = function()
        require("plugins.config.telescope_layout")
        return {
            defaults = {
                path_display     = { "filename_first", "smart", },
                prompt_prefix    = "🔍 ",
                sorting_strategy = "ascending",
                layout_config    = {
                    horizontal = {
                        prompt_position = "top",
                    },
                },
            },
            pickers = {
                help_tags = { -- open help tags as a vertical split by default
                    mappings = {
                        i = {
                            ["<CR>"] = "select_vertical",
                        },
                        n = {
                            ["<CR>"] = "select_vertical",
                        },
                    },
                },
            },
        }
    end,
}
