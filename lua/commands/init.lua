vim.api.nvim_create_user_command(
	'SetTheme',
	function()
		local colorscheme = vim.g.colors_name
		local theme_path = vim.fn.stdpath('data') .. '/theme'
		os.execute('echo ' .. colorscheme .. ' > ' .. theme_path)
	end,
	{}
)
