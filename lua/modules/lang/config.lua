local config = {}

function config.lsp_setup()
	vim.diagnostic.config({
		virtual_text = true,
	})

	local format_augroup = vim.api.nvim_create_augroup("CustomLspFormatting", {})

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("my.lsp", {}),
		callback = function(args)
			local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
			-- Auto-format ("lint") on save.
			-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
			if
				not client:supports_method("textDocument/willSaveWaitUntil")
				and client:supports_method("textDocument/formatting")
			then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
					buffer = args.buf,
					callback = function()
						vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
					end,
				})
			end
		end,
	})

	-- golang formats
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = format_augroup,
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

	-- lua formats
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = format_augroup,
		buffer = bufnr,
		pattern = "*.lua",
		callback = function()
			vim.lsp.buf.format({
				filter = function(attached_client)
					return attached_client.name ~= "lua_ls"
				end,
				bufnr = bufnr,
			})
		end,
	})

	-- lua formats
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = format_augroup,
		buffer = bufnr,
		pattern = "*.ts,*.tsx,*.js,*.jsx",
		callback = function()
			vim.lsp.buf.format({
				filter = function(attached_client)
					return attached_client.name ~= "ts_ls"
				end,
				bufnr = bufnr,
			})
		end,
	})
end

function config.none_ls()
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
			null_ls.builtins.formatting.buf,
			null_ls.builtins.code_actions.gomodifytags,
		},
	})
end

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

function config.mason_lsp()
	require("mason-lspconfig").setup({
		automatic_enable = true,
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

function config.nvim_treesitter()
	vim.api.nvim_command("set foldmethod=expr")
	vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
	vim.api.nvim_command("set nofoldenable")

	require("nvim-treesitter.configs").setup({
		ensure_installed = { "go", "rust", "javascript" },
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		textobjects = {
			select = {
				enable = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
		autotag = {
			enable = true,
		},
		-- rainbow = {
		-- 	enable = true,
		-- },
		matchup = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	})
end

function config.nvim_treesitter_context()
	require("treesitter-context").setup({
		max_lines = 3,
	})
end

function config.refactoring()
	require("refactoring").setup({})
end

function config.trouble()
	require("trouble").setup({})
end

function config.gotests()
	require("gotests").setup()
end

return config
