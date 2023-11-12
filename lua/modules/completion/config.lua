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
	require("fidget").setup({})
end

function config.ale()
	vim.g.ale_fixers = {
		proto = { "buf-format" },
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettier", "eslint" },
		typescript = { "prettier", "eslint" },
		css = { "prettier" },
		html = { "prettier" },
		markdown = { "prettier" },
		solidity = { "forge" },
	}
	vim.g.ale_linters = {
		proto = { "buf-lint" },
	}
	vim.g.ale_fix_on_save = 1
	vim.g.ale_use_neovim_diagnostics_api = 1
	vim.g.ale_completion_autoimport = 0
	vim.g.ale_lint_on_text_changed = 0
	vim.g.ale_lint_on_insert_leave = 1
	vim.g.ale_linters_explicit = 1
end

return config
