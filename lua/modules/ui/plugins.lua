local conf = require("modules.ui.config")

return {
	{
		"glepnir/zephyr-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("zephyr")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = conf.status_line,
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	{
		"akinsho/bufferline.nvim",
		config = conf.nvim_bufferline,
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{
		"folke/which-key.nvim",
		config = conf.which_key,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = conf.indent_blankline,
	},
}
