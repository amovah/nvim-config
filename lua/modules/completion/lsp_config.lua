local on_attach = function(client, bufnr)
  require('lsp_signature').on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      }
    }, bufnr)
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
