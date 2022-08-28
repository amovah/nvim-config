local config = {}

function config.telescope()
	require('telescope').setup({
		defaults = {
			layout_config = {
				horizontal = { prompt_position = 'top', results_width = 0.6 },
				vertical = { mirror = false },
			},
			sorting_strategy = 'ascending',
			file_previewer = require('telescope.previewers').vim_buffer_cat.new,
			grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
			qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
		},
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			},
		},
	})

	require('telescope').load_extension('fzy_native')
	require("telescope").load_extension('harpoon')
end

function config.gitsigns()
	require('gitsigns').setup({})
end

function config.auto_session()
	require('auto-session').setup({
		bypass_session_save_file_types = { 'dashboard' }
	})
end

function config.autopairs()
	require('nvim-autopairs').setup({})
end

function config.comment()
	require('Comment').setup({})
end

function config.indent_blankline()
	require("indent_blankline").setup({})
end

function config.colorizer()
	require('colorizer').setup({})
end

function config.twilight()
	require('twilight').setup({})
end

function config.editorconfig()
	vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
end

function config.neoclip()
	require('neoclip').setup({})
	require("telescope").load_extension("neoclip")
end

function config.true_zen()
	require('true-zen').setup({})
end

function config.rest()
	require('rest-nvim').setup({})
end

function config.git_conflict()
	require('git-conflict').setup({})
end

function config.leap()
	require('leap').set_default_keymaps()
end

return config
