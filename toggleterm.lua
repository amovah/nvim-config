require("toggleterm").setup{
    open_mapping = [[<c-\>]],
}

local opts = {
    noremap = true,
    silent = true
}

vim.api.nvim_set_keymap('n', '<leader>tf', [[<cmd>ToggleTerm direction=float<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>th', [[<cmd>ToggleTerm size=20 direction=horizontal<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>tv', [[<cmd>ToggleTerm size=60 direction=vertical<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>tt', [[<cmd>ToggleTerm direction=tab<CR>]], opts)
