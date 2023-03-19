local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        formatting.black.with({ extra_args = { "--fast" } }),
        -- formatting.clang_format,
        -- formatting.cmake_format,
        -- formatting.jq,
        -- formatting.json_tool,
    }
})
