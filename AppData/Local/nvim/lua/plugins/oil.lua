return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
      require("oil").setup({
          view_options = {
              show_hidden = true,
          },
          keymaps = {
               ['y.'] = 'actions.copy_entry_path',
           },
      }) -- use default options
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })
  end,
}
