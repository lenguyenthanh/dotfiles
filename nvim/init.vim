set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=./nvim runtimepath+=~/.dotfiles/nvim
let &packpath = &runtimepath

lua require("init")

noremap yom :NERDTreeToggle<CR>
noremap <leader>tf :NERDTreeFind<CR>
" Nerdtree config for wildignore
let NERDTreeRespectWildIgnore=1

" Ripgrep for Ack
let g:ackprg = 'rg --vimgrep --no-heading'
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>A viw"ry:Ack <C-r>r<CR>
nnoremap <Leader>H viw"ry:help <C-r>r<CR>

" support codex
set tags=tags;/,codex.tags;/

" Increase, decrease width of a window by 30 pixels
map <M-l> 30<C-w>>
map <M-h> 30<C-w><

nnoremap ; :
nnoremap : ;
tnoremap ; :
tnoremap : ;
vnoremap ; :
vnoremap : ;

" Re-map move around for wrapping line
nnoremap j gj
nnoremap k gk

" Easy exit from terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
tnoremap jk <C-\><C-n>

" Highlight terminal cursor
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=green guifg=white ctermbg=1 ctermfg=15

" Quick open a terminal window
command! -nargs=* HT split | terminal <args>
command! -nargs=* T vsplit | terminal <args>

" Wrap git commit message
au FileType gitcommit set tw=72

" jk instead of Esc
inoremap jk <Esc>

" Setting for quick copy & paste
nnoremap "y "+y
nnoremap "yy "+yy
nnoremap "p "+p
nnoremap "P "+p

" Line text object
xnoremap il $o^
onoremap il :normal vil<CR>

nnoremap<leader>js :%!jq '.'<cr>

" Hide preview window
set completeopt-=preview
set completeopt=menuone,noinsert,noselect

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Global status line
" set laststatus=3
highlight WinSeparator guibg=None

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Turn off syntax highlight for markdown files
" Turn on spell checking
augroup textfiles
  autocmd!
  autocmd filetype markdown :setlocal spell spelllang=en " | syntax clear
augroup end

" Ensure changes to buffers are saved when you navigate away from that buffer
autocmd FileType markdown set autowriteall
