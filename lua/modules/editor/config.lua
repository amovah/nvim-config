local config = {}

function config.autopairs()
  require('nvim-autopairs').setup({})
end

function config.comment()
  require('Comment').setup({})
end

function config.indent_blankline()
  require("indent_blankline").setup({})
end

function config.colorizer()
  require('colorizer').setup({})
end

return config
