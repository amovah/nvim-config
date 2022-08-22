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

function config.twilight()
  require('twilight').setup({})
end

function config.editorconfig()
  vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
end

return config
