" golang
autocmd BufWritePre *.go lua goimports(1000)

" formats powerd by lsp
autocmd BufWritePre *.go,*.rs lua vim.lsp.buf.formatting_sync()

" neoformat for files without LSPs
let g:neoformat_enabled_json = ['prettier']

augroup fmt
	autocmd!
	autocmd BufWritePre *.json undojoin | Neoformat
augroup END
