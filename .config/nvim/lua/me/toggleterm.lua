require('toggleterm').setup {
    size = 20,
    open_mapping = [[<c-]>]],
    shading_factor = 2,
    direction = "float", -- horizontal, vertical, float, tab
    float_opts = {
        border = "curved",
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
function Toggle_lazygit()
	lazygit:toggle()
end

-- not sure why, but doesn't work
local dotfiles_lazygit = Terminal:new({ cmd = "dlg", direction = "float", hidden = true })
function Toggle_dotfiles_lazygit()
    -- vim.env.GIT_DIR = "$HOME/.dotfiles/"
    -- vim.env.GIT_WORK_TREE = "$HOME"
	dotfiles_lazygit:toggle()
end

local python = Terminal:new({ cmd = "python", direction = "float", hidden = true })
function Toggle_python()
	python:toggle()
end
