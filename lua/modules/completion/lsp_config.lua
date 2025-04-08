local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					filter = function(attached_client)
						return attached_client.name ~= "ts_ls" and attached_client.name ~= "lua_ls"
					end,
					bufnr = bufnr,
				})
			end,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				local params = vim.lsp.util.make_range_params()
				params.context = { only = { "source.organizeImports" } }
				-- buf_request_sync defaults to a 1000ms timeout. Depending on your
				-- machine and codebase, you may want longer. Add an additional
				-- argument after params if you find that you have to write the file
				-- twice for changes to be saved.
				-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
				local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
				for cid, res in pairs(result or {}) do
					for _, r in pairs(res.result or {}) do
						if r.edit then
							local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
							vim.lsp.util.apply_workspace_edit(r.edit, enc)
						end
					end
				end
				vim.lsp.buf.format({ async = false })
			end,
		})
	end

	require("lsp_signature").on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "rounded",
		},
	}, bufnr)
end

function M.lsp_config()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

  vim.diagnostic.config({
    virtual_text = true
  })

	local lsp_servers = {
		"ts_ls",
		"pylyzer",
		"vimls",
		"bashls",
		"tailwindcss",
	}

	for _, lsp in ipairs(lsp_servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end

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

	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})
end

function M.none_ls()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			require("none-ls.diagnostics.eslint").with({
				only_local = "./node_modules/.bin",
			}),
			null_ls.builtins.formatting.prettierd,
			require("none-ls.formatting.eslint").with({
				only_local = "./node_modules/.bin",
			}),
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.swiftformat,
			null_ls.builtins.formatting.buf,
			null_ls.builtins.formatting.forge_fmt,
			null_ls.builtins.code_actions.gomodifytags,
		},
		on_attach = on_attach,
	})
end

return M
