local dap = require('dap')

dap.set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = '80vslpit new'
vim.fn.sign_define('DapBreakpoint', {text='●', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='○', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='>', texthl='', linehl='', numhl=''})

dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = {'-m', 'debugpy.adapter'};
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
  },
  {
    type = 'python';
    request = 'launch';
    name = "Launch file with arguments";
    program = "${file}";
    args = function()
        local args_string = vim.fn.input('Arguments: ')
        return vim.split(args_string, " +")
    end;
  },
  {
    type = 'python';
    request = 'attach';
    name = "Attach remote";
    connect = function()
        local host = vim.fn.input('Host [127.0.0.1]: ')
        host = host ~= '' and host or '127.0.0.1'
        local port = tonumber(vim.fn.input('Port [5678]: ')) or 5678
        return { host = host, port = port }
    end;
  },
}

