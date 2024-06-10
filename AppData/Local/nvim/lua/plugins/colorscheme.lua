local catppuccin = {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme "catppuccin-mocha"

        vim.cmd.hi "Comment gui=none"
    end
}

return catppuccin
