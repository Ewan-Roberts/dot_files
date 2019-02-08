

language en_US.UTF-8
filetype off                  " required

if has('nvim')
  let s:editor_root=expand("~/.config/nvim")
else
  let s:editor_root=expand("~/.vim")
endif

" set the runtime path to include Vundle and initialize
let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle.vim/'
call vundle#begin(s:editor_root . '/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'thinca/vim-qfreplace'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'

Plugin 'takac/vim-hardtime'
" let g:hardtime_default_on = 1

Plugin 'airblade/vim-gitgutter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'raimondi/delimitmate'
" Plugin 'Shougo/deoplete.nvim'
Plugin 'neovim/node-host'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-ragtag'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'tpope/vim-cucumber'
Plugin 'alvan/vim-closetag'
Plugin 'w0rp/ale'
" Plugin 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'rust-lang/rust.vim'
Plugin 'vim-scripts/matrix.vim--Yang'
Plugin 'koron/nyancat-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'lifepillar/pgsql.vim'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'davidoc/taskpaper.vim'
Plugin 'ervandew/supertab'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'vim-scripts/twilight256.vim'
Plugin 'vim-scripts/wombat256.vim'
Plugin 'jonathanfilip/vim-lucius'
" Plugin 'itchyny/lightline.vim'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'HerringtonDarkholme/yats.vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Quramy/tsuquyomi'
" Plugin 'joshdick/onedark.vim'
Plugin 'robertmeta/nofrils'
Plugin 'neutaaaaan/iosvkem'
Plugin 'godlygeek/tabular'
Plugin 'lisposter/vim-blackboard'
Plugin 'nino/surprise-colorize'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" let g:LanguageClient_serverCommands = {
"       \ 'reason': ['ocaml-language-server', '--stdio'],
"       \ 'ocaml': ['ocaml-language-server', '--stdio'],
"       \ 'typescript.jsx': ['typescript-language-server', '--stdio'],
"       \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
"       \ }
" let g:LanguageClient_diagnosticsList = 'Location'

let g:jsx_ext_required = 0

set scrolloff=10 " Show 10 lines below cursor when scrolling

set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=120
set expandtab
" set relativenumber

set scrolloff=20 " Show 10 lines below cursor when scrolling

set wildignorecase
set ignorecase
set smartcase
" Don't break up words when wrapping!
set linebreak
set breakindent
set hidden
set virtualedit = "block"
" Show Line numbers
" set number
set mouse=a
set fcs=eob:.

set list
set listchars=trail:×,extends:…,precedes:…,tab:·\ 

" Python 3
if has('nvim')
  if has('macunix')
    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
  else
    let g:python_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
  endif
endif

let g:mapleader = " "


" ---------------- ALE ---------------
let g:ale_emit_conflict_warnings = 1
let g:ale_linters = {
      \ 'javascript': ['eslint', 'tsserver'],
      \ 'scss': [],
      \ 'ruby': ['rubocop'],
      \ 'eruby': [],
      \ 'cpp': ['clang-format'],
      \ 'rust': ['rustfmt'],
      \ 'go': ['gofmt'],
      \ 'json': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'reason': ['refmt'],
      \ 'lua': ['luafmt'],
      \ 'python': ['autopep8'],
      \ 'html.handlebars': ['stylelint'],
      \}
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'ruby': ['rubocop'],
      \ 'cpp': ['clang-format'],
      \ 'rust': ['rustfmt'],
      \ 'go': ['gofmt'],
      \ 'json': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'reason': ['refmt'],
      \ 'lua': ['luafmt'],
      \ 'python': ['autopep8'],
      \ 'html': ['tidy', 'trim_whitespace'],
      \ 'scss': ['trim_whitespace'],
      \}

let g:ale_completion_enabled = 1
" set completeopt+=noinsert
set completeopt=menu,menuone,preview,noselect,noinsert

