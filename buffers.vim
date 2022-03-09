" mapping
nmap <silent> <Tab> :bn<CR>
nmap <silent> <S-Tab> :bp<CR>

" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>


" close buffer
nnoremap <silent><Leader>q :bd<CR>
nnoremap <silent><Leader>Q :bd<CR>

" Close all other buffers except current one
nnoremap <Leader>db :silent w <BAR> :silent %bd <BAR> e#<CR>

" nnoremap gx :call netrw#BrowseX(expand('<cfile>'), netrw#CheckIfRemote())<CR>

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv
