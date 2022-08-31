local utils = require('utils')

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {
    "*.go",
    "*.rs",
    "*.sol",
    "*.vim",
    "*.tf",
    "*.lua",
  },
  callback = function()
    vim.lsp.buf.formatting_sync()
  end,
})


vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {
    '*.js',
    '*.ts',
    '*.jsx',
    '*.tsx',
    '*.mjs',
  },
  callback = function()
    local files = utils.scandir(vim.fn.getcwd())
    local has_eslint = false
    for _, v in pairs(files) do
      if v == '.eslintrc.js' then
        has_eslint = true
        break
      end
    end

    if has_eslint then
      vim.cmd("EslintFixAll")
    else
      -- vim.lsp.buf.formatting_sync()
      -- or
      vim.cmd("Neoformat")
    end
  end
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {
    '*.json',
    '*.css',
    '*.scss',
    '*.less',
    '*.md',
    '*.html',
    '*.py',
  },
  callback = function()
    vim.cmd("Neoformat")
  end
})

-- go ogranize import
local org_imports = function(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { "*.go" },
  callback = function()
    org_imports(1000)
  end,
})
