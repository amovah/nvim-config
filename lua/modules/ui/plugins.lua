local conf = require("modules.ui.config")

return {
	{ "navarasu/onedark.nvim", lazy = true },
	{ "sainnhe/edge", lazy = true },
	{ "sainnhe/sonokai", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },
	{ "sainnhe/everforest", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "marko-cerovac/material.nvim", lazy = true },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "olimorris/onedarkpro.nvim", lazy = true },
	{
		"rockyzhang24/arctic.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		name = "arctic",
		branch = "v2",
	},
	{ "rebelot/kanagawa.nvim", lazy = true },
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
