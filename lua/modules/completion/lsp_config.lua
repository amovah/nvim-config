--   vim.api.nvim_create_autocmd('BufWritePre', {
--     pattern = client.config.filetypes,
--     -- pattern = { "*.go" },
--     callback = function()
--       vim.lsp.buf.formatting_sync()
--     end,
--   })
local on_attach = function(client, bufnr)
  require('illuminate').on_attach(client)
end

local lsp_config = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local lspconfig = require('lspconfig')


  lspconfig['gopls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

return lsp_config
