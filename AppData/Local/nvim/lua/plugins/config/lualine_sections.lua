local M = {}

local function load_cmake_or_nil()
    return package.loaded["cmake-tools"] and require("cmake-tools") or nil
end

local sections = {
    lualine_c = {
        "filename",
    },
    lualine_x = {
    },
}

local function add_to(lualine_letter, component)
    table.insert(sections[lualine_letter], component)
end

-- Add CMake Preset or Buildtype to lualine
add_to("lualine_c", {
    function()
        local cmake = require("cmake-tools")
        local preset = cmake.get_configure_preset()
        return "CMake: [" .. (preset and preset or "X") .. "]"
    end,
    cond = function()
        local cmake = load_cmake_or_nil()
        return cmake and cmake.is_cmake_project() and cmake.has_cmake_preset()
    end,
})
add_to("lualine_c", {
    function()
        local cmake = require("cmake-tools")
        local type = cmake.get_build_type()
        return "CMake: [" .. (type and type or "") .. "]"
    end,
    cond = function()
        local cmake = load_cmake_or_nil()
        return cmake and cmake.is_cmake_project() and not cmake.has_cmake_preset()
    end,
})

-- Add CMake kit if preset
add_to("lualine_c", {
    function()
        local cmake = require("cmake-tools")
        local kit = cmake.get_kit()
        return "[" .. kit .. "]"
    end,
    cond = function()
        local cmake = load_cmake_or_nil()
        if not cmake or not cmake.is_cmake_project() or not cmake.has_cmake_preset() then
            return false
        end
        return cmake.get_kit() ~= nil
    end,
})

-- Add CMake build preset
add_to("lualine_c", {
    function()
        local cmake = require("cmake-tools")
        local build_preset = cmake.get_build_preset()
        return "[" .. build_preset .. "]"
    end,
    cond = function()
        local cmake = load_cmake_or_nil()
        if not cmake or not cmake.is_cmake_project() or not cmake.has_cmake_preset() then
            return false
        end
        return cmake.get_build_preset() ~= nil
    end,
})

-- Add CMake build target
add_to("lualine_c", {
    function()
        local cmake = require("cmake-tools")
        local target = cmake.get_build_target()
        return "[" .. target .. "]"
    end,
    icon = "",
    cond = function()
        local cmake = load_cmake_or_nil()
        if not cmake or not cmake.is_cmake_project() then
            return false
        end
        return cmake.get_build_target() ~= nil
    end,
})

-- Add CMake Launch target
add_to("lualine_c", {
    function()
        local cmake = require("cmake-tools")
        local target = cmake.get_launch_target()
        return "[" .. target .. "]"
    end,
    icon = '󱓟',
    cond = function()
        local cmake = load_cmake_or_nil()
        if not cmake or not cmake.is_cmake_project() then
            return false
        end
        return cmake.get_launch_target() ~= nil
    end,
})
add_to("lualine_x",
    {
        function()
            return require("noice").api.status.lsp_progress.get_hl()
        end,
        cond = function()
            return package.loaded["noice"] and require("noice").api.status.lsp_progress.has()
        end,
    })
add_to("lualine_x",
    {
        "copilot",
        show_colors = true,
    })
add_to("lualine_x", "filetype")

M.sections = sections

return M
