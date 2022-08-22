local plugin = require('core.pack').register_plugin
local conf = require('modules.lang.config')

plugin({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
  requires = {
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
  },
})

plugin({
  'nvim-treesitter/nvim-treesitter-textobjects',
  after = 'nvim-treesitter',
})

plugin({
  'simrat39/symbols-outline.nvim',
  opt = true,
  cmd = {
    'SymbolsOutline',
    'SymbolsOutlineClose',
    'SymbolsOutlineOpen'
  },
  config = conf.symbols_outline,
})

plugin({
  'folke/trouble.nvim',
  opt = true,
  cmd = { 'Trouble' },
  config = conf.trouble,
})

plugin({
  'sbdchd/neoformat',
  opt = true,
  cmd = { 'Neoformat' },
})
