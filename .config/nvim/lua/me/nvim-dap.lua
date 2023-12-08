local dap = require("dap")

dap.set_log_level("INFO")
dap.defaults.fallback.terminal_win_cmd = "80vslpit new"
vim.fn.sign_define("DapBreakpoint", {text="●", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointRejected", {text="○", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapStopped", {text=">", texthl="", linehl="", numhl=""})

dap.adapters = {
  cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = os.getenv("HOME") .. "/work/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7",
  },
  bashdb = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
    name = "bashdb",
  },
  dart = {
    type = "executable",
    command = "dart",
    args = {"debug_adapter"}
  },
  flutter = {
    type = "executable",
    command = "flutter",
    args = {"debug_adapter"}
  }
}

dap.configurations = {
  cpp = {
    {
      name = "launch - local",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopAtEntry = true,
      runInTerminal = true,
    },
    {
      name = "attach - docker container (sdk-hal-docker_arene_1)",
      type = "cppdbg",
      request = "attach",
      cwd = "/opt/arene/bin",
      program = function()
        return "/opt/arene/" .. vim.fn.input("Path to executable: /opt/arene/")
      end,
      processId = "${command:pickRemoteProcess}",
      sourceFileMap = {
        ["/workdir/cockpit_resource_manager/src"] = "${workspaceFolder}",
      },
      pipeTransport = {
        debuggerPath = "/usr/bin/gdb",
        pipeCwd = "/usr/bin",
        pipeProgram = "/usr/bin/docker",
        pipeArgs = {
          "exec",
          "-i",
          "sdk-hal-docker_arene_1",
          "sh",
          "-c"
        },
      },
      MIMode = "gdb",
      setupCommands = {
        {
          text = "-enable-pretty-printing",
          description = "enable pretty printing",
          ignoreFailures = false
        },
      },
      runInTerminal = true,
    },
  },
  sh = {
    type = "bashdb",
    request = "launch",
    name = "launch - bash",
    showDebugOoutput = true,
    pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
    pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
    trace = true,
    file = "${file}",
    program = "${file}",
    cwd = "${workspaceFolder}",
    pathCat = "cat",
    pathBash = "/usr/bin/env bash",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    args = {},
    env = {},
    terminalKind = "integrated",
  },
  dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch dart",
      dartSdkPath = "dart",
      flutterSdkPath = "flutter",
      program = "${file}",
      cwd = "${workspaceFolder}"
    },
    {
      type = "flutter",
      request = "launch",
      name = "Launch flutter",
      dartSdkPath = "dart",
      flutterSdkPath = "flutter",
      program = "${file}",
      cwd = "${workspaceFolder}"
    },
    {
      type = "flutter",
      request = "attach",
      name = "Attach to flutter process",
      dartSdkPath = "dart",
      flutterSdkPath = "flutter",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
      -- args = function()
      --     local args_string = vim.fn.input('Arguments: ', '-d linux --debug-port 31569')
      --     return vim.split(args_string, " ")
      -- end,
      args = {"-d", "linux", "--debug-port", "31569"},
    },
    {
      type = "dart",
      request = "attach",
      name = "Attach to dart process",
      dartSdkPath = "dart",
      flutterSdkPath = "flutter",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
      vmServiceUri = "http://127.0.0.1:31569/",
    },
  }
}

dap.configurations.c = dap.configurations.cpp

