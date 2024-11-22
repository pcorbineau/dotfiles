return {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
        "rcarriga/nvim-dap-ui", -- for CMakeDebug
    },
    keys = {
        { "<leader>cmg", "<cmd>CMakeGenerate<cr>", desc = "[CMake] Generate" },
        { "<leader>cmb", "<cmd>CMakeBuild<cr>",    desc = "[CMake] Build" },
        { "<leader>cmC", "<cmd>CMakeClean<cr>",    desc = "[CMake] Clean" },
        { "<leader>cmd", "<cmd>CMakeDebug<cr>",    desc = "[CMake] Debug" },
        { "<leader>cmr", "<cmd>CMakeRun<cr>",      desc = "[CMake] Run" },
    },
    cmd = {
        "CMakeGenerate",
        "CMakeBuild",
        "CMakeClean",
        "CMakeDebug",
    },
    opts = {
        cmake_regenerate_on_save = false,   -- auto generate when save CMakeLists.txt
        cmake_virtual_text_support = false, -- Show the target related to current file using virtual text (at right corner)
    },
}
