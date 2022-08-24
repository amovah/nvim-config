local config = {}

function config.lspsaga()
	local saga = require('lspsaga')
	saga.init_lsp_saga({
		-- symbol_in_winbar = {
		--   enable = true,
		-- },
	})
end

function config.mason()
	require('mason').setup({})
end

function config.mason_lspconfig()
	require("mason-lspconfig").setup({
		ensure_installed = {
			'gopls',
			'rust_analyzer',
			'tsserver',
			'eslint',
			'sqls',
			'dockerls',
			'cssls',
			'jedi_language_server',
			'solc',
			'tailwindcss',
			'terraformls',
			'vimls',
			'sumneko_lua',
		}
	})
end

return config
