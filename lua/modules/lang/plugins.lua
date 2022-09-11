local plugin = require('core.pack').register_plugin
local conf = require('modules.lang.config')

plugin({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
  requires = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
    -- disabled due to conflict with matchup and it doesn't provide any
    -- highlighting (not my personal prefer)
    -- { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' },
    { 'andymass/vim-matchup', after = 'nvim-treesitter' },
  },
})

plugin({
  'nvim-treesitter/nvim-treesitter-context',
  after = 'nvim-treesitter',
  config = conf.nvim_treesitter_context,
})

plugin({
  'ThePrimeagen/refactoring.nvim',
  opt = true,
  config = conf.refactoring,
  after = { 'nvim-treesitter' }
})

plugin({
  'kevinhwang91/nvim-ufo',
  after = 'nvim-treesitter',
  requires = { "kevinhwang91/promise-async" },
  config = conf.ufo,
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
  'yanskun/gotests.nvim',
  opt = true,
  cmd = { 'GoTests', 'GoTestsAll' },
  config = conf.gotests,
})
