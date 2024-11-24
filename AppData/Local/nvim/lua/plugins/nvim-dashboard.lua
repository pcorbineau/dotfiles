return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
    opts = function()
        return require 'alpha.themes.theta'.config
    end,
}
