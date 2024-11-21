return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end,                                                   desc = "Find Files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end,                                                    desc = "Live Grep" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end,                                                    desc = "Help Tags" },
        { "<leader>fr", function() require("telescope.builtin").resume() end,                                                       desc = "Resume Telescope" },
        { "<leader>fa", function() require("telescope.builtin").find_files({ no_ignore = true, follow = true, hidden = true }) end, desc = "Find all files" },
    },
}
