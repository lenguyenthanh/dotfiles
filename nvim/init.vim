set runtimepath+=./nvim runtimepath+=~/.dotfiles/nvim
let &packpath = &runtimepath

lua require("init")

" Highlight terminal cursor
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=green guifg=white ctermbg=1 ctermfg=15

" Quick open a terminal window
command! -nargs=* HT split | terminal <args>
command! -nargs=* T vsplit | terminal <args>

" Global status line
highlight WinSeparator guibg=None

" Set updatetime for CursorHold
" 1 second of no cursor movement to trigger CursorHold
set updatetime=1000

" Show diagnostic popup on cursor hover we have virtual_lines
" autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Turn on spell checking
augroup textfiles
  autocmd!
  autocmd filetype markdown :setlocal spell spelllang=en
augroup end

" Ensure changes to buffers are saved when you navigate away from that buffer
autocmd FileType markdown set autowriteall

" Agda
au BufNewFile,BufRead *.agda setf agda

" More text objects
for char in [ '_', '.', ':', ',', ';', '/', '<bslash>', '*', '+', '%', '-', '#' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

" No hjkl
noremap h <Nop>
noremap j <Nop>
noremap k <Nop>
noremap l <Nop>
