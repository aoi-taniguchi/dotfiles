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
function lazygit_toggle()
	lazygit:toggle()
end

local pr_review = Terminal:new({ cmd = "git review", hidden = true })
function pr_review_toggle()
    pr_review:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })
function htop_toggle()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })
function python_toggle()
	python:toggle()
end
