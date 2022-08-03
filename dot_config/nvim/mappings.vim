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

nnoremap <LEADER>ve :e $MYVIMRC<CR>
nnoremap <LEADER>vw :w!<CR>
nnoremap <LEADER>vs :so $MYVIMRC<CR>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

map <LEADER>j <C-W>j
map <LEADER>k <C-W>k
map <LEADER>h <C-W>h
map <LEADER>l <C-W>l


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

