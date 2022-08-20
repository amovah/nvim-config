local plugin = require('core.pack').register_plugin

plugin({
  'neovim/nvim-lspconfig',
  ft = { 'go' },
  config = function()
    require('modules.completion.lsp_config')()
  end,
  requires = {
    'RRethy/vim-illuminate',
    'hrsh7th/cmp-nvim-lsp'
  }
})

plugin({
 'williamboman/mason.nvim',
 config = function ()
   require("mason").setup()
 end,
})

plugin({
  'hrsh7th/nvim-cmp',
  event = 'BufReadPre',
  requires = {
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
    { 'hrsh7th/vim-vsnip', after = 'nvim-cmp' },
    { 'hrsh7th/vim-vsnip-integ', after = 'nvim-cmp' },
    { 'rafamadriz/friendly-snippets', after = 'nvim-cmp' },
  },
  config = function()
    require('modules.completion.cmp_config')()
  end
})
