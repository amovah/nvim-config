local packman = {}

function packman.ensure_packman()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
end

function packman.load()
	require("lazy").setup({
		concurrency = 5,
		spec = {
			{ import = "modules.completion.plugins" },
			{ import = "modules.lang.plugins" },
			{ import = "modules.tools.plugins" },
			{ import = "modules.ui.plugins" },
		},
	})
end

return packman
