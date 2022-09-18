local plugin = require("core.pack").register_plugin
local conf = require("modules.ui.config")

--#region theme
local themes = {
	"rafamadriz/neon",
	"tomasiser/vim-code-dark",
	"marko-cerovac/material.nvim",
	"bluz71/vim-nightfly-guicolors",
	"bluz71/vim-moonfly-colors",
	"folke/tokyonight.nvim",
	"sainnhe/sonokai",
	"mhartington/oceanic-next",
	"sainnhe/edge",
	"yonlu/omni.vim",
	"ray-x/aurora",
	"tanvirtin/monokai.nvim",
	"savq/melange",
	"fenetikm/falcon",
	"shaunsingh/nord.nvim",
	"navarasu/onedark.nvim",
	"sainnhe/gruvbox-material",
	"sainnhe/everforest",
	"NTBBloodbath/doom-one.nvim",
	"nxvu699134/vn-night.nvim",
	"projekt0n/github-nvim-theme",
	"kdheepak/monochrome.nvim",
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
	"glepnir/dashboard-nvim",
	config = conf.dashboard,
})

plugin({
	"glepnir/galaxyline.nvim",
	branch = "main",
	config = conf.galaxyline,
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
