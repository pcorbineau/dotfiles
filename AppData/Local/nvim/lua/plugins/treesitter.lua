return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead",
    opts = {
        ensure_installed = { "cpp", "lua", "python", "markdown", "markdown_inline" },
        highlight = {
            enable = true,
        },
    },
}
