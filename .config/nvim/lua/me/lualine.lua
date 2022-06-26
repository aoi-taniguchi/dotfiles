local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn' },
    symbols = { error = ' ', warn = ' ' },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local branch = {
    'branch',
    icons_enabled = true,
    icon = '',
}

local mode = {
    "mode",
    fmt = function(str)
	return "-- " .. str .. " --"
    end,
}

local diff = {
    'diff',
    colored = false,
    symbols = { added = ' ', modified = ' ', removed = ' ' },
    cond = hide_in_width
}

local spaces = function()
    return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

local progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

require('lualine').setup {
    options = {
        icons_enabled = false,
	theme = 'nord',
	component_separators = { left = '', right = '' },
	section_separators = { left = '', right = '' },
	disabled_filetypes = {'alpha'},
	always_divide_middle = true,
    },
    tabline = {},
    sections = {
    	lualine_a = {branch, diagnostics},
    	lualine_b = {mode},
    	lualine_c = {},
    	lualine_x = {diff, spaces, 'encoding', 'filetype'},
    	lualine_y = {'location'},
    	lualine_z = {progress}
    },
    inactive_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = {'filename'},
	lualine_x = {'location'},
	lualine_y = {},
	lualine_z = {},
    },
    extensions = {},
}
