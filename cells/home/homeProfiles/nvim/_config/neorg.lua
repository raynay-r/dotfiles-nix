require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    home = "~/notes/home",
                    work = "~/notes/work",
                    personal = "~/notes/personal",
                    forge = "~/notes/openforge"
                }
            }
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
                name = "[Neorg]"
            }
        },
        ["core.concealer"] = {
            config = {
                folds = false,
                icon_preset = "basic",
                init_open_folds = "never"
            }
        },
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode"
            }
        },
        ["core.export"] = {},
        ["core.export.markdown"] = {}
    }
}
