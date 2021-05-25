""" General
" Filetype plugins
filetype plugin indent on

" Show line numbers
set number
" relatively
set relativenumber

" Mouse support
set mouse=a

" Hidden buffers
set hidden

" Path
set path=.,,

""" VIM user interface
" Set 10 lines to the cursor - when moving vertically using j/k
set so=10

" Turn on the Wild menu
set wildmenu

" Always show current position
set ruler

" No highlight search results
set nohlsearch

" Make search act like search in modern browsers
set incsearch

" Don't redraw when executing macros (performance)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""" Colors and Fonts
" Enable syntax highlighting
syntax enable

" Embedded script syntax highlighting for lua
let g:vimsyn_embed = 'l'

""" Text, tab and indent related
" Better '%' behavior
runtime macros/matchit.vim

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Tab = 4 spaces
set shiftwidth=4
set tabstop=4

set autoindent                  " Auto indent
set smartindent                 " Smart indent
set wrap                        " Wrap lines
set backspace=indent,eol,start  " Proper backspace behavior

" Folding
set foldmethod=syntax
set foldnestmax=10
set foldlevel=10
set nofoldenable

" Searching
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

""" Status line
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

""" Helper functions
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""" Custom mappings
" Edit and source config file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" Move 10 lines
nnoremap gj 10j
nnoremap gk 10k
vnoremap gj 10j
vnoremap gk 10k
" Go to buffer
nnoremap gb :ls<CR>:buffer<space>
" Quickfix list and location list shortcuts
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>

""" Custom commands

"" Find
command! -complete=customlist,CandidateFiles -nargs=1 Find find <args>
function CandidateFiles(A,L,P)
    if stridx(a:A, '*') == -1
        let l:search_term = a:A . '*'
    else
        let l:search_term = a:A
    endif
    return split(system(['find', '-type', 'f',
                \'-name', l:search_term, '-or', '-path', l:search_term]))
endfunction

"" Format
command! Format normal! ggqG<C-O><C-O>

""" Language specific

"" Rust
augroup rust
    autocmd!
    autocmd FileType rust setlocal formatprg=rustfmt\ --edition=2018
augroup END

"" Python
augroup python
    autocmd!
    autocmd FileType python setlocal formatprg=yapf
augroup END
