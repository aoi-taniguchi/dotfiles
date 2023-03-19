require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "bashls",
        "clangd",
        "cmake",
        "dockerls",
        "html",
        "jsonls",
        "marksman",
        "pyright",
        "yamlls",
    },
    automatic_installation = true,
})


----- general diagnose settings start -----
local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn',  text = '' },
    { name = 'DiagnosticSignHint',  text = '' },
    { name = 'DiagnosticSignInfo',  text = '' },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

local config = {
    virtual_text = false,
    signs = {
        active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
}

vim.diagnostic.config(config)

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, opts)
----- general diagnose settings end -----


-- lspconfig
local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
    -- -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local tb = require('telescope.builtin')

    -- # list
    vim.keymap.set('n', '<leader><C-l>ld', tb.diagnostics, bufopts)

    -- # go to *
    vim.keymap.set('n', '<leader><C-l>gd', tb.lsp_definitions, bufopts)
    vim.keymap.set('n', '<leader><C-l>gtd', tb.lsp_type_definitions, bufopts)
    vim.keymap.set('n', '<leader><C-l>lr', tb.lsp_references, bufopts)
    vim.keymap.set('n', '<leader><C-l>lic', tb.lsp_incoming_calls, bufopts)
    vim.keymap.set('n', '<leader><C-l>loc', tb.lsp_outgoing_calls, bufopts)
    vim.keymap.set('n', '<leader><C-l>lim', tb.lsp_implementations, bufopts)
    vim.keymap.set('n', '<leader><C-l>lds', tb.lsp_document_symbols, bufopts)
    vim.keymap.set('n', '<leader><C-l>lws', tb.lsp_workspace_symbols, bufopts)
    vim.keymap.set('n', '<leader><C-l>ldws', tb.lsp_dynamic_workspace_symbols, bufopts)

    -- # show *
    vim.keymap.set('n', '<S-k>', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-p>', vim.lsp.buf.signature_help, bufopts)

    -- # workspace
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)

    -- # buffer
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

    -- # format
    vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
    end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_servers = { 'bashls', 'clangd', 'cmake', 'dockerls', 'html', 'jsonls', 'marksman', 'pyright' }

for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

lspconfig['lua_ls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

lspconfig['yamlls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
            },
        },
    },
}


-- cmp / lspkind / buffer / path / cmdline / UltiSnips
local cmp = require('cmp')
local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(
            function(fallback)
                cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
            end,
            { 'i', 's', --[[ "c" (to enable the mapping in command mode) ]]  }
        ),
        ['<S-Tab>'] = cmp.mapping(
            function(fallback)
                cmp_ultisnips_mappings.jump_backwards(fallback)
            end,
            { 'i', 's', --[[ "c" (to enable the mapping in command mode) ]]  }
        ),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'cmp_tabnine' },
        { name = 'ultisnips' },
    },
    formatting = {
        format = require('lspkind').cmp_format({
            mode = 'symbol',
            maxwidth = 50,
        })
    },
}

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
