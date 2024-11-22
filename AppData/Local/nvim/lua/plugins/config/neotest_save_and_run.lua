local M = {}

local plugin_list = {
    {
        filetypes = { "cpp", "c", "cmake" },
        name = "cmake-tools",
        func = function(plugin, run)
            plugin.build(
                {},
                function() run() end)
        end
    },
}

local function get_plugin()
    local current_bufnr = vim.api.nvim_get_current_buf()
    local filetype = vim.fn.getbufvar(current_bufnr, '&filetype')

    for _, plugin in ipairs(plugin_list) do
        if vim.tbl_contains(plugin.filetypes, filetype) then
            return plugin
        end
    end

    -- not founded plugin
    return nil
end

function M.build_before_run(run)
    if run == nil then
        vim.notify("run callback is not defined")
    end

    local plugin = get_plugin()
    if plugin == nil then
        run()
        return
    end

    if plugin.func == nil then
        vim.notify("neotest config : plugin.func not defined for " .. plugin.name)
    else
        local pkg = require(plugin.name)
        if pkg == nil then
            vim.inspect("failed to load " .. plugin.name .. " plugin from neotest config")
        else
            plugin.func(pkg, run)
        end
    end
end

return M
