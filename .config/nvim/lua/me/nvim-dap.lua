local dap = require('dap')
local M = {}

dap.set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = '80vslpit new'
vim.fn.sign_define('DapBreakpoint', {text='●', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='○', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='>>', texthl='', linehl='', numhl=''})

dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = {'-m', 'debugpy.adapter'};
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "python) Launch file";
    program = "${file}";
  },
  {
    type = 'python';
    request = 'launch';
    name = "python) Launch file with arguments";
    program = "${file}";
    args = function()
        local args_string = vim.fn.input('Arguments: ')
        return vim.split(args_string, " +")
    end;
  },
  {
    type = 'python';
    request = 'attach';
    name = "python) Attach remote";
    connect = function()
        local host = vim.fn.input('Host [127.0.0.1]: ')
        host = host ~= '' and host or '127.0.0.1'
        local port = tonumber(vim.fn.input('Port [5678]: ')) or 5678
        return { host = host, port = port }
    end;
  },
}

-- pytest
require('dap-python').setup('~/work/venv1/bin/python')
require('dap-python').test_runner = 'pytest'

-- local test_runners = require('dap-python').test_runners
--
-- -- `test_runners` is a table. The keys are the runner names like `unittest` or `pytest`.
-- -- The value is a function that takes three arguments:
-- -- The classname, a methodname and the opts
-- -- (The `opts` are coming passed through from either `test_method` or `test_class`)
-- -- The function must return a module name and the arguments passed to the module as list.
-- test_runners.your_runner = function(classname, methodname, opts)
--   local args = {classname, methodname}
--   return 'modulename', args
-- end
