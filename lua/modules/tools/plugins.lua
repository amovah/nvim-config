local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({
	'nvim-telescope/telescope.nvim',
	config = conf.telescope,
	requires = {
		'nvim-lua/popup.nvim',
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-fzy-native.nvim',
		'ThePrimeagen/harpoon',
	},
})

plugin({
	'tpope/vim-fugitive',
})

plugin({
	'kdheepak/lazygit.nvim',
	opt = true,
	cmd = { 'LazyGit' }
})

plugin({
	'lewis6991/gitsigns.nvim',
	config = conf.gitsigns,
})

plugin({
	'rmagatti/auto-session',
	config = conf.auto_session,
})

plugin({
	'windwp/nvim-autopairs',
	config = conf.autopairs
})

plugin({
	'tpope/vim-surround',
})

plugin({
	'numToStr/Comment.nvim',
	opt = true,
	keys = { 'g' },
	config = conf.comment,
})

plugin({
	'lukas-reineke/indent-blankline.nvim',
	config = conf.indent_blankline,
})

plugin({
	'AndrewRadev/splitjoin.vim',
	opt = true,
	keys = { 'gS', 'gJ' }
})

plugin({
	'tpope/vim-abolish',
})

plugin({
	'mg979/vim-visual-multi',
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
	opt = true,
})

plugin({
	'norcalli/nvim-colorizer.lua',
	config = conf.colorizer,
})

plugin({
	'folke/twilight.nvim',
	config = conf.twilight,
	opt = true,
	cmd = {
		'Twilight',
		'TwilightEnable',
		'TwilightDisable',
	},
})

plugin({
	'editorconfig/editorconfig-vim',
	config = conf.editorconfig
})

plugin({
	'wellle/targets.vim',
})

plugin({
	"iamcco/markdown-preview.nvim",
	run = "cd app && npm install",
	setup = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	cmd = { "MarkdownPreview" },
})

plugin({
	"AckslD/nvim-neoclip.lua",
	after = { 'telescope.nvim' },
	config = conf.neoclip,
})

plugin({
	'Pocco81/true-zen.nvim',
	opt = true,
	cmd = { "TZAtaraxis", "TZMinimalist", "TZNarrow", "TZFocus" },
	config = conf.true_zen,
})

plugin({
	'mbbill/undotree',
	opt = true,
	cmd = 'UndotreeToggle',
})

-- TODO: key mapping is missing, should add
plugin({
	'NTBBloodbath/rest.nvim',
	opt = true,
	ft = { 'http' },
	config = conf.rest,
	requires = { "nvim-lua/plenary.nvim" },
})

plugin({
	'akinsho/git-conflict.nvim',
	cmd = {
		"GitConflictListQf",
		"GitConflictChooseOurs",
		"GitConflictChooseTheirs",
		"GitConflictChooseBoth",
		"GitConflictNextConflict",
	},
	opt = true,
	config = conf.git_conflict,
})

plugin({
	'ggandor/leap.nvim',
	opt = true,
	keys = { 's', 'S' },
	config = conf.leap,
})
