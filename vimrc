" automatically reload vim config(s)
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Change the leader key
let mapleader=","

" All plugins go here
call plug#begin('~/.local/share/nvim/plugged')

" Track the engine.
Plug 'SirVer/ultisnips'
  " Trigger configuration.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/UltiSnips']

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Commenter
Plug 'scrooloose/nerdcommenter'

" Better file browser
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
  noremap <leader>n :NERDTreeToggle<CR>
  noremap <leader>m :NERDTreeFind<CR>
  " Nerdtree config for wildignore
  let NERDTreeRespectWildIgnore=1

" Beautiful parent thesis
Plug 'luochen1990/rainbow'
  noremap <leader>R :RainbowToggle<CR>
  let g:rainbow_active = 0

" Writing focus mode
Plug 'junegunn/goyo.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'

" Ack
Plug 'mileszs/ack.vim'
  " Don't jump to the first result automatically
  cnoreabbrev Ack Ack!
  " The silver search for Ack
  let g:ackprg = 'ag --nogroup --nocolor --column'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  nnoremap <Leader>a :Ack!<Space>

" Destroy trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Color Scheme
Plug 'joshdick/onedark.vim'
Plug 'vim-scripts/wombat256.vim'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Auto Pair
Plug 'jiangmiao/auto-pairs'

" Dash
Plug 'rizzatti/dash.vim'
  nnoremap <Leader>d :Dash<Space>

" Fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
  nnoremap <C-y> :Files <C-r>=expand("%:h")<CR>/<CR>
  nnoremap <C-p> :Files<CR>
  nnoremap <C-u> :Buffers<CR>
  " Git commit
  let g:fzf_commits_log_options = '--graph --color=always
    \ --format="%C(yellow)%h%C(red)%d%C(reset)
    \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

  nnoremap <silent> <leader>c  :Commits<CR>
  nnoremap <silent> <leader>bc :BCommits<CR>

" Vim alignment plugin
Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

" Vim syntastic
Plug 'vim-syntastic/syntastic'

" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
  let g:deoplete#enable_at_startup = 1

" LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }

  let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
  map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
  map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
  map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
  map <Leader>lb :call LanguageClient#textDocument_references()<CR>
  map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
  map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" LANGUAGE
" Json
Plug 'elzr/vim-json', { 'for' : 'json' }

" Markdown
Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }
  " disable ge mappings
  map <Plug> <Plug>Markdown_EditUrlUnderCursor

" Toml Syntax
Plug 'cespare/vim-toml', { 'for' : 'toml' }

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

" Swift
Plug 'keith/swift.vim', { 'for' : 'swift' }

call plug#end()

filetype plugin indent on     " required!
filetype on
syntax enable

nnoremap ; :
nnoremap : ;

" Re-map move around for wrapping line
nnoremap j gj
nnoremap k gk

" Setting for quick copy & paste
vmap <Leader>y "y
vmap <Leader>d "+d
nmap <Leader>yy "+yy
nmap <Leader>p "+p


" Easy exit from terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Quick open a terminal window
nnoremap <Leader>t :vsp term://zsh<CR>
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

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
set dictionary+=/usr/share/dict/words

" Add after Cocvim
set cmdheight=2 " Better display for messages
set updatetime=30 " You will have bad experience for diagnostic messages when it's default 4000.0
set shortmess+=c
set signcolumn=yes " always show signcolumns

" Enable folding
set foldmethod=indent
set foldlevel=99

set termguicolors

color onedark
set background=dark


highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Set search case insensitive
set ic
set smartcase

" Set natural split opening
set splitbelow
set splitright

" Wrap git commit message
au FileType gitcommit set tw=72

" Gdiff vertically
set diffopt+=vertical

" toggle spelling
nnoremap <Leader>s :set invspell<CR>

set clipboard=unnamed

" Ignore build, gen, lib directory in Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.o,*.obj,.git,*/vendor/*,*/target/*,*/build/*,*/node_modules/*,*.a,*/lib/*,env,*/env/*

" jk instead of Esc
inoremap jk <esc>

" Line text object
xnoremap il $o^
onoremap il :normal vil<CR>

" Other files to consider as Ruby
au BufRead,BufNewFile Vagrantfile set ft=ruby
