" pretty colors!
syntax on

" kill the arrow keys (forces you to use normal mode for navigation)
vnoremap <Left>  <NOP>
vnoremap <Right> <NOP>
vnoremap <Up>    <NOP>
vnoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" add control-s to save in normal mode
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>

" line numbers
set nu

" tabs
set expandtab
set shiftwidth=2
set tabstop=2

" show line # and column # and view % in last row
set laststatus=2
set ruler
