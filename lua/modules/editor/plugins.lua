local plugin = require('core.pack').register_plugin
local conf = require('modules.editor.config')

plugin({
  'windwp/nvim-autopairs',
  config = conf.autopairs
})

plugin({
  'tpope/vim-surround'
})

plugin({
  'numToStr/Comment.nvim',
  config = conf.comment,
})

plugin({
  'lukas-reineke/indent-blankline.nvim',
  config = conf.indent_blankline,
})

plugin({
  'AndrewRadev/splitjoin.vim',
})

plugin({
  'tpope/vim-abolish',
})

plugin({
  'mg979/vim-visual-multi',
})

plugin({
  'norcalli/nvim-colorizer.lua',
  config = conf.colorizer,
})

plugin({
  'folke/twilight.nvim',
  config = conf.twilight,
  opt = true,
  cmd = {
    'Twilight',
    'TwilightEnable',
    'TwilightDisable',
  },
})

plugin({
  'editorconfig/editorconfig-vim',
  config = conf.editorconfig
})
