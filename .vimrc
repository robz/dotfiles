" backspace for ondemand
set backspace=indent,eol,start

" syntax highlighting
syntax enable
source ~/.vim/syntax/reason.vim

" plugins https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'prettier/vim-prettier', { 
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ }
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
call plug#end()

"if executable('flow')
"  au User lsp_setup call lsp#register_server({
"    \ 'name': 'flow',
"    \ 'cmd': {server_info->['flow', 'lsp']},
"    \ 'allowlist': ['javascript'],
"    \ })
"endif
"
"if executable('hh_client')
"  au User lsp_setup call lsp#register_server({
"    \ 'name': 'hh_client',
"    \ 'cmd': {server_info->['hh_client', 'lsp']},
"    \ 'allowlist': ['php'],
"    \ })
"endif
"
"if executable('ocamllsp')
"  au User lsp_setup call lsp#register_server({
"    \ 'name': 'ocamllsp',
"    \ 'cmd': {server_info->['ocamllsp']},
"    \ 'allowlist': ['reason'],
"    \ })
"elseif executable('ocaml-language-server')
"  au User lsp_setup call lsp#register_server({
"    \ 'name': 'ocaml-language-server',
"    \ 'cmd': {server_info->['ocaml-language-server', '--stdio']},
"    \ 'allowlist': ['reason'],
"    \ })
"endif
"
"nmap <silent> tt <plug>(lsp-hover)
"nmap <silent> gd <plug>(lsp-definition)
"nmap <silent> ff :LspDocumentFormat<CR>
"
"augroup lspcmds
"  " remove all previous commands from this group
"  autocmd!
"
"  " format reason files on write
"  autocmd BufWritePre *.re,*.rei :LspDocumentFormatSync
"augroup END
"
"let g:lsp_diagnostics_echo_cursor = 1

" language server protocol clients
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['yarn', 'flow', 'lsp', '--from', 'vim'],
  \ 'php': ['hh', 'lsp', '--from', 'vim'],
  \ 'ocaml': ['ocamllsp'],
  \ 'reason': ['ocamllsp'],
  \ 'rust': ['rls'],
  \ }
"\ 'ocaml': ['ocaml-language-server', '--stdio'],
"\ 'reason': ['ocaml-language-server', '--stdio'],

nmap <silent> tt <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> ff <Plug>(lcn-format)
nmap <silent> ca <Plug>(lcn-code-action)

augroup language_specific_stuff
  " remove all previous commands from this group
  autocmd!
  " format reason files on write
  autocmd BufWritePre *.re,*.rei :call LanguageClient#textDocument_formatting_sync()
  " es6 imports
  autocmd FileType javascript let @i = "vey:0\<cr>/import [^t]\<cr>koimport jkpA from 'jkpA';jkbb*"
  " the flow language server doesn't format, so call prettier from ff instead
  autocmd FileType javascript nunmap ff
  autocmd FileType javascript nmap <silent> ff :Prettier<CR>
augroup END

" show row numbers
set number

" go from insert->normal mode using "jk"
inoremap jk <esc>

" switch between buffers without saving
set hidden

" set tabs to 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab

" mouse clicks and scrolling
set mouse=a

" make vertical splits open on the right
set splitright

" don't make swapfiles
set swapfile!

augroup vimrc
  " remove all previous commands from this group
  autocmd!
  " execute vimrc after writing it
  autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

set statusline=%f%=\ \ \ %{&fo}\ \ %c,%l\ /\ %L
set laststatus=2 " always show statusline

" Prevent screen from flashing while ssh
" https://stackoverflow.com/questions/9935345/vim-flashing-issue/9935748
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

" keep gutter open
:set signcolumn=yes
