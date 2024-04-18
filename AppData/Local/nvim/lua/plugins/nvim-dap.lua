local function send_payload(client, payload)
    local rpc = require('dap.rpc')
  local msg = rpc.msg_with_content_length(vim.json.encode(payload))
  client.write(msg)
end

function RunHandshake(self, request_payload)
  local signResult = io.popen('node C:\\debugadapter\\vsdbgsignature\\sign.js ' .. request_payload.arguments.value)
  if signResult == nil then
    local utils = require('dap.utils')
    utils.notify('error while signing handshake', vim.log.levels.ERROR)
    return
  end
  local signature = signResult:read("*a")
  signature = string.gsub(signature, '\n', '')
  local response = {
    type = "response",
    seq = 0,
    command = "handshake",
    request_seq = request_payload.seq,
    success = true,
    body = {
      signature = signature
    }
  }
  send_payload(self.client, response)
end

  local lldb_configuration = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
          return vim.fn.input("[lldb] Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}/build",
      stopOnEntry = false,
      args = {},
    },
  }

  local cppdbg_configuration = {
    {
      name = "Launch",
      type = "cppdbg",
      request = "launch",
      program = function()
          return vim.fn.input("[cppdbg] Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}/build",
      stopOnEntry = true,
      args = {},
      windows = {
          MIMode = "gdb",
          miDebuggerPath = "C:\\msys64\\mingw64\\bin\\gdb.exe",
      },
    },
      -- attach process
  {
    name = "Attach process",
    type = "cppdbg",
    request = "attach",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    setupCommands = {
      {
        description = 'enable pretty printing',
        text = '-enable-pretty-printing',
        ignoreFailures = false
      },
    },
  },
    -- attach server
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
  },
  }

local cppvsdbg_configuration = {
  {
    name = "Launch",
    type = "cppvsdbg",
    request = "launch",
    program = function()
      return vim.fn.input("[cppvsdbg] Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = vim.fn.getcwd(),
    clientID = "vscode",
    clientName = "Visual Studio Code",
    externalTerminal = true,
    columnsStartAt1 = true,
    linesStartAt1 = true,
    locale = "en",
    pathFormat = "path",
    externallConsole = true,
  },
}

local function setup_default_configurations()
  local dap = require "dap"

  dap.configurations.c = cppvsdbg_configuration
  dap.configurations.cpp = cppvsdbg_configuration
  dap.configurations.rust = cppvsdbg_configuration
end

local function setup_lldb_adapter(dap)
  -- Get the path to `codelldb` installed by Mason.
    local lldb_path = require("mason-registry").get_package("codelldb"):get_install_path() .. "/extension"
    local lldb_bin = lldb_path .. "/adapter/codelldb"

    --print lldb_bin
    vim.notify(
    lldb_bin,
    vim.log.levels.INFO)

    if vim.fn.executable(lldb_bin) == 1 then
        dap.adapters.lldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = lldb_bin,
                args = { "--port", "${port}" },
            },
        }
    else
        vim.notify(
            "The codelldb debug adapter is not installed.\nPlease use Mason to install `codelldb`.",
            vim.log.levels.ERROR
        )
    end
end

local function setup_cppdbg_adapter(dap)
    local install_path = require("mason-registry").get_package("cpptools"):get_install_path()
    local exec_path = install_path .. "/extension/debugAdapters/bin/OpenDebugAD7"

    if vim.fn.executable(exec_path) == 0 then
        vim.notify(
            "The cppdbg debug adapter is not installed.\nPlease use Mason to install `cpptools`.",
            vim.log.levels.ERROR
        )
        return
    end

    dap.adapters.cppdbg = {
        type = "executable",
        command = exec_path,
        id = "cppdbg",
    }
    end

local function setup_cppvsdbg_adapter(dap)
    local install_path = require("mason-registry").get_package("cpptools"):get_install_path()
    local exec_path = install_path .. "/extension/debugAdapters/vsdbg/bin/vsdbg"

    if vim.fn.executable(exec_path) == 0 then
        vim.notify(
            "The cppvsdbg debug adapter is not installed.\nPlease use Mason to install `cpptools`.",
            vim.log.levels.ERROR
        )
        return
    end

    dap.adapters.cppvsdbg = {
        type = "executable",
        command = exec_path,
        id = "cppvsdbg",
        args = {
            "--interpreter=vscode",
        },
        options = { externalTermial = true },
        runInTerminal = true,
        reverse_request_handlers = {
            handshake = RunHandshake,
        },
    }
    dap.set_log_level("TRACE")
end

return {
    "mfussenegger/nvim-dap",
    depencencies = { "rcarriga/nvim-dap-ui", },
 lazy = true,
  keys = {
      {"<leader>dc", function() 
                  -- when debug is called firstly try to read and/or update launch.json configuration
        -- from the local project which will override all the default configurations
        if vim.fn.filereadable ".vscode/launch.json" then
          require("dap.ext.vscode").load_launchjs(nil, { lldb = { "rust", "c", "cpp" }, cppdbg = { "cpp" }})
          vim.notify("launch.json loaded")
        else
          -- If not possible stick to the default prebuilt configurations
          setup_default_configurations()
        end

        require("dap").continue()
      end
  },
  { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
  },
  config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup()
      setup_lldb_adapter(dap)
      -- setup_cppdbg_adapter(dap)
      -- setup_cppvsdbg_adapter(dap)
      dap.configurations.cpp = lldb_configuration
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
  end,
}
