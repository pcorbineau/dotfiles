local M = {}

local plugin_list = {
    { "cmake-tools", function(plugin, run)
        plugin.build(
            {},
            function() run() end)
    end },
}

function M.build_before_run(run)
    for _, plugin in ipairs(plugin_list) do
        local plugin_name = plugin[1]
        local plugin_func = plugin[2]

        if package.loaded[plugin_name] then
            plugin_func(require(plugin_name), run)
        end
    end
end

return M
