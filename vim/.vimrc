"" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'kylef/apiblueprint.vim'

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
  set guifont=Roboto\ Mono:h12
  colorscheme monokai-gui
else
  colorscheme monokai-term
endif
set guioptions-=L
set guioptions-=r

"" F2 opens NERDTree
map <F2> :NERDTreeToggle<CR>

"" If only NERDTree is open and vim receives a close command, it should exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" vim-airline should appear no matter how many files are open.
set laststatus=2

"" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

