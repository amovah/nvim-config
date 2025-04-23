local lspconfig = require("lspconfig")

local utils = require("utils")

local format_augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_clear_autocmds({ group = format_augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = format_augroup,
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
	end
end

local lsp_config = function()
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function()
			local params = vim.lsp.util.make_range_params()
			params.context = { only = { "source.organizeImports" } }
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

	vim.diagnostic.config({
		virtual_text = true,
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()

	if utils.executable("pyright") then
		lspconfig.pyright.setup({
			cmd = { "delance-langserver", "--stdio" },
			capabilities = capabilities,
			settings = {
				pyright = {
					disableOrganizeImports = false,
					disableTaggedHints = false,
				},
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						typeCheckingMode = "standard",
						useLibraryCodeForTypes = true,
						diagnosticSeverityOverrides = {
							deprecateTypingAliases = false,
						},
					},
				},
			},
		})
		-- else
		-- 	vim.notify("pyright not found!", vim.log.levels.WARN, { title = "Nvim-config" })
	end

	-- set up vim-language-server
	if utils.executable("vim-language-server") then
		lspconfig.vimls.setup({
			flags = {
				debounce_text_changes = 500,
			},
			capabilities = capabilities,
		})
		-- else
		-- 	vim.notify("vim-language-server not found!", vim.log.levels.WARN, { title = "Nvim-config" })
	end

	-- set up bash-language-server
	if utils.executable("bash-language-server") then
		lspconfig.bashls.setup({
			capabilities = capabilities,
		})
	end

	-- settings for lua-language-server can be found on https://luals.github.io/wiki/settings/
	if utils.executable("lua-language-server") then
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					hint = {
						enable = true,
					},
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end

	if utils.executable("gopls") then
		lspconfig.gopls.setup({
			capabilities = capabilities,
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod" },
			root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
		})
	end

	if utils.executable("typescript-language-server") then
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end

	if utils.executable("tailwindcss-language-server") then
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})
	end

	if utils.executable("vscode-css-language-server") then
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})
	end

	if utils.executable("some-sass-language-server") then
		lspconfig.somesass_ls.setup({
			capabilities = capabilities,
		})
	end

	require("lsp_signature").setup({
		bind = true,
		-- hint_enable = false,
	})
end

return lsp_config
