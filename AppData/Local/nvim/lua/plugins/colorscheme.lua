local tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme "tokyonight-night"
    end
}

return tokyonight
