local plugin = require('core.pack').register_plugin
local conf = require('modules.editor.config')

plugin({
 'windwp/nvim-autopairs',
 config = conf.autopairs
})

plugin({
 'tpope/vim-surround'
})
