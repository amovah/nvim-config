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

return config