let g:ale_sign_error = '👎'
let g:ale_sign_warning = '😰'
" let g:ale_ruby_rubocop_executable = 'bundle'
" let g:ale_ruby_rubocop_options = 'exec rubocop'
let g:ale_javascript_prettier_eslint_executable = 'prettier-eslint'
let g:ale_javascript_prettier_eslint_use_global = 1
let g:ale_javascript_typescript_language_server_executable = 'typescript-language-server'
let g:ale_javascript_typescript_language_server_options = '--stdio'
let g:ale_scss_prettier_executable = '/usr/local/bin/prettier --single-quote'
let g:ale_scss_prettier_options = '--single-quote'
let g:ale_sass_prettier_executable = '/usr/local/bin/prettier --single-quote'
let g:ale_sass_prettier_options = '--single-quote'
let g:ale_css_prettier_executable = '/usr/local/bin/prettier --single-quote'
let g:ale_css_prettier_options = '--single-quote'
let g:ale_scss_prettier_use_global = 1
let g:ale_css_prettier_use_global = 1
let g:ale_sass_prettier_use_global = 1
let g:ale_lua_luafmt_executable = 'luafmt'
let g:ale_markdown_prettier_executable = 'prettier'
let g:ale_fix_on_save = 0
let g:ale_scss_stylelint_executable = 'stylelint'
let g:ale_scss_stylelint_options = '--fix'

" ------------------- / ALE ---------------

set showmode

let $FZF_DEFAULT_COMMAND = 'ack -g ""'

" ---------------- COOL KEY MAPPINGS ----------------

nnoremap <Leader>fp :w<CR>:!prettier-eslint --print-width=120 --write %<CR>:e!<CR>
nnoremap <Leader>ff :w<CR>:!prettier --single-quote --trailing-comma es5 --arrow-parens always --print-width 120 --write %<CR>:e!<CR>
nnoremap <Leader>pp :w<CR>:!prettier --trailing-comma=all --write %<CR>:e!<CR>
nnoremap _ :ALEFix<CR>

nnoremap <Leader>d :let @/ = '\<' . expand('<cword>') . '\>' \|set hls<C-M>

vnoremap <silent> <c-n> "2y:let @/ = @2\|set hls<C-M>

nnoremap <C-P> :FZF<CR>
nnoremap <C-S> :w<CR>
nnoremap <C-F> :Ack! ''<left>
nnoremap <C-x> caw
" inoremap <Tab> <C-N>
" inoremap <S-Tab> <C-P>

nnoremap Y y$
nnoremap < <C-w>4<
nnoremap > <C-w>4>
nnoremap + <C-w>+
nnoremap - <C-w>-

nnoremap <C-x> :cprev<CR>
nnoremap <C-q> :cnext<CR>

nnoremap <Leader>m 0f{lr<CR>f}hr<CR>k:s/, /,\r/g<CR>

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> <F3> :call LanguageClient#textDocument_references()<CR>

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <F2> "7yiw:%s/\<<C-R>7\>/<C-R>7/g<left><left>
nnoremap <silent> <F3> :ALEFindReferences<CR>


nnoremap j gj
nnoremap k gk

vnoremap < <gv
vnoremap > >gv

vnoremap <Leader>p :diffput<CR>

nnoremap <Leader>r :redraw!<CR>
nnoremap <Leader>c /<<<<<<<\\|=======\\|>>>>>>><CR>

" Open GitHub issue:
nnoremap <silent> gi "8yiw:!open https://github.com/immocapital/immo-platform/issues/<C-R>8<CR><CR>
nnoremap <silent> gm "8yiw:!open "https://github.com/immocapital/immo-platform/issues?q=is\%3Aissue+is\%3Aopen+assignee\%3Aewan-roberts+milestone\%3A<C-R>8"<CR><CR>
nnoremap <silent> gv :tabe ~/notes/todo.taskpaper<CR>

nnoremap <silent> gu "8yiW:!open "<C-R>8"<CR><CR>

" Terminal navigation:
tnoremap <C-H> <C-\><C-N><C-W><C-H>
tnoremap <C-J> <C-\><C-N><C-W><C-J>
tnoremap <C-K> <C-\><C-N><C-W><C-K>
tnoremap <C-L> <C-\><C-N><C-W><C-L>


nnoremap “ @q
nnoremap ” @r
nnoremap ‘ :cdo<space>s/\<<C-R>"\>/seller.<C-R>"/gc
nnoremap ’ :Ack<Space>"\b<C-R>"\b"<Space>web\/seller\/gbr<CR>

vnoremap <silent> <C-a> :Tabularize /:\zs/l0l1<CR>
vnoremap <silent> ,a :Tabularize /=<CR>

" ----------------== / COOL KEY MAPPINGS -------------=

" RIPGREP

