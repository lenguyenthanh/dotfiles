set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=./nvim runtimepath+=~/.dotfiles/nvim
let &packpath = &runtimepath

lua require('basic')

" All plugins go here
call plug#begin('~/.local/share/nvim/plugged')

" Track the engine.
Plug 'SirVer/ultisnips'
  " Trigger configuration.
  "let g:UltiSnipsExpandTrigger="<tab>"
  "let g:UltiSnipsJumpForwardTrigger="<c-b>"
  "let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/UltiSnips']

" Better file browser
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
  noremap yom :NERDTreeToggle<CR>
  noremap <leader>tf :NERDTreeFind<CR>
  " Nerdtree config for wildignore
  let NERDTreeRespectWildIgnore=1

Plug 'mileszs/ack.vim'
  " Ripgrep for Ack
  let g:ackprg = 'rg --vimgrep --no-heading'

  nnoremap <Leader>a :Ack!<Space>

  " Search the word under the cursor using rg
  nnoremap <Leader>A viw"ry:Ack <C-r>r<CR>

" Destroy trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Auto save sessions
Plug 'tpope/vim-obsession'

" Color Scheme
"Plug 'joshdick/onedark.vim'
"Plug 'ayu-theme/ayu-vim'
Plug 'rebelot/kanagawa.nvim'

" Vim alignment plugin
Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

" Vim syntastic
" Plug 'vim-syntastic/syntastic'

" unimpaired
Plug 'tpope/vim-unimpaired'

" handle the function signatures displaying
Plug 'Shougo/echodoc.vim'

  set cmdheight=2
  let g:echodoc#enable_at_startup = 0
  let g:echodoc#type = 'signature'

" Kotlin
Plug 'udalov/kotlin-vim', { 'for' : 'kotlin'}

" Haskel
Plug 'neovimhaskell/haskell-vim', { 'for' : 'haskell' }

  function! ApplyOneSuggestion()
    let l = line(".")
    let c = col(".")
    let l:filter = "%! hlint - --refactor  --refactor-options=\"--pos ".l.','.c."\""
    execute l:filter
    silent if v:shell_error == 1| undo | endif
    call cursor(l, c)
  endfunction

  function! ApplyAllSuggestions()
    let l = line(".")
    let c = col(".")
    let l:filter = "%! hlint - --refactor"
    execute l:filter
    silent if v:shell_error == 1| undo | endif"
    call cursor(l, c)
  endfunction

  " hlint
  if ( ! exists('g:hlintRefactor#disableDefaultKeybindings') ||
    \ ! g:hlintRefactor#disableDefaultKeybindings )

    map <silent> to :call ApplyOneSuggestion()<CR>
    map <silent> ta :call ApplyAllSuggestions()<CR>

  endif

  function! Haskell_snippets_module_name() " {{{
    let l:path = substitute(expand('%:r'), '\%(\U[^/]*/\)*', '', '')
    return substitute(l:path, '/', '.', 'g')
  endfunction " }}}

  " Search by hoogle
  nnoremap <leader>h :!hoogle<Space>

  " Search the word under the cursor using hoogle
  nnoremap <Leader>H viw"ry:!hoogle <C-r>r<CR>

" Haskell Format
Plug 'sdiehl/vim-ormolu'

" Dhall
Plug 'vmchale/dhall-vim'

" Swift
Plug 'keith/swift.vim', { 'for' : 'swift' }


call plug#end()

lua require('init')


filetype plugin indent on     " required!
filetype on
syntax enable

" support codex
set tags=tags;/,codex.tags;/

set pastetoggle=<F2> " Binding paste mode
set expandtab        " tab by spaces
set autoindent       " always set auto indenting on
set cindent          " copy the previous indentation on auto indenting
set smartindent      " smart indent
set rnu              " show relative line numbers
set nu               " show line numbers
set shiftround       " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch        " set show matching parenthesis
set smarttab         " insert tabs on the start of a line according to shiftwidth, not tabstop
set incsearch        " show search matches as you type
set nobackup         " no backup
set noswapfile       " no swap files
set hidden           " Avoid No write since last change message when open new files
set ts=2             " set tabs to have 2 spaces
set shiftwidth=2     " when using the >> or << commands, shift lines by 4 spaces
set cursorline       " show a visual line under the cursor's current line
set nofixendofline   " Allow no end of line
set history=200      " History in command line mode

set inccommand=split " Live Substitution


set termguicolors
"let ayucolor="mirage"
"colorscheme ayu
"color onedark
set background=dark

colorscheme kanagawa

set nofoldenable

" Set search case insensitive
set ic
set smartcase

" Set natural split opening
set splitbelow
set splitright

" Auto hightlight
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Increase, decrease width of a window by 30 pixels
map <M-l> 30<C-w>>
map <M-h> 30<C-w><

" Gdiff vertically
set diffopt+=vertical

" Ignore build, gen, lib directory in Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.o,*.obj,.git,*/vendor/*,*/target/*,*/build/*,*/node_modules/*,*.a,*/lib/*,env,*/env/*

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

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
set laststatus=3
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
