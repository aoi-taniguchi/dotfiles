local global_options = {
    autochdir = true,
    autoread = true,
    backup = false,
    encoding = 'utf-8',
    errorbells = false,
    expandtab = true,
    fillchars = vim.opt.fillchars + { diff = ' ' },
    guicursor = 'a:blinkon0',
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    incsearch = true,
    laststatus = 3,
    mouse = 'a',
    showmode = false,
    showtabline = 2,
    path = vim.opt.path + '**',
    scrolloff = 8,
    shiftwidth = 4,
    showcmd = true,
    showmatch = true,
    softtabstop = 4,
    tabstop = 4,
    termguicolors = true,
    updatetime = 300,
    wildignore = vim.opt.wildignore + { '**/.git/*', },
    wildmenu = true,
    wildmode = { 'longest', 'list', 'full' },
}

local window_options = {
    colorcolumn = '80',
    cursorline = true,
    number = true,
    relativenumber = true,
    signcolumn = 'yes',
    wrap = false
}

local buffer_options = {
    autoindent = true,
    fileencoding = 'utf-8',
    smartindent = true,
    swapfile = false,
    syntax = 'ON',
}

for k, v in pairs(global_options) do
    vim.opt[k] = v
end

for k, v in pairs(window_options) do
    vim.wo[k] = v
end

for k, v in pairs(buffer_options) do
    vim.bo[k] = v
end

-- clipboard
-- vim.opt.clipboard:append{'unnamedplus'}

if vim.env.TMUX then
    vim.g.clipboard = {
        name = 'tmux',
        copy = {
            ["+"] = { 'tmux', 'load-buffer', '-w', '-' },
            ["*"] = { 'tmux', 'load-buffer', '-w', '-' },
        },
        paste = {
            ["+"] = { 'tmux', 'save-buffer', '-' },
            ["*"] = { 'tmux', 'save-buffer', '-' },
        },
        cache_enabled = false,
    }
end
