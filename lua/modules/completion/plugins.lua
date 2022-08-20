local plugin = require('core.pack').register_plugin
-- local lsp_config = require('modules.completion.lsp_config')

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
  -- requires = {
  --   { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
  --   { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
  --   { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
  --   { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
  -- },
})
