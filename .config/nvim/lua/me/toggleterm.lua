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
function Lazygit_toggle()
	lazygit:toggle()
end

local python = Terminal:new({ cmd = "python", direction = "float", hidden = true })
function Python_toggle()
	python:toggle()
end
