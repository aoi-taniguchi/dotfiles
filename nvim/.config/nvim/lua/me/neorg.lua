require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        -- ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/neorg",
                },
            },
        },
        ["core.presenter"] = {
            config = {
               zen_mode = "zen-mode",
            },
        },
    },
}
