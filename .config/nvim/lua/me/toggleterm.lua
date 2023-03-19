require('toggleterm').setup {
    size = 10,
    open_mapping = [[<c-]>]],
    shading_factor = 2,
    direction = "float",
    float_opts = {
        border = "curved",
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function Lazygit_toggle()
	lazygit:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })
function Htop_toggle()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })
function Python_toggle()
	python:toggle()
end
