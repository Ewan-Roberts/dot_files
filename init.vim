language en_US.UTF-8
filetype off " required
filetype plugin indent on    " required

if has('nvim')
  let s:editor_root=expand("~/.config/nvim")
else
  let s:editor_root=expand("~/.vim")
endif

" set the runtime path to include Vundle and initialize
let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle.vim/'
call vundle#begin(s:editor_root . '/bundle')

" let Vundle manage Vundle, required
" Plugin 'justfielding/vim-chunkwm-navigator'
Plugin 'HendrikPetertje/vimify'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'chriskempson/base16-vim'
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()

let g:mapleader = " "
" ---------------- ALE ---------------
let g:ale_emit_conflict_warnings = 1
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'json':       ['prettier'],
      \ 'markdown':   ['prettier'],
      \}
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'json':       ['prettier'],
      \ 'markdown':   ['prettier'],
      \}
let g:ale_sign_error  = '>'
let g:ale_fix_on_save = 1
" ------------------- / ALE ---------------

" ---------------- FZF ---------------
let $FZF_DEFAULT_COMMAND='rg --files --hidden --ignore --glob "!web/*"'
" ---------------- /FZF ---------------

" ---------------- KEY MAPPINGS ----------------
nnoremap <C-P> :FZF<CR>
nnoremap <C-S> :w<CR>
nnoremap <C-F> :Ack! ''<left>
nnoremap <S-H> :tabprevious <CR>
nnoremap <S-L> :tabnext <CR>
nnoremap < <C-w>4<
nnoremap > <C-w>4>
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap _ :ALEFix<CR>
nnoremap <ESC> <ESC>:nohlsearch<CR>
nnoremap <Leader>n :NERDTreeFocus<CR>
nnoremap * *``
nnoremap Y y$
nnoremap q :q <CR>
nnoremap W <Nop>
nnoremap <C-W>s Hmx`` \|:split<CR>`xzt``

vnoremap < <gv
vnoremap > >gv
vnoremap <Leader>p :diffput<CR>
vnoremap <Leader>p :diffput<CR>

" Terminal navigation:
tnoremap <C-H> <C-\><C-N><C-W><C-H>
tnoremap <C-J> <C-\><C-N><C-W><C-J>
tnoremap <C-K> <C-\><C-N><C-W><C-K>
tnoremap <C-L> <C-\><C-N><C-W><C-L>

" RIPGREP
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_use_caching = 1
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer = 'et'
  let g:ackprg = 'rg --vimgrep --no-heading'
endif
" /RIPGREP

command! UT UndotreeToggle
command! UF UndotreeToggle
command! NF NERDTreeFocus
command! NC NERDTreeClose

let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI  = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeDirArrows = 1

" GitGutter conf
let g:gitgutter_enable = 1
let g:gitgutter_async = 1
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '⤒'
let g:gitgutter_sign_modified_removed = '│_'

set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=120
set scrolloff=20
set wildignorecase
set ignorecase
set smartcase
set linebreak
set breakindent
set hidden
set virtualedit=block
set mouse=a
set fcs=eob:⠀
set clipboard=unnamed
set noswapfile
set undofile
set undodir=~/.vim-undo
set foldmethod=manual
set foldlevel=99
set wrap
set scrolloff=1
set diffopt+=vertical
set list
set listchars=trail:×,extends:…,precedes:…,tab:·\ 
set signcolumn=yes
set showbreak=¶
set expandtab

hi VertSplit term=NONE cterm=NONE ctermfg=245 ctermbg=NONE gui=NONE guifg=black guibg=#6C6C6C
hi ALEError ctermfg=214 ctermbg=none cterm=none
hi SpellBad ctermbg=none cterm=underline ctermfg=171
hi DiffAdd ctermfg=green ctermbg=none
hi DiffChange ctermfg=yellow ctermbg=none
hi DiffDelete ctermfg=red ctermbg=none
hi DiffText cterm=underline ctermfg=blue ctermbg=none
hi ALEErrorSign ctermfg=red

" set termguicolors
" color base16-tomorrow-night
" augroup SuperColor
"   autocmd!
"   autocmd ColorScheme * hi Visual guibg=blue guifg=white
"   autocmd ColorScheme * hi GitGutterChange guibg=none
"   autocmd ColorScheme * hi GitGutterAdd guibg=none
"   autocmd ColorScheme * hi GitGutterChangeDelete guibg=none
" augroup END

set termguicolors
color base16-tomorrow-night
augroup SuperColor
  autocmd!
  autocmd ColorScheme * hi Normal guibg=black guifg=white
  autocmd ColorScheme * hi Visual guibg=blue guifg=white
  autocmd ColorScheme * hi Search cterm=NONE guibg=#bc8134 guifg=black
  autocmd ColorScheme * hi LineNr guibg=#050505 guifg=grey
  autocmd ColorScheme * hi GitGutterChange guibg=none
  autocmd ColorScheme * hi GitGutterAdd guibg=none
  autocmd ColorScheme * hi GitGutterChangeDelete guibg=none
  autocmd ColorScheme * hi VertSplit term=NONE cterm=NONE ctermfg=245 ctermbg=NONE guifg='#282a2e' guibg=NONE
  autocmd ColorScheme * hi VertSplit term=NONE cterm=NONE ctermfg=245 ctermbg=NONE guifg='#282a2e' guibg=NONE
augroup END

" syntax off
hi Search cterm=NONE guibg=#bc8134 guifg=black
hi CursorLine guibg=grey
hi Normal guifg=white guibg=black
hi Visual guibg=blue guifg=white

