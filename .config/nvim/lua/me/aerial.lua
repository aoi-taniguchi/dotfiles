require('aerial').setup({
    on_attach = function(bufnr)
        -- Toggle the aerial window
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ta', '<cmd>AerialToggle!<CR>', {})
        -- Jump forwards/backwards
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
        -- Jump up the tree with
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
    end
})
