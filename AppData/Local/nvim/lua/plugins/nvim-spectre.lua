return {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        { "<leader>S",  function() require("spectre").toggle() end,                                 desc = "Toggle Spectre" },
        { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end,      mode = { "n", "v" },            desc = "Search current word" },
        { "<leader>sp", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Search on current file" },
    },
}
