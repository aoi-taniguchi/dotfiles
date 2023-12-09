local actions = require('telescope.actions')
local fb_actions = require('telescope._extensions.file_browser.actions')

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,
        wrap_results = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        layout_strategy = 'flex',
        layout_config = {
            scroll_speed = 3,
        },

        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<Tab>"] = actions.toggle_selection,
                ["<C-/>"] = actions.which_key,
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
        find_files = {
            hidden = true,
            follow = true,
        },
        live_grep = {
            additional_args = function(_)
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
                    ["<CR>"]   = actions.select_default,
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
                    ["<C-m>"]  = fb_actions.move,
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
        undo = {
            use_delta = true,
            use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
            side_by_side = true,
            layout_strategy = 'vertical',
            layout_config = {
                preview_height = 0.8,
            },
            diff_context_lines = vim.o.scrolloff,
            entry_format = "state #$ID, $STAT, $TIME",
            mappings = {
                i = {
                    -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                    -- you want to replicate these defaults and use the following actions. This means
                    -- installing as a dependency of telescope in it's `requirements` and loading this
                    -- extension from there instead of having the separate plugin definition as outlined
                    -- above.
                    ["<cr>"] = require("telescope-undo.actions").yank_additions,
                    ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                    ["<C-cr>"] = require("telescope-undo.actions").restore,
                },
            },
        },
    },
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('lazygit')
require('telescope').load_extension('dap')
require('telescope').load_extension('media_files')
-- require('telescope').load_extension('aerial')
require('telescope').load_extension('harpoon')
require('telescope').load_extension('repo')
require('telescope').load_extension('undo')
-- require('telescope').load_extension('flutter')

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< dotfiles >",
        cwd = "~/dotfiles/",
    })
end

return M
