require'nvim-tree'.setup {
	open_on_tab = true,
	view = {
		number = true,
		relativenumber = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
    actions = {
        change_dir = {
            restrict_above_cwd = true,
        },
        open_file = {
            quit_on_open = true,
        },
    },
}

vim.api.nvim_command('nnoremap <silent>- :NvimTreeToggle<CR>')
vim.api.nvim_command('nnoremap <leader>r :NvimTreeRefresh<CR>')
