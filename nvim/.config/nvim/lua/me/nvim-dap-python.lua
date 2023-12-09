local dap = require('dap')

dap.set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = '80vslpit new'
vim.fn.sign_define('DapBreakpoint', {text='●', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='C', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='○', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='>', texthl='', linehl='', numhl=''})

dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = {'-m', 'debugpy.adapter'};
}

local venv = os.getenv('VIRTUAL_ENV')
VENV_PATH = string.format('%s/bin/python', venv)
require('dap-python').setup(VENV_PATH)
require('dap-python').test_runner = 'pytest'
table.insert(require('dap').configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'Run pytest with arguments',
    module = 'pytest',
    args = function()
        local args_string = vim.fn.input('Arguments: ', vim.fn.expand('%'))
        return vim.split(args_string, " +")
    end,
})
