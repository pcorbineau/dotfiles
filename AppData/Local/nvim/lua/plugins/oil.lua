return {
    "stevearc/oil.nvim",
    opts = {
        view_options = {
            show_hidden = true,
        },
        skip_confirm_for_simple_edits = true,
    },
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Oil Parent" }
    },
}
