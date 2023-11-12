local conf = require("modules.ui.config")

return {
	{
		"glepnir/zephyr-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("modules.ui.theme_config")()
		end,
	},
	{ "NLKNguyen/papercolor-theme", lazy = true },
	{ "tomasiser/vim-code-dark", lazy = true },
	{ "marko-cerovac/material.nvim", lazy = true },
	{ "bluz71/vim-nightfly-guicolors", lazy = true },
	{ "bluz71/vim-moonfly-colors", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "sainnhe/sonokai", lazy = true },
	{ "mhartington/oceanic-next", lazy = true },
	{ "sainnhe/edge", lazy = true },
	{ "ray-x/aurora", lazy = true },
	{ "tanvirtin/monokai.nvim", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },
	{ "sainnhe/everforest", lazy = true },
	{ "NTBBloodbath/doom-one.nvim", lazy = true },
	{ "projekt0n/github-nvim-theme", lazy = true },
	{ "rose-pine/neovim", lazy = true },
	{ "catppuccin/nvim", as = "catppuccin", lazy = true },
	{ "FrenzyExists/aquarium-vim", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "ldelossa/vimdark", lazy = true },
	{ "Everblush/everblush.nvim", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "tiagovla/tokyodark.nvim", lazy = true },
	{ "yazeed1s/minimal.nvim", lazy = true },
	{ "Mofiqul/adwaita.nvim", lazy = true },
	{ "olimorris/onedarkpro.nvim", lazy = true },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = true },
	{ "Shatur/neovim-ayu", lazy = true },
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
