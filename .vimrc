"==========================================
" Author:  zhaohongxuan
" Version: 0.1
" Email: hxzhenu@gmai.com
" Desc: my vim config file 
"==========================================

"leader
let mapleader = " "

"Plugins  
call plug#begin()
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'mhinz/vim-startify'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-airline'
Plug 'theniceboy/vim-snippets'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/space-vim-dark'


call plug#end()

" theme 
syntax on
set t_Co=256
"set cursorline
set background=dark

"colorscheme one
"let g:airline_theme = 'one'
" True Color Theme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

color space-vim-dark
let g:airline_theme = 'one'
let g:space_vim_dark_background = 233


" history : how many lines of history VIM has to remember
set history=2000

set guioptions-=L

" filetype
filetype on
" Enable filetype plugins
filetype plugin on
filetype indent on


" base
set nocompatible                " don't bother with vi compatibility
set magic                       " For regular expressions turn magic on
set title                       " change the terminal's title
set nobackup                    " do not keep a backup file

set novisualbell                " turn off visual bell
set noerrorbells                " don't beep
set visualbell t_vb=            " turn off error beep/flash



" movement
set scrolloff=7                 " keep 3 lines when scrolling

" show
set number                      " show line numbers
set nowrap
set showcmd                     " display incomplete commands
set showmode                    " display current modes
set showmatch                   " jump to matches when entering parentheses
set matchtime=2                 " tenths of a second to show the matching parenthesis


" search
set hlsearch                    " highlight searches
set incsearch                   " do incremental searching, search as you type
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present

" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m
set formatoptions+=B


" select & complete
set selection=inclusive
set selectmode=mouse,key
set completeopt=longest,menu
set wildmenu                           " show a navigable menu for tab completion"
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.class


"Gui setting

set guifont=Menlo\ Regular:h12


" Key Mapping 
noremap ; :


nnoremap L $
nnoremap H ^
vnoremap L $
vnoremap H ^
nnoremap ; :


" Copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
vnoremap Y "+y


nnoremap gev :w $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

map <LEADER>j <C-W>j
map <LEADER>k <C-W>k
map <LEADER>h <C-W>h
map <LEADER>l <C-W>l

nnoremap <F2> :set nu! nu?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
" kj 替换 Esc
inoremap kj <Esc>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

"Reselect visual block after indent/outdent.调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >g

" save
cmap w!! w !sudo tee >/dev/null %


" command mode, ctrl-a to head， ctrl-e to tail
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>
" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

noremap <LEADER><up> :res +5<CR>
noremap <LEADER><<down> :res -5<CR>
noremap <LEADER><<left> :vertical resize-5<CR>
noremap <LEADER><<right> :vertical resize+5<CR>


" ===
" === Tab management
" ===
" Create a new tab with tt
noremap tt :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" set wrap
noremap <LEADER>sw :set wrap<CR>
" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
" Vim filer

" Nerd tree
map <LEADER>w :NERDTreeToggle<CR>

"=================autocmd
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
	    \ | endif
