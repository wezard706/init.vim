set clipboard+=unnamedplus
set shiftwidth=4 softtabstop=4 expandtab
set number
set history=200
set noswapfile

let mapleader = "\<Space>"
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent> <C-j> :bprevious<CR>
nnoremap <silent> <C-k> :bnext<CR> 

" --- NERDTree ---
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" --- NERDTree ---

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
" --- coc.nvim ---

" --- terminal ---
autocmd TermOpen * startinsert
" --- terminal ---

" --- fzf.vim ---
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>
" --- fzf.vim ---

call plug#begin()
Plug 'tpope/vim-endwise'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'thinca/vim-ref'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
