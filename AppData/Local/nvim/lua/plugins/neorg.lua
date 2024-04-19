return {
    "nvim-neorg/neorg",
    dependencies = {
        "luarocks.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
    opts = {
        load = {
            ["core.defaults"] = {},  -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.syntax"] = {},
            ["core.keybinds"] = {},  -- Adds default keybindings
            ["core.journal"] = {},   -- Enables support for the journal module
            ["core.dirman"] = {      -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        work = "$HOME/notes/work",
                        home = "$HOME/notes/home",
                    },
                },
            },
            ["core.integrations.treesitter"] = {}, -- Enables treesitter support
        },
    },
}
