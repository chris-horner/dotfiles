"" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kylef/apiblueprint.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'udalov/kotlin-vim'
Plug 'tpope/vim-fugitive'

call plug#end()

"" Syntax highlighting
filetype plugin indent on
syntax on
filetype on

"" Two space tabs
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=2
set autoindent
set smarttab

"" Make search not suck
set nohlsearch
set ignorecase
set smartcase

"" Make line numbers more useful/colourful
set number
set relativenumber
highlight LineNr cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

"" GUI
if has("gui_running")
  if has('win32') || has('win64')
    set guifont=Consolas:h11
  else
    set guifont=Roboto\ Mono:h12
    set linespace=1
  endif
  colorscheme monokai-gui
  "" Stop annoying sounds when pressing escape too many times.
  autocmd GUIEnter * set vb t_vb=
else
  colorscheme monokai-term
endif
set guioptions-=L
set guioptions-=r
set guioptions-=T

"" F2 opens NERDTree
map <F2> :NERDTreeToggle<CR>

"" If only NERDTree is open and vim receives a close command, it should exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" Set the working directory to be that of the current file.
autocmd BufEnter * lcd %:p:h

"" vim-airline
set laststatus=2
set noshowmode
set statusline+=%{fugitive#statusline()}
let g:airline_theme = 'bubblegum'

"" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" apiblueprint only wants to work with 4 spaces :(
autocmd Filetype apiblueprint setlocal ts=4 sts=4 sw=4

"" Custom directories for backup and swap
set backupdir=$HOME/.vimswap//
set directory=$HOME/.vimswap//

"" Quickly swap between buffers with ctrl h/l
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprevious<CR>

"" ctrl-e to swap back and forth between previous buffers
nnoremap <C-e> <C-^>

"" Save a buffer before hiding it.
set autowrite

"" Make gitgutter update faster.
set updatetime=250
