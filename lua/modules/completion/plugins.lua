local plugin = require("core.pack").register_plugin
local conf = require("modules.completion.config")

plugin({
	"neovim/nvim-lspconfig",
	config = function()
		require("modules.completion.lsp_config").lsp_config()
	end,
	requires = {
		"RRethy/vim-illuminate",
		"hrsh7th/cmp-nvim-lsp",
		"ray-x/lsp_signature.nvim",
	},
})

plugin({
	"jose-elias-alvarez/null-ls.nvim",
	after = "nvim-lspconfig",
	config = function()
		require("modules.completion.lsp_config").null_ls()
	end,
})

plugin({
	"glepnir/lspsaga.nvim",
	cmd = "Lspsaga",
	config = conf.lspsaga,
	after = "nvim-lspconfig",
})

plugin({
	"williamboman/mason.nvim",
	config = conf.mason,
})

plugin({
	"williamboman/mason-lspconfig.nvim",
	after = "mason.nvim",
	config = conf.mason_lspconfig,
})

plugin({
	"j-hui/fidget.nvim",
	after = "nvim-lspconfig",
	config = conf.fidget,
})

plugin({
	"hrsh7th/nvim-cmp",
	requires = {
		"onsails/lspkind.nvim",
		{ "hrsh7th/cmp-path", after = "nvim-cmp" },
		{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
		{ "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
		{ "hrsh7th/vim-vsnip", after = "nvim-cmp" },
		{ "hrsh7th/vim-vsnip-integ", after = "nvim-cmp" },
		{ "rafamadriz/friendly-snippets", after = "nvim-cmp" },
	},
	config = function()
		require("modules.completion.cmp_config")()
	end,
	after = "nvim-lspconfig",
})
