language en_US.UTF-8
filetype off " required

if has('nvim')
  let s:editor_root=expand("~/.config/nvim")
else
  let s:editor_root=expand("~/.vim")
endif

" set the runtime path to include Vundle and initialize
let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle.vim/'
call vundle#begin(s:editor_root . '/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'thinca/vim-qfreplace'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'w0rp/ale'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'chriskempson/base16-vim'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/twilight256.vim'
Plugin 'vim-scripts/wombat256.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:mapleader = " "


" ---------------- ALE ---------------
let g:ale_emit_conflict_warnings = 1
let g:ale_linters = {
      \ 'javascript': ['eslint', 'tsserver'],
      \ 'json': ['prettier'],
      \ 'markdown': ['prettier'],
      \}
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'json': ['prettier'],
      \ 'markdown': ['prettier'],
      \}

let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert

let g:ale_sign_error = '>'
let g:ale_fix_on_save = 1
" ------------------- / ALE ---------------

set showmode
let $FZF_DEFAULT_COMMAND=''

" ---------------- COOL KEY MAPPINGS ----------------

nnoremap <C-P> :FZF<CR>
nnoremap <C-S> :w<CR>
nnoremap <C-F> :Ack! ''<left>
nnoremap <C-x> caw
nnoremap Y y$
nnoremap < <C-w>4<
nnoremap > <C-w>4>
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap <Leader>fp :w<CR>:!prettier-eslint --print-width=120 --write %<CR>:e!<CR>
nnoremap <Leader>ff :w<CR>:!prettier --single-quote --trailing-comma es5 --arrow-parens always --print-width 120 --write %<CR>:e!<CR>
nnoremap <Leader>pp :w<CR>:!prettier --trailing-comma=all --write %<CR>:e!<CR>
nnoremap _ :ALEFix<CR>
nnoremap <C-x> :cprev<CR>
nnoremap <C-q> :cnext<CR>
nnoremap <Leader>m 0f{lr<CR>f}hr<CR>k:s/, /,\r/g<CR>
nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <F2> "7yiw:%s/\<<C-R>7\>/<C-R>7/g<left><left>
nnoremap <silent> <F3> :ALEFindReferences<CR>
nnoremap j gj
nnoremap k gk
nnoremap <Leader>r :redraw!<CR>
nnoremap <silent> gu "8yiW:!open "<C-R>8"<CR><CR>
nnoremap “ @q
nnoremap ” @r
nnoremap ‘ :cdo<space>s/\<<C-R>"\>/seller.<C-R>"/gc
nnoremap <silent> gi "8yiw:!open https://github.com/immocapital/immo-platform/issues/<C-R>8<CR><CR>
nnoremap <silent> gm "8yiw:!open "https://github.com/immocapital/immo-platform/issues?q=is\%3Aissue+is\%3Aopen+assignee\%3Aewan-roberts+milestone\%3A<C-R>8"<CR><CR>
nnoremap <silent> gv :tabe ~/notes/todo.taskpaper<CR>
nnoremap <ESC> <ESC>:nohlsearch<CR>
nnoremap <Leader>ut :UndotreeShow \| UndotreeFocus<CR>
nnoremap <Leader>uc :UndotreeHide<CR>
nnoremap <Leader>nn :NERDTreeFocus<CR>
nnoremap <Leader>nc :NERDTreeClose<CR>

vnoremap < <gv
vnoremap > >gv
vnoremap <Leader>p :diffput<CR>
vnoremap <silent> <c-n> "2y:let @/ = @2\|set hls<C-M>
vnoremap <silent> <C-a> :Tabularize /:\zs/l0l1<CR>
vnoremap <silent> ,a :Tabularize /=<CR>

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
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:deoplete#enable_at_startup = 1

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
set expandtab
set scrolloff=20 " Show 10 lines below cursor when scrolling

set wildignorecase
set ignorecase
set smartcase
set linebreak
set breakindent
set hidden
set virtualedit = "block"
set mouse=a
set fcs=eob:⠀
set list
set listchars=trail:×,extends:…,precedes:…,tab:·\ 
set clipboard=unnamed
set noswapfile
set undofile
set undodir=~/.vim-undo
set foldmethod=manual
set foldlevel=999
set nocursorline
set wrap
set scrolloff=1
set diffopt+=vertical
set showbreak=¶

augroup gitcommit
  autocmd!
  autocmd FileType gitcommit setlocal nowrap
augroup END


" se termguicolors
hi VertSplit term=NONE cterm=NONE ctermfg=245 ctermbg=NONE gui=NONE guifg=black guibg=#6C6C6C
hi ALEError ctermfg=214 ctermbg=none cterm=none
hi SpellBad ctermbg=none cterm=underline ctermfg=171
hi DiffAdd ctermfg=green ctermbg=none
hi DiffChange ctermfg=yellow ctermbg=none
hi DiffDelete ctermfg=red ctermbg=none
hi DiffText cterm=underline ctermfg=blue ctermbg=none
hi ALEErrorSign ctermfg=red
hi Folded ctermbg=black

set termguicolors
color base16-tomorrow-night
augroup SuperColor
  autocmd!
  autocmd ColorScheme * hi Normal guibg=#050505 guifg=white
  autocmd ColorScheme * hi Visual guibg=blue guifg=white
  autocmd ColorScheme * hi LineNr guibg=#050505 guifg=grey
  autocmd ColorScheme * hi GitGutterChange guibg=none
  autocmd ColorScheme * hi GitGutterAdd guibg=none
  autocmd ColorScheme * hi GitGutterChangeDelete guibg=none
  autocmd ColorScheme * hi VertSplit term=NONE cterm=NONE ctermfg=245 ctermbg=NONE guifg='#282a2e' guibg=NONE
augroup END

