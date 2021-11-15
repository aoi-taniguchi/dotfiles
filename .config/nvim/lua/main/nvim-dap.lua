local dap = require('dap')
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
    program = "${workspaceFolder}/${file}";
    stopOnEntry = true;
  },
}
dap.set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = '80vslpit new'
vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🔵', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='', numhl=''})
