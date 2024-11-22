local telescope_style = "borderless"

local colors = { -- onedark base30 colors
    -- black = "#0c0e15",
    bg0 = "#1a212e",
    bg1 = "#21283b",
    bg2 = "#283347",
    bg3 = "#2a324a",
    bg_d = "#141b24",
    bg_blue = "#54b0fd",
    bg_yellow = "#f2cc81",
    fg = "#93a4c3",
    purple = "#c75ae8",
    green = "#8bcd5b",
    orange = "#dd9046",
    blue = "#41a7fc",
    yellow = "#efbd5d",
    cyan = "#34bfd0",
    red = "#f65866",
    grey = "#455574",
    light_grey = "#6c7d9c",
    dark_cyan = "#1b6a73",
    dark_red = "#992525",
    dark_yellow = "#8f610d",
    dark_purple = "#862aa1",
    diff_add = "#27341c",
    diff_delete = "#331c1e",
    diff_change = "#102b40",
    diff_text = "#1c4a6e",

    -- missing black2, darker_black, one_bg, one_bg3
    -- black is bg0
    black = "#1a212e",
    --black 2 is rgb black with 0x06 offset
    black2 = "#202734",
    -- one_bg is rgb black2 with 0x04 offset
    one_bg = "#242b3a",
    -- one_bg2 is rgb one_bg with 0x0A offset
    one_bg2 = "#2e3544",
    -- one_bg3 is rgb one_bg2 with 0x0A offset
    one_bg3 = "#383f4e",
    --darker_black is black with -0x05 offset
    darker_black = "#151c29",
}

local hlgroups = {

    TelescopePromptPrefix = {
        fg = colors.red,
        bg = colors.black2, --missing
    },

    TelescopeNormal = { bg = colors.darker_black }, -- missing

    TelescopePreviewTitle = {
        fg = colors.black,
        bg = colors.green,
    },

    TelescopePromptTitle = {
        fg = colors.black,
        bg = colors.red,
    },

    TelescopeSelection = { bg = colors.black2, fg = colors.white },
    TelescopeResultsDiffAdd = { fg = colors.green },
    TelescopeResultsDiffChange = { fg = colors.yellow },
    TelescopeResultsDiffDelete = { fg = colors.red },

    TelescopeMatching = { bg = colors.one_bg, fg = colors.blue },
}

local styles = {
    borderless = {
        TelescopeBorder = { fg = colors.darker_black, bg = colors.darker_black },
        TelescopePromptBorder = { fg = colors.black2, bg = colors.black2 },
        TelescopePromptNormal = { fg = colors.white, bg = colors.black2 },
        TelescopeResultsTitle = { fg = colors.darker_black, bg = colors.blue },
        TelescopePromptPrefix = { fg = colors.red, bg = colors.black2 },
    },

    bordered = {
        TelescopeBorder = { fg = colors.one_bg3 },
        TelescopePromptBorder = { fg = colors.one_bg3 },
        TelescopeResultsTitle = { fg = colors.black, bg = colors.green },
        TelescopePreviewTitle = { fg = colors.black, bg = colors.blue },
        TelescopePromptPrefix = { fg = colors.red, bg = colors.black },
        TelescopeNormal = { bg = colors.black },
        TelescopePromptNormal = { bg = colors.black },
    },
}

local result = vim.tbl_deep_extend("force", hlgroups, styles[telescope_style])

-- add result hl_groups to nvim
for name, hl in pairs(result) do
    vim.api.nvim_set_hl(0, name, hl)
end
