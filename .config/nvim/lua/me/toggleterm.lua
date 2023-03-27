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

local dlg = "export GIT_DIR=$HOME/.dotfiles/ \z
                && export GIT_WORK_TREE=$HOME \z
                && lazygit \z
                && unset GIT_DIR \z
                && unset GIT_WORK_TREE"
local dotfiles_lazygit = Terminal:new({ cmd = dlg, direction = "float", hidden = true })
function Toggle_dotfiles_lazygit()
	dotfiles_lazygit:toggle()
end

local python = Terminal:new({ cmd = "python", direction = "float", hidden = true })
function Toggle_python()
	python:toggle()
end
