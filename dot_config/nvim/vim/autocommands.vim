autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   wincmd w
