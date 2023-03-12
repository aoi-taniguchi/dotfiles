local actions = require('telescope.actions')
local fb_actions = require('telescope._extensions.file_browser.actions')

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        layout_strategy = 'flex',

        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<Tab>"] = actions.toggle_selection,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<Tab>"] = actions.toggle_selection,
                ["<S-j>"] = actions.preview_scrolling_down,
                ["<S-k>"] = actions.preview_scrolling_up,
            },
        },
    },

    pickers = {
        live_grep = {
            additional_args = function(opts)
                return {"--hidden"}
            end
        },
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        file_browser = {
	        hidden = true,
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    ["<C-g>"]  = fb_actions.goto_parent_dir,
                    ["<C-e>"]  = fb_actions.goto_home_dir,
                    ["<C-w>"]  = fb_actions.goto_cwd,
                    ["<C-t>"]  = fb_actions.change_cwd,
                    ["<C-c>"]  = fb_actions.create,
                    ["<C-CR>"] = fb_actions.create_from_prompt,
                    ["<C-r>"]  = fb_actions.rename,
                    ["<C-m>"]  = fb_actions.move,
                    ["<C-y>"]  = fb_actions.copy,
                    ["<C-d>"]  = fb_actions.remove,
                    ["<C-o>"]  = fb_actions.open,
                    ["<C-f>"]  = fb_actions.toggle_browser,
                    ["<C-h>"]  = fb_actions.toggle_hidden,
                    ["<C-s>"]  = fb_actions.toggle_all,
                },
                ["n"] = {
                    ["<C-g>"]  = fb_actions.goto_parent_dir,
                    ["<C-e>"]  = fb_actions.goto_home_dir,
                    ["<C-w>"]  = fb_actions.goto_cwd,
                    ["<C-t>"]  = fb_actions.change_cwd,
                    ["<C-c>"]  = fb_actions.create,
                    ["<C-CR>"] = fb_actions.create_from_prompt,
                    ["<C-r>"]  = fb_actions.rename,
                    -- ["<C-m>"]  = fb_actions.move,
                    ["<C-y>"]  = fb_actions.copy,
                    ["<C-d>"]  = fb_actions.remove,
                    ["<C-o>"]  = fb_actions.open,
                    ["<C-f>"]  = fb_actions.toggle_browser,
                    ["<C-h>"]  = fb_actions.toggle_hidden,
                    ["<C-s>"]  = fb_actions.toggle_all,
                },
            },
        },
	    media_files = {
	        filetypes = {'png', 'jpg', 'jpeg', 'pdf'},
	        find_cmd = 'rg'
	    },
        -- aerial = {
        --     -- Display symbols as <root>.<parent>.<symbol>
        --     show_nesting = true
        -- },
    },
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('lazygit')
require('telescope').load_extension('dap')
require('telescope').load_extension('media_files')
require('telescope').load_extension('z')
-- require('telescope').load_extension('aerial')

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< dotfiles for nvim >",
        cwd = "~/.config/nvim/",
    })
end

return M
