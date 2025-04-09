local none_ls = function()
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
	})
end

return none_ls
