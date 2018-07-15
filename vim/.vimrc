"" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'kylef/apiblueprint.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'udalov/kotlin-vim'
Plug 'tpope/vim-fugitive'
Plug 'ajh17/vimcompletesme'
Plug 'rhysd/vim-clang-format'
Plug 'dart-lang/dart-vim-plugin'
Plug 'cohama/lexima.vim'

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
"set autoindent
"set smarttab

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
    set guifont=Hack:h11
    set linespace=0
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

"" Set the working directory to be that of the current file.
autocmd BufEnter * lcd %:p:h

"" Status line
set laststatus=2
set noshowmode
let g:lightline = {
  \  'colorscheme': 'wombat',
  \  'active': {
  \    'left': [ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \  },
  \  'component_function': {
  \    'gitbranch': 'fugitive#head'
  \  }
  \}

"" Make ctrlp ignore files listed in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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

"" ctrl-k to invoke clang-format
nnoremap <C-k> :ClangFormat<CR>

"" Save a buffer before hiding it.
set autowrite

"" Make gitgutter update faster.
set updatetime=250

"" Highlight current line
set cursorline

"" Error message formats.
"" Microsoft MSBuild
set errorformat+=\\\ %#%f(%l\\\,%c):\ %m
"" Microsoft compiler: cl.exe
set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
"" Microsoft HLSL compiler: fxc.exe
set errorformat+=\\\ %#%f(%l\\\,%c-%*[0-9]):\ %#%t%[A-z]%#\ %m

"" ctrl-Enter to execute build.bat on windows.
function! ExecBuildScript(filename)
  let buildFile = a:filename
  let buildPath = expand("%:p:h") . "/"
  let depth = 0
  while depth < 10
    if filereadable(buildPath . buildFile)
      let &makeprg = "\"" . buildPath . buildFile . "\""
      make
      cwindow
      echo "Executed " . buildFile
      return 0
    endif
    let depth += 1
    let buildPath = buildPath . "../"
  endwhile
  echo "Missing " . buildFile
endfunction
if has('win32') || has('win64')
  nnoremap <silent> <C-Return> :call ExecBuildScript('build.bat')<CR>
endif

"" Automatically quit the last window if it's a quickfix
"" window.
"" http://bit.ly/1Fn9JHG
function! CloseQuickfix()
  if &buftype=="quickfix"
    if winnr('$') < 2
      quit!
    endif
  endif
endfunction
au BufEnter * call CloseQuickfix()

"" Dart stuff.
let dart_style_guide = 2
let dart_format_on_save = 1

"" NERDTree
"" Close vim if only window left open is NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" Hide the help message.
let NERDTreeMinimalUI = 1
"" Ctrl+n to open/close NERDTree.
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

