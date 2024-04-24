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

local tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme "tokyonight-night"
    end
}

return { catppuccin, tokyonight }
