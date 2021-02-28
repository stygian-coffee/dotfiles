" Load vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

""" Plug config

" Specify vim-plug plugin directory
call plug#begin(stdpath('data').'/plugged')

" Plugin airline
Plug 'vim-airline/vim-airline'

" Plugin CoC
Plug 'neoclide/coc.nvim'

" Plugin commentary
Plug 'tpope/vim-commentary'

" Plugin dispatch
Plug 'tpope/vim-dispatch'

" Plugin editorconfig
Plug 'editorconfig/editorconfig-vim'

" Plugin fugitive
Plug 'tpope/vim-fugitive'

" Plugin fzf
Plug 'junegunn/fzf'

" Plugin nerdtree
Plug 'preservim/nerdtree'

" Plugin polyglot
Plug 'sheerun/vim-polyglot'

" Plugin surround
Plug 'tpope/vim-surround'

" Plugin treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Init plugins
call plug#end()

""" CoC config

" Load coc.nvim config
source ~/.config/nvim/coc.vim

" CoC colors
highlight Pmenu ctermbg=16
highlight Pmenu ctermfg=5

""" fzf config
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -f -g ""'

""" NERDTree config

" Open NERDTree on start
"autocmd vimenter * NERDTree
" Jump to the main window
"autocmd VimEnter * wincmd p
" C-n for :NERDTreeToggle
nmap <C-n> :NERDTreeToggle<CR>
" C-w C-n to jump to NERDTree
nmap <C-w><C-n> 1<C-w><C-w>

" Auto close nvim if NERDTree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" Treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  },
}
EOF

" Treesitter-based folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
