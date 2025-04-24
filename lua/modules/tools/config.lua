local config = {}

function config.telescope()
	require("telescope").setup({
		defaults = {
			layout_config = {
				horizontal = { prompt_position = "top", results_width = 0.6 },
				vertical = { mirror = false },
			},
			sorting_strategy = "ascending",
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		},
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			},
		},
	})

	require("telescope").load_extension("fzy_native")
	require("telescope").load_extension("file_browser")
end

function config.gitsigns()
	require("gitsigns").setup({})
end

function config.auto_session()
	require("auto-session").setup({
		bypass_session_save_file_types = { "dashboard" },
		log_level = "error",
	})
end

function config.autopairs()
	require("nvim-autopairs").setup({})
end

function config.comment()
	require("Comment").setup({})
end

function config.colorizer()
	require("colorizer").setup({})
end

function config.git_conflict()
	require("git-conflict").setup({})
end

function config.leap()
	require("leap").set_default_keymaps()
end

function config.updater()
	require("updater").setup()
end

function config.yanky()
	require("yanky").setup({
		preserve_cursor_position = {
			enabled = true,
		},
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 300,
		},
	})

	require("telescope").load_extension("yank_history")
end

function config.harpoon()
	require("harpoon").setup({})
	require("telescope").load_extension("harpoon")
end

return config
