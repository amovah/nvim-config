local config = {}

function config.galaxyline()
	require("modules.ui.eviline")
end

function config.nvim_bufferline()
	require("bufferline").setup({
		options = {
			modified_icon = "✥",
			buffer_close_icon = "",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local has_error = false
				for e, _ in pairs(diagnostics_dict) do
					if e == "error" then
						has_error = true
						break
					end
				end

				local s = "(" .. count .. ")"
				if has_error then
					s = s .. "  "
				end
				return s
			end,
		},
	})
end

function config.nvim_tree()
	require("nvim-tree").setup({
		disable_netrw = false,
		hijack_cursor = true,
		hijack_netrw = true,
	})
end

function config.which_key()
	require("which-key").setup({})
end

function config.indent_blankline()
	require("indent_blankline").setup({})
end

function config.status_line()
	require("modules.ui.evil_lualine")
end

return config
