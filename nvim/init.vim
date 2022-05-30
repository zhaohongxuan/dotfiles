"==========================================
" Author:  zhaohongxuan
" Version: 0.1
" Email: hxzhenu@gmai.com
" Desc: my nvim config file 
"==========================================
"leader
let mapleader = " "

"Plugins  
call plug#begin()
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'udalov/kotlin-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'xadillax/json-formatter.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

call plug#end()
" always splitright
set splitright
" theme 
syntax on
set t_Co=256
"set cursorline
set background=dark

"colorscheme one

let g:airline_theme = 'violet'
" True Color Theme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

color space-vim-dark
let g:space_vim_dark_background = 234


let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
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

" set guifont=Menlo\ Regular:h12


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

inoremap jk <esc>

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

noremap <LEADER>s :Startify<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <F2> :set nu! nu?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>


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

nnoremap <LEADER>bj :call JsonFormatter()<cr>


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

"=================Coc-vim============
set updatetime=200
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
inoremap <silent><expr> <c-space> coc#refresh()


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" coc explorer
nmap <space>e :CocCommand explorer<CR>


autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   wincmd w
