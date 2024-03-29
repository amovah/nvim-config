local config = {}

function config.lspsaga()
	local saga = require("lspsaga")
	saga.setup({
		symbol_in_winbar = {
			enable = true,
		},
	})
end

function config.mason()
	require("mason").setup({})
end

function config.mason_lspconfig()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"gopls",
		},
	})
end

function config.fidget()
	require("fidget").setup({
		progress = {
			ignore_done_already = true,
			ignore = { "null-ls" },
		},
	})
end

return config
