vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "neo-tree".setup {
    close_if_last_window = true,
    popup_border_style = "rounded",
    filesystem = {
        hijack_netrw_behavior = "open_default",
        --group_empty_dirs = true
    },
    window = {
        position = "float",
        mappings = {
            ["<esc>"] = "cancel"
        },
    },
}

vim.keymap.set('n', '<leader>tc', '<cmd>Neotree position=current<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tt', '<cmd>Neotree toggle<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tf', '<cmd>Neotree focus<cr>', { noremap = true, silent = true })
