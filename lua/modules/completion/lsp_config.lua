local on_attach = function(client, bufnr)
	require('lsp_signature').on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "rounded"
		}
	}, bufnr)
	require('illuminate').on_attach(client)
end

local lsp_config = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
	local lspconfig = require('lspconfig')
	local server_config = {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
				}
			}
		}
	}

	local lsp_servers = {
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
		'yapf',
	}

	for _, lsp in ipairs(lsp_servers) do
		lspconfig[lsp].setup(server_config)
	end
end

return lsp_config
