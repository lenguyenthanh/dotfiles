" automatically reload vim config(s)
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Change the leader key
let mapleader=","

" All plugins go here
call plug#begin('~/.local/share/nvim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Track the engine.
Plug 'SirVer/ultisnips'
  " Trigger configuration.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger='<tab>'
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Commenter
Plug 'scrooloose/nerdcommenter'

" Better file browser
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
  nmap <leader>n ;NERDTreeToggle<CR>
  nmap <leader>m ;NERDTreeFind<CR>
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

" Note taking
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

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
  nnoremap <silent> <leader>f :Files <C-r>=expand("%:h")<CR>/<CR>
  nnoremap <C-p> :Files<CR>
  nnoremap <C-b> :Buffers<CR>
  " Git commit
  let g:fzf_commits_log_options = '--graph --color=always
    \ --format="%C(yellow)%h%C(red)%d%C(reset)
    \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

  nnoremap <silent> <leader>c  :Commits<CR>
  nnoremap <silent> <leader>bc :BCommits<CR>

" LANGUAGE
" Json
Plug 'elzr/vim-json', { 'for' : 'json' }

" Markdown
Plug 'plasticboy/vim-markdown', { 'for' : 'markdown' }

" Toml Syntax
Plug 'cespare/vim-toml', { 'for' : 'toml' }

Plug 'udalov/kotlin-vim', { 'for' : 'kotlin'} " Kotlin

call plug#end()

filetype plugin indent on     " required!
filetype on

" Hide MacVim scrollbar
set guioptions-=r
set guioptions-=L

syntax enable
color onedark
set background=dark

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

" Binding paste mode
set pastetoggle=<F2>

" set nowrap        " don't wrap lines
set expandtab	    " tab by spaces
set autoindent    " always set auto indenting on
set cindent		    " copy the previous indentation on auto indenting
set smartindent   " smart indent
set rnu           " show relative line numbers
set nu            " show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set incsearch     " show search matches as you type
set nobackup	    " no backup
set noswapfile	  " no swap files
set hidden


set ts=2 		      " set tabs to have 2 spaces
set shiftwidth=2  " when using the >> or << commands, shift lines by 4 spaces
set cursorline    " show a visual line under the cursor's current line
set nofixendofline

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
" inoremap <esc> <NOP>

" Line text object
xnoremap il $o^
onoremap il :normal vil<CR>

" Other files to consider as Ruby
au BufRead,BufNewFile Vagrantfile set ft=ruby
