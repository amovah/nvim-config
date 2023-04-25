local plugin = require("core.pack").register_plugin
local conf = require("modules.ui.config")

--#region theme
local themes = {
	"tomasiser/vim-code-dark",
	"marko-cerovac/material.nvim",
	"bluz71/vim-nightfly-guicolors",
	"bluz71/vim-moonfly-colors",
	"folke/tokyonight.nvim",
	"sainnhe/sonokai",
	"mhartington/oceanic-next",
	"sainnhe/edge",
	"ray-x/aurora",
	"tanvirtin/monokai.nvim",
	"sainnhe/gruvbox-material",
	"sainnhe/everforest",
	"NTBBloodbath/doom-one.nvim",
	"projekt0n/github-nvim-theme",
	"rose-pine/neovim",
	{ "catppuccin/nvim", as = "catppuccin" },
	"FrenzyExists/aquarium-vim",
	"EdenEast/nightfox.nvim",
	"ldelossa/vimdark",
	"Everblush/everblush.nvim",
	"rebelot/kanagawa.nvim",
	"tiagovla/tokyodark.nvim",
	"yazeed1s/minimal.nvim",
	"Mofiqul/adwaita.nvim",
	"olimorris/onedarkpro.nvim",
	"nyoom-engineering/oxocarbon.nvim",
	"Shatur/neovim-ayu",
}
plugin({
	"glepnir/zephyr-nvim",
	config = function()
		require("modules.ui.theme_config")()
	end,
})
for _, theme in pairs(themes) do
	if type(theme) == "table" then
		plugin(theme)
	else
		plugin({
			theme,
		})
	end
end
--#endregion

plugin({
	"nvim-lualine/lualine.nvim",
	config = conf.status_line,
	requires = "kyazdani42/nvim-web-devicons",
})

plugin({
	"kyazdani42/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
	config = conf.nvim_tree,
	requires = "kyazdani42/nvim-web-devicons",
})

plugin({
	"akinsho/bufferline.nvim",
	config = conf.nvim_bufferline,
	requires = "kyazdani42/nvim-web-devicons",
	after = "nvim-lspconfig",
})

plugin({
	"folke/which-key.nvim",
	config = conf.which_key,
})

plugin({
	"lukas-reineke/indent-blankline.nvim",
	config = conf.indent_blankline,
})
