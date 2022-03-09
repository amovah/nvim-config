" golang
autocmd BufWritePre *.go lua goimports(1000)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()