if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_use_caching = 1
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer = 'et'

  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" /RIPGREP

nnoremap <ESC> <ESC>:nohlsearch<CR>
command! UT UndotreeToggle
command! UF UndotreeToggle
command! NF NERDTreeFocus
command! NC NERDTreeClose

nnoremap <Leader>ut :UndotreeShow \| UndotreeFocus<CR>
nnoremap <Leader>uc :UndotreeHide<CR>
nnoremap <Leader>nn :NERDTreeFocus<CR>
nnoremap <Leader>nc :NERDTreeClose<CR>

let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Use system clipboard as default buffer
set clipboard=unnamed

let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#flow#flow_bin = 'flow'

" GitGutter conf
let g:gitgutter_enable = 1
let g:gitgutter_async = 1
" let g:gitgutter_diff_args = '-w'

let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '⤒'
let g:gitgutter_sign_modified_removed = '│_'

set noswapfile

set undofile
set undodir=~/.vim-undo

set foldmethod=manual
set foldlevel=999

set nocursorline
set wrap
set scrolloff=1

augroup quickfix
    autocmd!
    autocmd FileType qf setlocal nowrap
augroup END

augroup gitcommit
  autocmd!
  autocmd FileType gitcommit setlocal nowrap
augroup END

function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" If I use :set wrap, show a lil' symbol
set showbreak=¶

" Escape sequences to enable italics -- works with the
" screen-256color.termconfig configuration which is loaded by tmux.
" set t_ZH=[3m
" set t_ZR=[23m

set diffopt+=vertical
" set laststatus=1

" se termguicolors
se bg=dark
hi VertSplit term=NONE cterm=NONE ctermfg=245 ctermbg=NONE gui=NONE guifg=black guibg=#6C6C6C
" hi NonText ctermfg=31
hi ALEError ctermfg=214 ctermbg=none cterm=none
hi SpellBad ctermbg=none cterm=underline ctermfg=171
" hi Search cterm=none ctermbg=none ctermfg=81
hi DiffAdd ctermfg=green ctermbg=none
hi DiffChange ctermfg=yellow ctermbg=none
hi DiffDelete ctermfg=red ctermbg=none
hi DiffText cterm=underline ctermfg=blue ctermbg=none
" hi ColorColumn ctermbg=232 guibg=#273646
hi ALEErrorSign ctermfg=red
hi Folded ctermbg=black
" hi StatusLine ctermbg=white ctermfg=black
" hi StatusLineNC ctermbg=grey ctermfg=black

command! Fancy syn on|set termguicolors
command! HalfFancy :color base16-google-dark|syn off|set termguicolors
command! Blab :color blackboard|set termguicolors|syn on
" Fancy
" Blab
" Fancy
" HalfFancy

" set colorcolumn=120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499
" set colorcolumn=80

function! s:SetAlternateForJsFile()
  let template_file=substitute(expand('%'), '\v^(.*)/components/(.*)\.js$', '\1/templates/components/\2.hbs', '')
  if bufwinnr(template_file) == -1
    execute ':badd ' . template_file
  endif
  let @#=template_file
endfunction

function! s:SetAlternateForHbsFile()
  let template_file=substitute(expand('%'), '\v^(.*)/templates/components/(.*)\.hbs$', '\1/components/\2.js', '')
  if bufwinnr(template_file) == -1
    execute ':badd ' . template_file
  endif
  let @#=template_file
endfunction

autocmd! BufRead *.js :call s:SetAlternateForJsFile()
autocmd! BufRead *.hbs :call s:SetAlternateForHbsFile()


" Temp mappings

nnoremap gy mzggyG`z

" VV settings
if exists('g:vv')
  VVset fontfamily='Menlo'
  VVset fontsize=12
endif

set termguicolors
color base16-tomorrow-night
augroup SuperColor
  autocmd!
  autocmd ColorScheme * hi Normal guibg=#050505
  autocmd ColorScheme * hi LineNr guibg=#050505 guifg=grey
  autocmd ColorScheme * hi GitGutterChange guibg=none
  autocmd ColorScheme * hi GitGutterAdd guibg=none
  autocmd ColorScheme * hi GitGutterChangeDelete guibg=none
  autocmd ColorScheme * hi VertSplit term=NONE cterm=NONE ctermfg=245 ctermbg=NONE guifg='#282a2e' guibg=NONE
augroup END


