return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        telescope.setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "-L",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                file_sorter = require("telescope.sorters").get_fuzzy_file,
                file_ignore_patterns = { "node_modules" },
                generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                path_display = { "truncate" },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                -- Developer configurations: Not meant for general override
                buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                mappings = {
                    n = { ["q"] = require("telescope.actions").close },
                },
            },

            extensions_list = { "themes", "terms" },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope help tags" })
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Telescope oldfiles" })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "Telescope resume" })
        vim.keymap.set('n', '<leader>fp', builtin.pickers, { desc = "Telescope pickers" })
        vim.keymap.set('n', '<leader>ds', function()
            builtin.lsp_document_symbols({
                previewer = false,
                symbol_width = 0.7,
            })
        end, { desc = "Telescope lsp document symbols" })
        vim.keymap.set('n', '<leader>fa', "<CMD> Telescope find_files follow=true no_ignore=true hidden=true<CR>",
            { desc = "Telescope find all files" })
    end,
}
