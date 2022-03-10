" golang
autocmd BufWritePre *.go lua goimports(1000)

" formats powerd by lsp
autocmd BufWritePre *.go,*.rs lua vim.lsp.buf.formatting_sync()
