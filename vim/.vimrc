call plug#begin()
Plug 'https://kgithub.com/preservim/nerdtree'
Plug 'https://kgithub.com/vim-airline/vim-airline'
Plug 'https://kgithub.com/vim-airline/vim-airline-themes'
Plug 'https://kgithub.com/easymotion/vim-easymotion'
Plug 'https://kgithub.com/morhetz/gruvbox'
Plug 'https://kgithub.com/preservim/nerdcommenter'
Plug 'https://kgithub.com/t9md/vim-choosewin'
Plug 'https://kgithub.com/happen-w/nerdtree_choosewin-plugin'
Plug 'https://kgithub.com/thinca/vim-quickrun'
Plug 'https://kgithub.com/iamcco/markdown-preview.nvim'
Plug 'https://kgithub.com/dhruvasagar/vim-table-mode'
Plug 'https://kgithub.com/mzlogin/vim-markdown-toc'
Plug 'https://kgithub.com/bagrat/vim-buffet'
call plug#end()

let mapleader=" "


" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

set encoding=utf-8
filetype plugin on
set incsearch
set hlsearch
" set number
syntax on

map + <C-W>+
map - <C-W>-
map <C-l> <C-W>l
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <leader>q :q<CR>

" terminal 模式
map <C-t> :rightb vert term<CR>
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l
tnoremap <C-k> <C-w>k
tnoremap <C-j> <C-w>j

let g:EasyMotion_smartcase = 1
nmap ss <Plug>(easymotion-s2)

nnoremap <leader>n :NERDTree<CR>
let NERDTreeShowBookmarks = 1
let g:NERDSpaceDelims = 1

let g:quickrun_config = {
      \'*': {
      \'outputter/buffer/opener': 'new'},}


"colorscheme darkblue
colorscheme gruvbox
" INSERT mode
let &t_SI = "\<Esc>[6 q"
" REPLACE mode
let &t_SR = "\<Esc>[3 q"
" NORMAL mode
let &t_EI = "\<Esc>[2 q"

" buffer跳转
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
