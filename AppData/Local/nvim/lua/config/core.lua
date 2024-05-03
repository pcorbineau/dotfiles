-- Set leader key as <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable auto format
vim.g.autoformat = true

local opt = vim.opt

-- Copy to clipboard
opt.clipboard = 'unnamedplus'

opt.wrap = false

opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4      -- Number of spaces tabs count for
opt.shiftwidth = 4
opt.softtabstop = 4

opt.cursorline = true     -- Enable highlighting of the current line
opt.number = true         -- Print line number
opt.relativenumber = true -- Relative number line
opt.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift the text each time

opt.termguicolors = true  -- True color support

opt.pumheight = 10        -- Makes popup menu smaller

-- Enable non Capitialized search
opt.ignorecase = true
opt.smartcase = true

opt.conceallevel = 2

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable error format parsing for msvc and cl.exe:
-- MSBuild:
vim.opt.errorformat:append([[\ %#%f(%l\,%c):\ %m]])
-- cl.exe:
vim.opt.errorformat:append([[\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m]])
-- clang / gcc
vim.opt.errorformat:append([[%E%f:%l:%c:\ %trror:\ %m,%-Z%p^,%+C%.%#]])

-- Enable auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
        vim.lsp.buf.format { async = false }
    end
})
