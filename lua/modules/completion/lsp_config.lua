local M = {}

local org_imports = function(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					filter = function(client)
						return client.name ~= "tsserver" and client.name ~= "sumneko_lua"
					end,
					bufnr = bufnr,
				})
			end,
		})

		if client.name == "gopls" then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					org_imports(1000)
				end,
			})
		end
	end

	require("lsp_signature").on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "rounded",
		},
	}, bufnr)
	require("illuminate").on_attach(client)
end

function M.lsp_config()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local lsp_servers = {
		"rust_analyzer",
		"tsserver",
		"dockerls",
		"cssls",
		"jedi_language_server",
		"solc",
		"tailwindcss",
		"terraformls",
		"vimls",
		"bashls",
		"sourcekit",
		"jsonls",
		"bufls",
	}

	for _, lsp in ipairs(lsp_servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end

	lspconfig.solc.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "solc", "--lsp" },
	})

	lspconfig.gopls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "gopls", "serve" },
		filetypes = { "go", "gomod" },
		root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
	})

	lspconfig.yamlls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			yaml = {
				schemas = {
					kubernetes = "globPattern",
				},
			},
		},
	})

	local sumneko_config = require("modules.completion.sumneko_lua_lsp")
	sumneko_config.on_attach = on_attach
	sumneko_config.capabilities = capabilities
	lspconfig.sumneko_lua.setup(sumneko_config)
end

function M.null_ls()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.diagnostics.eslint_d,
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.eslint_d,
			null_ls.builtins.formatting.yapf,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.swiftformat,
			null_ls.builtins.formatting.protolint,
		},
		on_attach = on_attach,
	})
end

return M
