local conf = require("modules.tools.config")

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		config = conf.telescope,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
	},
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		config = conf.gitsigns,
	},
	{
		"rmagatti/auto-session",
		config = conf.auto_session,
	},
	{
		"windwp/nvim-autopairs",
		config = conf.autopairs,
	},
	{
		"numToStr/Comment.nvim",
		config = conf.comment,
	},
	{
		"AndrewRadev/splitjoin.vim",
	},
	"tpope/vim-abolish",
	{
		"mg979/vim-visual-multi",
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
			user_default_options = {
				tailwind = "both", -- Enable tailwind colors
				tailwind_opts = { -- Options for highlighting tailwind names
					update_names = true, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
				},
			},
		},
	},
	{
		"akinsho/git-conflict.nvim",
		cmd = {
			"GitConflictListQf",
			"GitConflictChooseOurs",
			"GitConflictChooseTheirs",
			"GitConflictChooseBoth",
			"GitConflictNextConflict",
		},
		lazy = true,
		config = conf.git_conflict,
	},
	{
		"ggandor/leap.nvim",
		lazy = true,
		keys = { "s", "S" },
		config = conf.leap,
	},
	"tpope/vim-surround",
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = { "LazyGit" },
	},
	{
		"nvim-pack/nvim-spectre",
	},
	{
		"gbprod/yanky.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = conf.yanky,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = conf.harpoon,
	},
}
