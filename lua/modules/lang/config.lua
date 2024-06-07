local config = {}

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
	require("treesitter-context").setup({})
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
