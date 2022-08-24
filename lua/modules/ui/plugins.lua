local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

--#region theme
local themes = {
	'ellisonleao/gruvbox.nvim',
	'Abstract-IDE/Abstract-cs',
	'rafamadriz/neon',
	'tomasiser/vim-code-dark',
	'marko-cerovac/material.nvim',
	'bluz71/vim-nightfly-guicolors',
	'bluz71/vim-moonfly-colors',
	'folke/tokyonight.nvim',
	'sainnhe/sonokai',
	'kyazdani42/blue-moon',
	'mhartington/oceanic-next',
	'rockerBOO/boo-colorscheme-nvim',
	'sainnhe/edge',
	'bkegley/gloombuddy',
	'Th3Whit3Wolf/space-nvim',
	'Th3Whit3Wolf/one-nvim',
	'yonlu/omni.vim',
	'ray-x/aurora',
	'tanvirtin/monokai.nvim',
	'savq/melange',
	'fenetikm/falcon',
	'shaunsingh/nord.nvim',
	'shaunsingh/moonlight.nvim',
	'navarasu/onedark.nvim',
	'lourenci/github-colors',
	'sainnhe/gruvbox-material',
	'sainnhe/everforest',
	'NTBBloodbath/doom-one.nvim',
	'yashguptaz/calvera-dark.nvim',
	'nxvu699134/vn-night.nvim',
	'adisen99/codeschool.nvim',
	'projekt0n/github-nvim-theme',
	'kdheepak/monochrome.nvim',
	'rose-pine/neovim',
	'mcchrish/zenbones.nvim',
	'catppuccin/nvim',
	'FrenzyExists/aquarium-vim',
	'EdenEast/nightfox.nvim',
	'kvrohit/substrata.nvim',
	'ldelossa/vimdark',
	'Everblush/everblush.nvim',
	'olimorris/onedarkpro.nvim',
	'rmehri01/onenord.nvim',
	'RishabhRD/gruvy',
	'rebelot/kanagawa.nvim',
	'luisiacc/gruvbox-baby',
	'tiagovla/tokyodark.nvim',
	'kvrohit/rasmus.nvim',
	'yazeed1s/minimal.nvim',
	'lewpoly/sherbet.nvim',
	'Mofiqul/adwaita.nvim',
	'olivercederborg/poimandres.nvim',
}
plugin({
	'glepnir/zephyr-nvim',
	config = function()
		require('modules.ui.config').zephyr()
	end,
})
for _, theme in pairs(themes) do
	plugin({
		theme,
	})
end
--#endregion

plugin({
	'glepnir/dashboard-nvim',
	config = conf.dashboard,
})

plugin({
	'glepnir/galaxyline.nvim',
	branch = 'main',
	config = conf.galaxyline,
	requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
	'kyazdani42/nvim-tree.lua',
	cmd = 'NvimTreeToggle',
	config = conf.nvim_tree,
	requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
	'akinsho/bufferline.nvim',
	config = conf.nvim_bufferline,
	requires = 'kyazdani42/nvim-web-devicons',
	after = 'nvim-lspconfig',
})

plugin({
	'folke/which-key.nvim',
	config = conf.which_key,
})
