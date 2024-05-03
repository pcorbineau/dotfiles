return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  keys = {
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
      { "<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
      { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
      { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Follow link under cursor", mode = "n" },
      { "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "Switch Obsidian vault", mode = "n" },
      { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Open Obsidian Today note", mode = "n" },
      { "<leader>ot", "<cmd>ObsidianTomorrow<cr>", desc = "Open Obsidian Tomorrow note", mode = "n" },
  },
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "pcorbineau",
        path = "D:\\obsidian\\pcorbineau\\pcorbineau",
      },
      {
        name = "shadow",
        path = "D:\\obsidian\\shadow\\Shadow",
      },
    },

    -- see below for full list of options 👇
  },
}
