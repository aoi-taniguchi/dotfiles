local dap = require('dap')

dap.set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = '80vslpit new'
vim.fn.sign_define('DapBreakpoint', {text='●', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='○', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='>', texthl='', linehl='', numhl=''})

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = os.getenv("HOME") .. '/work/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
  {
    name = "launch - local",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    runInTerminal = true,
  },
  {
    name = "attach - docker container (sdk-hal-docker_arene_1)",
    type = "cppdbg",
    request = "attach",
    cwd = "/opt/arene/bin",
    program = function()
      return "/opt/arene/" .. vim.fn.input('Path to executable: /opt/arene/')
    end,
    -- processId = "${command:pickProcess}",
    processId = 183,
    sourceFileMap = {
      -- ["/workdir/cockpit_resource_manager/src"] = {
      --   editorPath = '${workspaceFolder}',
      --   useForBreakpoints = true,
      -- },
      ["/workdir/cockpit_resource_manager/src"] = '${workspaceFolder}',
    },
    -- miDebuggerServerAddress = "192.168.10.254:1234",
    -- useExtendedRemote = true,
    miDebuggerArgs = "-x ~/.config/gdb/gdbinit",
    pipeTransport = {
      pipeCwd = "/usr/bin",
      pipeProgram = "/usr/bin/docker",
      pipeArgs = {
        "exec",
        "-i",
        "sdk-hal-docker_arene_1",
        "sh",
        "-c"
      },
      -- pipeProgram = "/usr/bin/ssh",
      -- pipeArgs = {
      --   "root@192.168.10.254",
      -- },
      debuggerPath = "/usr/bin/gdb",
    },
    MIMode = "gdb",
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
    runInTerminal = true,
  },
}

dap.configurations.c = dap.configurations.cpp

