return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons',
        'AndreM222/copilot-lualine' },
    config = function()
        require('lualine').setup({
            sections = {
                lualine_x = {
                    {
                        'copilot',
                        show_colors = true
                    },
                    'encoding',
                    'fileformat',
                    'filetype',
                }
            }
        })
    end,
}
