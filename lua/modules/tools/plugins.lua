local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({
  'nvim-telescope/telescope.nvim',
  config = conf.telescope,
  requires = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
  },
})

plugin({
  'tpope/vim-fugitive',
})

plugin({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({})
  end
})
