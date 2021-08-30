
call plug#begin()

" Apperiance Plugins
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mattn/emmet-vim'

" Linting engine
Plug 'dense-analysis/ale'

Plug 'davidhalter/jedi-vim'
" Auto completition
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" For Denite features
Plug 'Shougo/denite.nvim'


" Vue specific plugin
Plug 'leafOfTree/vim-vue-plugin'
Plug 'othree/html5.vim'

" Syntax highlighting plugins
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'storyn26383/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'

Plug 'preservim/nerdtree'
call plug#end()

" Turn off search highlighting
set nohls
" Share clipboard between system and vim
set clipboard=unnamedplus

" Apperiance Settings
set t_Co=256
set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:palenight_terminal_italics=1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
set termguicolors


" Set Path to current directory as project root for easier finding files
set path=$PWD/**
set wildignore+=**/node_modules/**
set wildignore+=**/venv/**
set wildignore+=*.pyc
nnoremap <c-p> :find

" Deoplete Settings
let g:deoplete#enable_at_startup = 1

" Close preview window after finishing autocomplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" indetation plugin
filetype indent plugin on

" Tab behavior settings
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
"set autoindent

"ALE Settings	
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'python': ['flake8'],
\   'css': ['eslint'],
\   'vue': ['prettier', 'eslint'],
\   'javascript': ['prettier'],
\}

let g:ale_fixers = {
\   'python': ['black'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'vue': ['prettier'],
\}

" Syntax enable

let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_typescript = 1
let g:python_highlight_all = 1

let g:jedi#completions_enabled = 0
" Shortcut for opening nerdtree
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Faster movement between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Terminal shortcuts
if has("nvim")
  " Make escape work in the Neovim terminal.
  tnoremap <Esc> <C-\><C-n>

  " Make navigation into and out of Neovim terminal splits nicer.
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l

  " I like relative numbering when in normal mode.
  autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber

  " Prefer Neovim terminal insert mode to normal mode.
  autocmd BufEnter term://* startinsert
endif

let g:user_emmet_leader_key='<C-Z>'

" Execute python script on F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

