return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.install'.prefer_git = false

        local configs = require("nvim-treesitter.configs")
        configs.setup {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
            auto_install = true,
        }
    end,
}
