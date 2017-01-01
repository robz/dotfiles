" TEXT FORMATTING
set mouse=a

" delete trailing whitespace when saving files
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" tabs
set expandtab " insert spaces instead of tab character
set shiftwidth=2 " `>>` will tab 2 spaces
set tabstop=2 " `tab` will tab 2 spaces

" formatting
"set textwidth=80 " line character limit (for wrapping)
"set formatoptions=cq " wrap when writing comments





""" NAVIGATION

" kill the arrow keys!
" (forces you to learn hjkl, and switch to normal mode for navigation)
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

" Wrap pane navigation
function! s:GotoNextWindow( direction, count )
  let l:prevWinNr = winnr()
  execute a:count . 'wincmd' a:direction
  return winnr() != l:prevWinNr
endfunction

function! s:JumpWithWrap( direction, opposite )
  if ! s:GotoNextWindow(a:direction, v:count1)
    call s:GotoNextWindow(a:opposite, 999)
  endif
endfunction

nnoremap <silent> <C-w>h :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-w>j :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-w>k :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-w>l :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>

" Pane swapping
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

noremap <silent> <leader>sw :call MarkWindowSwap()<CR>
noremap <silent> <leader>rw :call DoWindowSwap()<CR>





""" LOOK & FEEL
set number
syntax on
set background=dark
colorscheme monokai

set statusline=%f%=\ \ \ %{&fo}\ \ %c,%l\ /\ %L
set cursorline " underline the line that the cursor is on
set laststatus=2 " always show statusline
