local wk = require('which-key')
wk.setup {}

-- NORMAL MODE with the leader --
local opts = {
    mode = 'n',
    prefix = '<leader>',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,
    noremap = true,
    nowait = false,
}

local mappings = {

    -- alpha
    a = { '<cmd>Alpha<CR>', 'alpha' },

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
        l = { '<cmd>lua require("telescope.builtin").quickfix()<CR>', 'quickfix list' },
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
        ['tc'] = { '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', 'toggle conditional breakpoint' },
      	s = { '<cmd>lua require("dap").close()<CR>', 'close' },
      	n = { '<cmd>lua require("dap").continue()<CR>', 'continue' },
        m = { '<cmd>lua require("dap-python").test_method()<CR>', 'test the closest method above the cursor' },
        l = { '<cmd>lua require("dap-python").test_class()<CR>', 'test the closest class above the cursor' },
        ['sl'] = { '<cmd>lua require("dap-python").debug_selection()<CR>', 'debug_selection' },
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
        name = 'file / find / format',
        e = { '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>', 'file explorer' },
        f = { '<cmd>lua require("telescope.builtin").find_files()<CR>', 'find files' },
        g = { '<cmd>lua require("telescope.builtin").git_files()<CR>', 'find git files' },
        o = { '<cmd>lua require("telescope.builtin").oldfiles()<CR>', 'find old files' },
    },

    -- git
    g = {
   	    name = 'git',
        a = { '<cmd>Octo actions<CR>', 'gh cli actions' },
        b = { '<cmd>lua require("telescope.builtin").git_branches()<CR>', 'git branches' },
        c = { '<cmd>lua require("telescope.builtin").git_commits()<CR>', 'git commits' },
        d = { ':call DiffviewOpenWithArgs()<CR>', 'diffview open' },
        ['dc'] = { '<cmd>DiffviewClose<CR>', 'diffview close' },
        ['dh'] = { ':call DiffviewFileHistoryWithArgs()<CR>', 'diffview file history' },
        s = { '<cmd>lua require("telescope.builtin").git_status()<CR>', 'git status' },
    },

    -- Harpoon
    h = {
        name = 'Harpoon',
        a = { '<cmd>lua require("harpoon.mark").add_file()<CR>', 'add file' },
        m = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', 'menu' },
        ['tm'] = { '<cmd>Telescope harpoon marks<CR>', 'telescope menu' },
        n = { '<cmd>lua require("harpoon.ui").nav_next()<CR>', 'navigation to next' },
        p = { '<cmd>lua require("harpoon.ui").nav_previous()<CR>', 'navigation to previous' },
        ['1'] = { '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', 'go to index 1' },
        ['2'] = { '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', 'go to index 2' },
        ['3'] = { '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', 'go to index 3' },
        ['4'] = { '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', 'go to index 4' },
    },

    j = {
        name = 'jumplist',
        l = { '<cmd>lua require("telescope.builtin").jumplist()<CR>', 'jumplist' },
    },

    -- live grep / location list
    l = {
        name = 'live grep / location list',
        g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', 'live grep' },
        l = { '<cmd>lua require("telescope.builtin").loclist()<CR>', 'location list' },
    },

    -- maximizer
    m = { '<cmd>MaximizerToggle<CR>', 'maximizer' },

    -- delete buffer
    q = { '<cmd>bdelete<CR>', 'buffer delete' },

    -- general
    s = {
        name = 'source/search',
        o = { '<cmd>source $MYVIMRC<CR>', 'source init.vim' },
        d = { '<cmd>lua require("me.telescope").search_dotfiles()<CR>', 'search dotfiles' },
        ['lg'] = { '<cmd>lua require("telescope").extensions.lazygit.lazygit()<CR>', 'search lazygit repos' },
        m = { '<cmd>lua require("telescope").extensions.media_files.media_files()<CR>', 'search media files' },
    },

    -- toggle
    t = {
        name = 'toggle',
        a = { '<cmd>AerialToggle<CR>', 'aerial window' },
        -- a = { '<cmd>lua require("telescope").extensions.aerial.aerial()<CR>', 'aerial window' },
        c = { '<cmd>Codi!!<CR>', 'codi' },
        -- ['gb']: (gitsigns) git blame
        p = { '<cmd>lua Toggle_python()<CR>', 'python' },
        ['lg'] = { '<cmd>lua Toggle_lazygit()<CR>', 'lazygit' },
        ['dlg'] = { '<cmd>lua Toggle_dotfiles_lazygit()<CR>', 'dotfiles lazygit' },
        -- t = { '<cmd>AerialTreeToggle!<CR>', 'toggle tree recursively' },

        -- swith tab
        ['1'] = { '1gt', 'go to tab1' },
        ['2'] = { '2gt', 'go to tab2' },
        ['3'] = { '3gt', 'go to tab3' },
        ['4'] = { '4gt', 'go to tab4' },
        ['5'] = { '5gt', 'go to tab5' },
        ['6'] = { '6gt', 'go to tab6' },
        ['7'] = { '7gt', 'go to tab7' },
        ['8'] = { '8gt', 'go to tab8' },
        ['9'] = { '9gt', 'go to tab9' },
        ['0'] = { '<cmd>tablast<CR>', 'go to last tab' },
    },

    -- whichkey
    w  = { '<cmd>WhichKey<CR>', 'whichkey' },

    -- doesn't seem to work via ssh
    y = { '"+y', 'copy to clipboard' },

}


