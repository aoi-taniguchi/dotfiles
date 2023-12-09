local M = {}

M.flutter_attach = function()
    local option1 = "1) flutter attach -d linux --debug-port 31569"
    local option2 = "2) "

    vim.ui.select({ option1, option2 },
    {
        prompt = 'Select an option:',
        format_item = function(item)
          return " " .. item
        end,
    },
    function(choice)
        if choice == option1 then
            vim.api.nvim_command("FlutterAttach -d linux --debug-port 31569")
            vim.api.nvim_out_write("attached to flutter process\n")
        else
            vim.api.nvim_out_write("Invalid option\n")
        end
    end
    )
end

M.flutter_quit = function()
    vim.api.nvim_command("FlutterQuit")
    vim.api.nvim_out_write("detached from flutter process\n")
end

return M
