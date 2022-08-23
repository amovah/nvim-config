local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin({ 'glepnir/zephyr-nvim', config = conf.zephyr })

plugin({ 'glepnir/dashboard-nvim', config = conf.dashboard })

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
	config = conf.which_key
})
