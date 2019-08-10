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

" Language Server
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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
"Plug 'alx741/vim-stylishask', { 'for' : 'haskell' }

" Swift
Plug 'keith/swift.vim', { 'for' : 'swift' }

call plug#end()

filetype plugin indent on     " required!
filetype on

" Hide MacVim scrollbar
set guioptions-=r
set guioptions-=L

syntax enable

nnoremap ; :
nnoremap : ;

" Re-map move around for wrapping line
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Setting for quick copy & paste
vmap <Leader>y "y
vmap <Leader>d "+d
nmap <Leader>yy "+yy
nmap <Leader>p "+p


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
nnoremap <leader>s :set invspell<CR>

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
