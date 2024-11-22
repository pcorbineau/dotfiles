local M = {}
local last_run = nil

-- create dictionary for dapui keys
local dapui_keys = {
    { "pause", "<F4>", "<cmd>lua require(\"dap\").pause()<cr>", " (󱊮)" },
    { "play", "<F5>", "<cmd>lua require(\"dap\").continue()<cr>", " (󱊯)" },
    { "step_into", "<F11>", "<cmd>lua require(\"dap\").step_into()<cr>", " (󱊵)" },
    { "step_over", "<F10>", "<cmd>lua require(\"dap\").step_over()<cr>", " (󱊴)" },
    { "step_out", "<S-F11>", "<cmd>lua require(\"dap\").step_out()<cr>", " (󰘶 󱊵)" },
    { "step_back", "<F9>", "<cmd>lua require(\"dap\").step_back()<cr>", " (󱊳)" },
    { "run_last", "<C-F5>", M.dap_run_last, " (󰘴 󱊯)" },
    { "terminate", "<S-F5>", "<cmd>lua require(\"dap\").disconnect()<cr>", " (󰘶 󱊯)" },
    { "disconnect", "<leader>dd", "<cmd>lua require(\"dap\").disconnect()<cr>", " (󱁐 dd)" },
}

local keys = {}
for _, key in ipairs(dapui_keys) do
    table.insert(keys, { key[2], key[3], desc = key[1] })
end
table.insert(keys, { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" })
table.insert(keys, { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Dap toggle breakpoint" })

table.insert(keys, { "<leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<cr>", desc = "Dap hover" })
table.insert(keys, { "<leader>dp", "<cmd>lua require('dap.ui.widgets').preview()<cr>", desc = "Dap preview" })
table.insert(keys,
    {
        "<leader>dt",
        "<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').threads)<cr>",
        desc =
        "Dap threads"
    })
table.insert(keys,
    {
        "<leader>df",
        "<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames)<cr>",
        desc =
        "Dap frames"
    })
table.insert(keys,
    {
        "<leader>ds",
        "<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<cr>",
        desc =
        "Dap scopes"
    })

local icons_from_keys = {}
for _, key in ipairs(dapui_keys) do
    icons_from_keys[key[1]] = key[4]
end

-- Reimplement last_run to store the config
-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
function M.dap_run_last()
    local dap = require("dap")
    if last_run and last_run.config then
        dap.run(last_run.config)
    else
        dap.continue()
    end
end

M.dapui_keys = dapui_keys
M.keys = keys
M.icons_from_keys = icons_from_keys

return M
