" Load vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

""" Plugin config

" Specify vim-plug plugin directory
call plug#begin(stdpath('data').'/plugged')

" Plugins
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'tomasr/molokai'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Init plugins
call plug#end()

"" CoC config
source ~/.config/nvim/coc.vim

"" molokai config
colorscheme molokai

"" fzf config
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -f -g ""'

"" NERDTree config

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

"" Treesitter config

" Treesitter-based folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

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

