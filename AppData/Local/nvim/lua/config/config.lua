local opt = vim.opt

-- clipboard system
opt.clipboard = "unnamedplus"

-- tab config
opt.softtabstop = 4
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true

-- line number
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.pumheight = 10 -- Makes popup menu smaller

-- ignore case when searching
opt.ignorecase = true -- all searches will be case insensitive
opt.smartcase = true  -- search will be case sensitive if it contains an uppercase letter

-- General Settings
local general = vim.api.nvim_create_augroup("General", { clear = true })

-- disable auto comment on newline
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "set formatoptions-=cro",
    group = general,
    desc = "Disable new line comment",
})
