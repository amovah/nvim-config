" golang
autocmd BufWritePre *.go lua OrgImports(1000)
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

" formats powerd by lsp
autocmd BufWritePre *.go,*.rs lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx EslintFixAll

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
