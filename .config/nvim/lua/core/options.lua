-- global options
local global_options = {
    autochdir = true,
    autoread = true,
    backup = false,
    encoding = 'utf-8',
    errorbells = false,
    guicursor = '',
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    incsearch = true,
    laststatus = 2,
    path = vim.opt.path + '**',
    scrolloff = 8,
    showcmd = true,
    showmatch = true,
    termguicolors = true,
    updatetime = 300,
    wildignore = vim.opt.wildignore + {'**/.git/*',},
    wildmenu = true,
    wildmode = {'longest', 'list', 'full'},
}

for k, v in pairs(global_options) do
    vim.opt[k] = v
end


-- window options
local window_options = {
    colorcolumn = '80',
    number = true,
    relativenumber = true,
    signcolumn = 'yes',
    wrap = false
}

for k, v in pairs(window_options) do
    vim.wo[k] = v
end


-- buffer options
local buffer_options = {
    autoindent = true,
    expandtab = true,
    fileencoding = 'utf-8',
    shiftwidth = 4,
    smartindent = true,
    softtabstop = 4,
    swapfile = false,
    syntax = 'ON',
    tabstop = 4
}

for k, v in pairs(buffer_options) do
    vim.bo[k] = v
end
