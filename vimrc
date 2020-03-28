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
  noremap yom :NERDTreeToggle<CR>
  noremap <leader>m :NERDTreeFind<CR>
  " Nerdtree config for wildignore
  let NERDTreeRespectWildIgnore=1

" Beautiful parent thesis
Plug 'luochen1990/rainbow'
  noremap <leader>R :RainbowToggle<CR>
  nnoremap yoR :RainbowToggle<CR>
  let g:rainbow_active = 0

" Writing focus mode
Plug 'junegunn/goyo.vim'
Plug 'vigoux/LanguageTool.nvim'
  let g:languagetool_server_jar='/Users/thanhle/.local/bin/language-tool/languagetool-server.jar'

" Auto complete from dictionary, using look
Plug 'ujihisa/neco-look', { 'for': 'markdown' }

" Git
Plug 'tpope/vim-fugitive'
  nnoremap <leader>gd :Gvdiffsplit!<CR>
  nnoremap gdh :diffget //2<CR>
  nnoremap gdl :diffget //3<CR>

Plug 'rbong/vim-flog'
Plug 'rhysd/git-messenger.vim'

" Ack
Plug 'mileszs/ack.vim'
  " Don't jump to the first result automatically
  cnoreabbrev Ack Ack!

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
Plug 'joshdick/onedark.vim'

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
  nnoremap <silent> <Leader>y :Files <C-r>=expand("%:h")<CR>/<CR>
  nnoremap <silent> <Leader>p :Files<CR>
  nnoremap <silent> <Leader>e :Buffers<CR>
  nnoremap <silent> <Leader>c  :Commits<CR>
  nnoremap <silent> <Leader>bc :BCommits<CR>
  " Git commit
  let g:fzf_commits_log_options = '--graph --color=always
    \ --format="%C(yellow)%h%C(red)%d%C(reset)
    \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

" Vim alignment plugin
Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

" Vim syntastic
Plug 'vim-syntastic/syntastic'

" unimpaired
Plug 'tpope/vim-unimpaired'

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
  let g:LanguageClient_diagnosticsList = 'Location'
  let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rust-analyzer'],
    \ 'haskell': ['ghcide', '--lsp'],
    \ }

    "\ 'kotlin': ["~/source/kotlin/kotlin-language-server/server/build/install/server/bin/kotlin-language-server"],
    "\ 'haskell': ['hie-wrapper'],

  "let g:LanguageClient_hoverPreview = 'Always'

  function SetLSPShortcuts()
    nnoremap <F5> :call LanguageClient_contextMenu()<CR>
    nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
    nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
    nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
    nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
    nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
    nnoremap <leader>la :call LanguageClient#textDocument_codeAction()<CR>
    nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
    nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
    nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
    nnoremap <leader>le :call LanguageClient#explainErrorAtPoint()<CR>
    let g:LanguageClient_autoStart = 1
  endfunction()

  augroup LSP
    autocmd!
    autocmd FileType haskell,rust call SetLSPShortcuts()
  augroup END

  " Always draw the signcolumn.
  set signcolumn=yes

  autocmd BufReadPost *.kt setlocal filetype=kotlin
  autocmd BufReadPost *.rs setlocal filetype=rust
  au BufRead,BufNewFile Vagrantfile set ft=ruby
  au BufRead,BufNewFile *.sbt set ft=scala
  au BufRead,BufNewFile *.kts set ft=kotlin

" handle the function signatures displaying
Plug 'Shougo/echodoc.vim'

  set cmdheight=2
  let g:echodoc#enable_at_startup = 0
  let g:echodoc#type = 'signature'

" LANGUAGE
" Json
Plug 'elzr/vim-json', { 'for' : 'json' }

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

  function! Haskell_snippets_module_name() " {{{
    let l:path = substitute(expand('%:r'), '\%(\U[^/]*/\)*', '', '')
    return substitute(l:path, '/', '.', 'g')
  endfunction " }}}

  nnoremap <leader>hs ms:%!stylish-haskell<cr>'s

  " Search by hoogle
  nnoremap <leader>h :!hoogle<Space>

  " Search the word under the cursor using hoogle
  nnoremap <Leader>H viw"ry:!hoogle <C-r>r<CR>

" Swift
Plug 'keith/swift.vim', { 'for' : 'swift' }

" Scala
Plug 'derekwyatt/vim-scala'

" Rust
Plug 'rust-lang/rust.vim', { 'for' : 'rust'}

" fades inactive buffers
Plug 'TaDaa/vimade'
  nnoremap yot :VimadeToggle<CR>

call plug#end()

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
set dictionary+=/usr/share/dict/words

set termguicolors

color onedark
set background=dark

set nofoldenable

" Set search case insensitive
set ic
set smartcase

" Set natural split opening
set splitbelow
set splitright

" Increase, decrease width of a window by 30 pixels
map <M-l> 30<C-w>>
map <M-h> 30<C-w><

" Gdiff vertically
set diffopt+=vertical

set clipboard=unnamed

" Ignore build, gen, lib directory in Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.o,*.obj,.git,*/vendor/*,*/target/*,*/build/*,*/node_modules/*,*.a,*/lib/*,env,*/env/*

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

nnoremap ; :
nnoremap : ;
tnoremap ; :
tnoremap : ;

" Re-map move around for wrapping line
nnoremap j gj
nnoremap k gk

" Easy exit from terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
tnoremap jk <C-\><C-n>

" Highlight terminal cursor
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=green guifg=white ctermbg=1 ctermfg=15
endif

" Quick open a terminal window
nnoremap <Leader>t :vsp term://zsh<CR>
command! -nargs=* HT split | terminal <args>
command! -nargs=* T vsplit | terminal <args>

" Wrap git commit message
au FileType gitcommit set tw=72

" jk instead of Esc
inoremap jk <Esc>

" Line text object
xnoremap il $o^
onoremap il :normal vil<CR>

" Hide preview window
set completeopt-=preview

" Turn off syntax highlight for markdown files
" Turn on spell checking
augroup textfiles
  autocmd!
  autocmd filetype markdown :setlocal spell spelllang=en | syntax clear
augroup end

" Learn vim the hard way
noremap h <NOP>
noremap j <NOP>
noremap k <NOP>
noremap l <NOP>
nnoremap <C-p> <NOP>
nnoremap <C-n> <NOP>
