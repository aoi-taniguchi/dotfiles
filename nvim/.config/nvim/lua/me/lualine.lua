local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn' },
    symbols = { error = ' ', warn = ' ' },
    colored = true,
    update_in_insert = true,
    always_visible = true,
}

local branch = {
    'branch',
    icons_enabled = true,
    icon = '',
}

local mode = {
    'mode',
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
}

local filename = {
    'filename',
    path = 3,   -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
    file_status = false,
    shorting_target = 40,
}

local diff = {
    'diff',
    colored = true,
    symbols = { added = ' ', modified = ' ', removed = ' ' },
    source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed
            }
        end
    end
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
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha' },
        ignore_focus = {
          "dapui_watches", "dapui_breakpoints", "dapui_scopes",
          "dapui_console", "dapui_stacks", "dap-repl"
        },
        always_divide_middle = true,
        globalstatus = true,
    },
    tabline = {},
    sections = {
        lualine_a = { mode },
        lualine_b = { branch, diff },
        lualine_c = { filename },
        -- TODO: noice integration
        lualine_x = {},
        lualine_y = { diagnostics },
        lualine_z = { 'filetype', 'encoding', 'location', progress }
    },
    inactive_sections = {
        lualine_a = { mode },
        lualine_b = { branch, diff },
        lualine_c = { filename },
        lualine_x = {},
        lualine_y = { diagnostics },
        lualine_z = { 'filetype', 'encoding', 'location', progress }
    },
    extensions = {},
}
