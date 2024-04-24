return {
    "kdheepak/lazygit.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("telescope").load_extension("lazygit")
        vim.keymap.set("n", "<leader>gg", "<CMD>LazyGit<CR>", { noremap = true, silent = true })
    end
}