-- NORMAL MODE without the leader--
local non_leader_opts = {
	mode = 'n',
    prefix = '',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,
    noremap = true,
    nowait = true,
}

local non_leader_mappings = {

    -- tab
    t = { 'gt', 'next tab' },
    T = { 'gT', 'prior tab' },

    -- debug
    ['<S-h>'] = { '<cmd>lua require("dap").step_out()<CR>', '(debug) step out' },
    ['<S-l>'] = { '<cmd>lua require("dap").step_into()<CR>', '(debug) step into' },
    ['<S-j>'] = { '<cmd>lua require("dap").step_over()<CR>', '(debug) step over' },

    -- outline
    ['{'] = { '<cmd>AerialPrev<CR>', 'jump backwards 1 symbol' },
    ['}'] = { '<cmd>AerialNext<CR>', 'jump forwards 1 symbol' },
    ['[['] = { '<cmd>AerialPrevUp<CR>', 'jump up the tree, moving backwards' },
    [']]'] = { '<cmd>AerialNextUp<CR>', 'jump up the tree, moving forwards' },

    -- vim default
    -- [c : previous diff
    -- ]c : next diff
    -- zo : expand
    -- zm : expand all
    -- zM : expand all recursively
    -- zc : collapse
    -- zr : collapse all
    -- zR : collapse all recursively

    -- don't make registers dirty
    x = { '"_x', 'discard x' },
    s = { '"_s', 'discard s' },

    -- add blank lines
    -- ['<S-CR>'] = { 'm`o<Esc>``', 'add a blank line below' },
    -- ['<C-S-CR>'] = { 'm`O<Esc>``', 'add a blank line above' },

    -- move one line
    ['<S-Up>'] = { '"zdd<Up>"zP', 'move a line up' },
    ['<S-Down>'] = { '"zdd"zp', 'move a line down' },

}


-- INSERT MODE --
local insert_opts = {
	mode = 'i',
    prefix = '',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,
    noremap = true,
    nowait = true,
}

local insert_mappings = {

    -- add blank lines
    -- ['<S-CR>'] = { '<End><CR>', 'add a blank line below' },
    -- ['<C-S-CR>'] = { '<Home><CR><Up>', 'add a blank line above' },

}


-- VISUAL MODE --
local visual_opts = {
	mode = 'v',
    prefix = '',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,
    noremap = true,
    nowait = true,
}

local visual_mappings = {

    -- move lines
    ['<S-Up>'] = { '"zx<Up>"zP`[V`]', 'move a line up' },
    ['<S-Down>'] = { '"zx"zp`[V`]', 'move a line down' },

    -- vnoremap <leader>dh :lua require('dap.ui.variables').visual_hover()<CR>

}


-- TERMINAL MODE --
local terminal_opts = {
	mode = 't',
    prefix = '',
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,
    noremap = true,
    nowait = true,
}

local terminal_mappings = {

    -- leave the terminal mode
    ['<Esc>'] = { '<C-\\><C-n>' ,'leave the TERMINAL mode' },

}


wk.register(mappings, opts)
wk.register(non_leader_mappings, non_leader_opts)
wk.register(insert_mappings, insert_opts)
wk.register(visual_mappings, visual_opts)
wk.register(terminal_mappings, terminal_opts)
