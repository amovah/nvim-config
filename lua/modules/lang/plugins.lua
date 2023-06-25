local conf = require("modules.lang.config")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		run = ":TSUpdate",
		config = conf.nvim_treesitter,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
			"andymass/vim-matchup",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = conf.nvim_treesitter_context,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		lazy = true,
		config = conf.refactoring,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = conf.ufo,
	},
	{
		"simrat39/symbols-outline.nvim",
		lazy = true,
		cmd = {
			"SymbolsOutline",
			"SymbolsOutlineClose",
			"SymbolsOutlineOpen",
		},
		config = conf.symbols_outline,
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		cmd = { "Trouble" },
		config = conf.trouble,
	},
	{
		"yanskun/gotests.nvim",
		lazy = true,
		cmd = { "GoTests", "GoTestsAll" },
		config = conf.gotests,
	},
}
