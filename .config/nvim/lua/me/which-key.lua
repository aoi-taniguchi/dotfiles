local wk = require('which-key')
wk.setup {}

local opts = {
	mode = 'n', -- NORMAL mode
    prefix = '<leader>',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {

    -- alpha
    ['a'] = { '<cmd>Alpha<CR>', 'alpha' },

    -- buffer
    b = {
        name = 'buffer',
        b = { '<cmd>lua require("telescope.builtin").buffers()<CR>', 'list buffers' },
        p = { '<cmd>bprevious<CR>', 'go to previous buffer' },
        n = { '<cmd>bnext<CR>', 'go to next buffer' },
    },

    -- quickfix
    c = {
        name = 'quickfix',
        o = { '<cmd>copen<CR>', 'open quickfix list' },
        n = { '<cmd>cn<CR>', 'go to next quickfix' },
        p = { '<cmd>cp<CR>', 'go to previous quickfix' }
    },

    -- nvim-dap
    d = {
        name = 'debug',
        c = { '<cmd>Telescope dap commands<CR>', 'list commands' },
        --c = { '<cmd>lua require("dap").clear_breakpoints()<CR>', 'clear breakpoints' },
        t = { '<cmd>lua require("dap").toggle_breakpoint()<CR>', 'toggle breakpoint' },
      	s = { '<cmd>lua require("dap").close()<CR>', 'close' },
      	n = { '<cmd>lua require("dap").continue()<CR>', 'continue' },
      	k = { '<cmd>lua require("dap").up()<CR>', 'up' },
      	j = { '<cmd>lua require("dap").down()<CR>', 'down' },
      	_ = { '<cmd>lua require("dap").disconnect();require("dap").close();require("dap").run_last()<CR>', 'disconnect and run last' },
      	r = { '<cmd>lua require("dap").repl.open({}, "vsplit")<CR><C-w>l', 'open repl' },
      	--i = { '<cmd>lua require("dap.ui.variables").hover()<CR>', 'variables hover' },
      	h = { '<cmd>lua require("dap.ui.widgets").hover()<CR>', 'widgets hover' },
      	--['?'] = { '<cmd>lua require("dap.ui.variables").scopes()<CR>', 'scopes' },
      	['?'] = { '<cmd>lua local widgets=require("dap.ui.widgets");widgets.centered_float(widgets.scopes)<CR>', 'scopes' },
      	e = { '<cmd>lua require("dap").set_exception_breakpoints({"all"})<CR>', 'set exception breakpoints' },

      	f = { '<cmd>Telescope dap frames<CR>', 'list frames' },
      	b = { '<cmd>Telescope dap list_breakpoints<CR>', 'list breakpoints' },
      	v = { '<cmd>Telescope dap variables<CR>', 'list variables' },
      	['cf'] = { '<cmd>Telescope dap configurations<CR>', 'list configurations' },

      	u = { '<cmd>lua require("dapui").toggle()<CR>', 'toogle ui' },
	},

    -- telescope
    f = {
        name = 'file/find',
        e = { '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>', 'file explorer' },
        f = { '<cmd>lua require("telescope.builtin").find_files()<CR>', 'find files' },
    },

    -- git
    g = {
   	    name = 'git',
        a = { '<cmd>Octo actions<CR>', 'gh cli actions' },
        g = { '<cmd>lua lazygit_toggle()<CR>', 'toggle lazygit' },
    },

    -- htop
    h = {
        name = 'toggle htop',
        h = { '<cmd>lua htop_toggle()<CR>', 'toggle htop' },
    },

    -- live grep
    l = {
        name = 'live grep',
        g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', 'live grep' },
    },

    -- maximizer
    ['m'] = { '<cmd>MaximizerToggle<CR>', 'maximizer' },

    -- toggleterm
    p = {
        name = 'toggle python',
        p = { '<cmd>lua python_toggle()<CR>', 'toggle python' },
    },

    -- delete buffer
    ['q'] = { '<cmd>bdelete<CR>', 'buffer delete' },

    -- general
    s = {
        name = 'source/search',
        o = { '<cmd>source $MYVIMRC<CR>', 'source init.vim' },
        d = { '<cmd>lua require("me.telescope").search_dotfiles()<CR>', 'search dotfiles' },
        g = { '<cmd>lua require("telescope").extensions.lazygit.lazygit()<CR>', 'search lazygit repos' },
        m = { '<cmd>lua require("telescope").extensions.media_files.media_files()<CR>', 'search media files' },
    },

    ['ta'] = { '<cmd>AerialToggle<CR>', 'toggle arial' },

    -- whichkey
    ['w']  = { '<cmd>WhichKey<CR>', 'whichKey' },

    -- z
    ['z'] = { '<cmd>lua require("telescope").extensions.z.list()<CR>', 'z list' },

}

local non_leader_opts = {
	mode = 'n', -- NORMAL mode
    prefix = '',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local non_leader_mappings = {

    ['<S-h>'] = { '<cmd>lua require("dap").step_out()<CR>', '(debug) step out' },
    ['<S-l>'] = { '<cmd>lua require("dap").step_into()<CR>', '(debug) step into' },
    ['<S-j>'] = { '<cmd>lua require("dap").step_over()<CR>', '(debug) step over' },

    ['{'] = { '<cmd>AerialPrev<CR>', 'jump backwards 1 symbol' },
    ['}'] = { '<cmd>AerialNext<CR>', 'jump forwards 1 symbol' },
    ['[['] = { '<cmd>AerialPrevUp<CR>', 'jump up the tree, moving backwards' },
    [']]'] = { '<cmd>AerialNextUp<CR>', 'jump up the tree, moving forwards' },

}

-- vnoremap <leader>dh :lua require('dap.ui.variables').visual_hover()<CR>

wk.register(mappings, opts)
wk.register(non_leader_mappings, non_leader_opts)
