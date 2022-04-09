" automatically reload vim config(s)
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC |endif
  augroup END

lua require('plugins')
lua require('basic')

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
  nnoremap yor :RainbowToggle<CR>
  let g:rainbow_active = 0

" Writing focus mode
Plug 'junegunn/goyo.vim'
Plug 'vigoux/LanguageTool.nvim'
  let g:languagetool_server_jar='/Users/thanhle/.local/bin/language-tool/languagetool-server.jar'

" Auto complete from dictionary, using look
Plug 'ujihisa/neco-look', { 'for': 'markdown' }

" nvim-cmp autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

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

" Vim prettier

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'vue', 'yaml', 'html'] }

" Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Auto save sessions
Plug 'tpope/vim-obsession'

" Color Scheme
"Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Auto Pair
Plug 'jiangmiao/auto-pairs'

" Fzf
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
"Plug 'junegunn/fzf.vim'
  "nnoremap <silent> <Leader>fy :Files <C-r>=expand("%:h")<CR>/<CR>
  "nnoremap <silent> <Leader>fp :Files<CR>
  "nnoremap <silent> <Leader>fe :Buffers<CR>
  "nnoremap <silent> <Leader>fg  :Commits<CR>
  "nnoremap <silent> <Leader>fbc :BCommits<CR>
  "nnoremap <silent> <Leader>fm :Maps<CR>
  "nnoremap <silent> <Leader>fs :Snippets<CR>
  "nnoremap <silent> <Leader>fc :Commands<CR>
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  " telescope
  nnoremap <leader>fp <cmd>Telescope find_files<cr>
  nnoremap <leader>fe <cmd>Telescope buffers<cr>
  nnoremap <leader>fr <cmd>Telescope live_grep<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fc <cmd>Telescope commands<cr>
  nnoremap <leader>fq <cmd>Telescope quickfix<cr>
  nnoremap <leader>fm <cmd>Telescope keymaps<cr>
  nnoremap <leader>fsp <cmd>Telescope spell_suggest<cr>
  nnoremap <leader>fg <cmd>Telescope git_commits<cr>
  nnoremap <leader>fbc <cmd>Telescope git_bcommits<cr>

Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'softinio/scaladex.nvim'

lua << EOF
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}


EOF

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

" handle the function signatures displaying
Plug 'Shougo/echodoc.vim'

  set cmdheight=2
  let g:echodoc#enable_at_startup = 0
  let g:echodoc#type = 'signature'

" treesister
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LANGUAGE
" Json
"Plug 'elzr/vim-json', { 'for' : 'json' }

" Toml Syntax
"Plug 'cespare/vim-toml', { 'for' : 'toml' }

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

" Scala
Plug 'derekwyatt/vim-scala'

" Rust
Plug 'rust-lang/rust.vim', { 'for' : 'rust' }

  " Rust ctags
  autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi

" Javascript/Typescript
"Plug 'sheerun/vim-polyglot'

" GraphQL
Plug 'jparise/vim-graphql'

" fades inactive buffers
Plug 'TaDaa/vimade'
  nnoremap yot :VimadeToggle<CR>

call plug#end()

lua require('settings.cmp').setup()
lua require('lsp')


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
if has('nvim')
  set inccommand=split " Live Substitution
endif


set termguicolors
let ayucolor="mirage"
colorscheme ayu
set background=dark
"color onedark

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
if has('nvim')
  set diffopt+=vertical
endif

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
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=green guifg=white ctermbg=1 ctermfg=15
endif

" Quick open a terminal window
command! -nargs=* HT split | terminal <args>
command! -nargs=* T vsplit | terminal <args>

" Wrap git commit message
au FileType gitcommit set tw=72

" jk instead of Esc
inoremap jk <Esc>
inoremap kl <Esc>

" Setting for quick copy & paste
nnoremap "y "+y
nnoremap "yy "+yy
nnoremap "p "+p
nnoremap "P "+p

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
