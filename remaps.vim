nnoremap Y y$

" fugitive
nnoremap <leader>gc :Gdiffsplit!<CR>
nnoremap <leader>gp :diffput //1<CR>
nnoremap <leader>g0 :diffput<CR>
nnoremap <leader>gtr :diffget //3<CR>
nnoremap <leader>gtl :diffget //2<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap , ,<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

