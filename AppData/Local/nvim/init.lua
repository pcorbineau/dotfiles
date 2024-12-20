-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.colorscheme")
require("config.config")
require("config.autocmds")
