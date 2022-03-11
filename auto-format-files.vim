" golang
autocmd BufWritePre *.go lua goimports(1000)

" formats powerd by lsp
autocmd BufWritePre *.go,*.rs,*.js lua vim.lsp.buf.formatting_sync()

" neoformat for files without LSPs
augroup formatting 
	autocmd!
	autocmd FileType markdown setlocal formatprg=prettier\ --parser\ markdown\ --tab-width\ 4
	autocmd FileType css setlocal formatprg=prettier\ --parser\ css
	autocmd FileType html setlocal formatprg=prettier\ --parser\ html
	autocmd FileType json setlocal formatprg=prettier\ --parser\ json\ --tab-width\ 4
augroup END

let g:neoformat_try_formatprg = 1

augroup fmt
	autocmd!
	autocmd BufWritePre *.json,*.css,*.scss,*.less,*.md,*.html undojoin | Neoformat
augroup END
