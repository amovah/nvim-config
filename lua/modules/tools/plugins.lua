local conf = require("modules.tools.config")

return {
	{
		"nvim-telescope/telescope.nvim",
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
		"norcalli/nvim-colorizer.lua",
		config = conf.colorizer,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm ci",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		cmd = { "MarkdownPreview" },
		lazy = true,
	},
	{
		"mbbill/undotree",
		lazy = true,
		cmd = "UndotreeToggle",
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
}
