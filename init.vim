set clipboard+=unnamedplus
set shiftwidth=4 softtabstop=4 expandtab
set number
set history=200

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR> 
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B:blast<CR>

" --- coc.nvim ---
" タブで次の補完候補を選択する
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enterで補完を完了する
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" 定義箇所に移動する 
nmap <silent> gd <Plug>(coc-definition)
" 利用箇所をリストで表示する
nmap <silent> gr <Plug>(coc-references)

" ドキュメントを参照する
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
