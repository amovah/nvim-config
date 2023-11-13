local conf = require("modules.completion.config")

return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("modules.completion.lsp_config").lsp_config()
		end,
		dependencies = {
			"RRethy/vim-illuminate",
			"hrsh7th/cmp-nvim-lsp",
			"ray-x/lsp_signature.nvim",
		},
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("modules.completion.lsp_config").none_ls()
		end,
	},
	{
		"williamboman/mason.nvim",
		config = conf.mason,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = conf.mason_lspconfig,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("modules.completion.cmp_config")()
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = conf.lspsaga,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
		},
	},
	{
		"j-hui/fidget.nvim",
		config = conf.fidget,
	},
}
