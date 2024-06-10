return {
    "kdheepak/lazygit.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>gg", "<CMD>LazyGit<CR>", desc = "LazyGit" },
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end
}
