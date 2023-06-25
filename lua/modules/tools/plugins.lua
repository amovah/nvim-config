local conf = require("modules.tools.config")

return {
	{
		"nvim-telescope/telescope.nvim",
		config = conf.telescope,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"ThePrimeagen/harpoon",
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
		lazy = true,
		keys = { "gS", "gJ" },
	},
	"tpope/vim-abolish",
	{
		"mg979/vim-visual-multi",
		keys = {
			"<Ctrl>",
			"<M>",
			"<C-n>",
			"<C-n>",
			"<M-n>",
			"<S-Down>",
			"<S-Up>",
			"<M-Left>",
			"<M-i>",
			"<M-Right>",
			"<M-D>",
			"<M-Down>",
			"<C-d>",
			"<C-Down>",
			"<S-Right>",
			"<C-LeftMouse>",
			"<M-LeftMouse>",
			"<M-C-RightMouse>",
			"<Leader>",
		},
		lazy = true,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = conf.colorizer,
	},
	{
		"editorconfig/editorconfig-vim",
		config = conf.editorconfig,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		cmd = { "MarkdownPreview" },
		lazy = true,
	},
	{
		"AckslD/nvim-neoclip.lua",
		config = conf.neoclip,
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
		dir = "~/.config/nvim/lua/updater",
		name = "my-updater-notifier",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"rcarriga/nvim-notify",
		},
		config = conf.updater,
		event = "BufWritePre",
	},
}
