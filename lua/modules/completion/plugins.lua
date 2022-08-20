local plugin = require('core.pack').register_plugin
local lsp_config = require('modules.completion.lsp_config')

plugin({
  'neovim/nvim-lspconfig',
  ft = {
    'go',
  },
  config = lsp_config,
  requires = {
    'RRethy/vim-illuminate'
  }
})

plugin({
 'williamboman/mason.nvim',
 config = function ()
   require("mason").setup()
 end,
})

