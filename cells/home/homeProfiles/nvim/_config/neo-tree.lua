vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "neo-tree".setup {
    close_if_last_window = true,
    filesystem = {
        hijack_netrw_behavior = "open_current",
        group_empty_dirs = true
    },
}

vim.keymap.set('n', '<leader>tc', 'Neotree position=current', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tt', 'Neotree toggle', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tf', 'Neotree focus', { noremap = true, silent = true })
