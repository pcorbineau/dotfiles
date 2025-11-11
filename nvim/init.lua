--General Configuration
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

-- Colorscheme
require("onedark").setup {
    style = 'deep',
}
require("onedark").load()

-- LSP configurations
vim.lsp.config("*", {})
vim.lsp.enable {
    "lua_ls",
    "nixd",
    "clangd",
}

-- Diagnostics
vim.diagnostic.config { virtual_lines = { current_line = true } }

-- Snacks
require("snacks").setup {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
}

-- Oil
require("oil").setup {
    skip_confirm_for_simple_edits = true,
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
    },
}
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil" });


-- WhichKey
require("which-key").setup {
    preset = "helix",
}

-- dropbar
vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" }) -- no background for dropbar

-- lualine
require("lualine").setup {}

-- CompileMode
vim.g.compile_mode = {
    input_word_completion = true,
    default_command = "",
}
vim.keymap.set("n", "<leader>bb", "<CMD>Compile<CR>", { desc = "CompileMode : Compile" });
vim.keymap.set("n", "<leader>br", "<CMD>Recompile<CR>", { desc = "CompileMode : Recompile" });

--blink.cmp
require("blink.cmp").setup {

}
