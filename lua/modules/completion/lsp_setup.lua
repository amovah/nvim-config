local api = vim.api
local lsp = vim.lsp
local lspconfig = require("lspconfig")

local utils = require("utils")

local lsp_config = function()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("buf_behavior_conf", { clear = true }),
		callback = function(event_context)
			local client = vim.lsp.get_client_by_id(event_context.data.client_id)

			if not client then
				return
			end

			local bufnr = event_context.buf

			if client.server_capabilities.documentHighlightProvider then
				local gid = api.nvim_create_augroup("lsp_document_highlight", { clear = true })
				api.nvim_create_autocmd("CursorHold", {
					group = gid,
					buffer = bufnr,
					callback = function()
						lsp.buf.document_highlight()
					end,
				})

				api.nvim_create_autocmd("CursorMoved", {
					group = gid,
					buffer = bufnr,
					callback = function()
						lsp.buf.clear_references()
					end,
				})
			end
		end,
		nested = true,
		desc = "Configure buffer keymap and behavior based on LSP",
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- For what diagnostic is enabled in which type checking mode, check doc:
	-- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#diagnostic-settings-defaults
	-- Currently, the pyright also has some issues displaying hover documentation:
	-- https://www.reddit.com/r/neovim/comments/1gdv1rc/what_is_causeing_the_lsp_hover_docs_to_looks_like/

	if utils.executable("pyright") then
		-- local new_capability = {
		-- 	-- this will remove some of the diagnostics that duplicates those from ruff, idea taken and adapted from
		-- 	-- here: https://github.com/astral-sh/ruff-lsp/issues/384#issuecomment-1989619482
		-- 	textDocument = {
		-- 		publishDiagnostics = {
		-- 			tagSupport = {
		-- 				valueSet = { 2 },
		-- 			},
		-- 		},
		-- 		hover = {
		-- 			contentFormat = { "plaintext" },
		-- 			dynamicRegistration = true,
		-- 		},
		-- 	},
		-- }
		-- local merged_capability = vim.tbl_deep_extend("force", capabilities, new_capability)

		lspconfig.pyright.setup({
			cmd = { "delance-langserver", "--stdio" },
			capabilities = merged_capability,
			settings = {
				pyright = {
					-- disable import sorting and use Ruff for this
					disableOrganizeImports = true,
					disableTaggedHints = false,
				},
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						typeCheckingMode = "standard",
						useLibraryCodeForTypes = true,
						-- we can this setting below to redefine some diagnostics
						diagnosticSeverityOverrides = {
							deprecateTypingAliases = false,
						},
						-- inlay hint settings are provided by pylance?
						inlayHints = {
							callArgumentNames = "partial",
							functionReturnTypes = true,
							pytestParameters = true,
							variableTypes = true,
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
		})
	end
end


return lsp_config
