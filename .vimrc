set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set notitle
set nobackup
set autoread
set noswapfile
set hidden "編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start
set browsedir=buffer
set number
set showmatch "括弧の対応をハイライト
set autoindent
set smartindent
set encoding=utf-8
" set fileencoding=utf-8,euc-jp,cp932
set incsearch
" 10進数にする
set nrformats=
set hlsearch "search result heightlist
set nobomb
set nocompatible
set completeopt -=preview
set previewheight=30
set clipboard=unnamed
set foldmethod=manual
set splitright "縦分割時は右
set splitbelow
set lazyredraw
set ttyfast
set noundofile
set ambiwidth=double
" set list " 不可視文字の可視化
" set listchars=tab:>-,trail:-
filetype off

"default keymap
nnoremap <c-e> $
cnoremap <c-a> <HOME>
cnoremap <c-e> <END>
inoremap <c-a> <ESC>^i
inoremap <c-e> <ESC>$a
inoremap ' ''<Left>
inoremap " ""<left>
inoremap { {}<Left>
inoremap [ []<left>
inoremap ( ()<left>
" inoremap jj <Esc><Esc>
inoremap jj <Esc><Esc>
inoremap jk <Esc><Esc>
inoremap <C-G> <Esc><Esc>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" nnoremap <tab> <C-w><C-w>
" inoremap <C-x><C-c> <C-x><C-]> 
if has('nvim')
  nmap <BS> <C-W>h
  " nmap <C-h> <C-w>h
endif

noremap ; :
nnoremap 0 ^
nnoremap 9 <C-^>
vnoremap v i"
nnoremap <C-]> g<C-]> 
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" nnoremap <Right> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Up> <Nop>
" nnoremap <Down> <Nop>
"set command mode
command! Ev edit ~/.vimrc
command! NEv edit ~/.nvimrc
command! Rv source ~/.vimrc
command! NRv source ~/.vimrc
command! Ze edit ~/.zshrc
command! Zr source ~/.zshrc
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

set nofoldenable      
set foldmethod=indent   "fold based on indent
set foldlevel=2        "this is just what i use


" vim plugin start
call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc', { 'do': 'make' }

" depend on ctrlp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
let g:ctrlp_funky_sort_by_mru = 1
let g:ctrlp_funky_php_include = 1
let g:ctrlp_funky_php_requires = 1

Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
" Plug 'nixprime/cpsm', { 'do': './install.sh' }

Plug 'Shougo/vimfiler'
Plug 'Shougo/unite.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'keith/swift.vim'
Plug 'terryma/vim-multiple-cursors'

" git
Plug 'tpope/vim-fugitive'


"javascript"
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'jiangmiao/simple-javascript-indenter'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'mtscout6/vim-cjsx'
Plug 'justinj/vim-react-snippets'
Plug 'myhere/vim-nodejs-complete'

autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
let g:node_usejscomplete = 1
"
Plug 'janko-m/vim-test'

Plug 'benekastah/neomake'
" , { 'for': ['python', 'javascript', 'json'] }
" golang
Plug 'google/vim-ft-go'
Plug 'fatih/vim-go'
Plug 'nsf/gocode'
Plug 'vim-jp/vim-go-extra'

" php
Plug 'xsbeats/vim-blade'
Plug 'StanAngeloff/php.vim'
Plug 'tobyS/pdv'
Plug 'akiyan/vim-textobj-php'

" ruby
Plug 'marcus/rsense'
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

" python
Plug 'davidhalter/jedi-vim'

" ctag
Plug 'soramugi/auto-ctags.vim'
Plug 'glidenote/memolist.vim'

" infra
Plug 'ekalinin/Dockerfile.vim'

" utility
Plug 'kana/vim-textobj-user'
Plug 'akiyan/vim-textobj-php'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'
" Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'joonty/vdebug'
Plug 'tpope/vim-eunuch'
Plug 'stephpy/vim-yaml'
Plug 'elzr/vim-json'
Plug 'LeafCage/yankround.vim'
Plug 'tomtom/tcomment_vim'
Plug 'thinca/vim-qfreplace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rking/ag.vim'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/vim-easy-align'

" color
Plug 'tejr/sahara'

" web
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-jade'

"doc
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'

Plug 'yssl/QFEnter'

" if has('mac')
" Plug 'ervandew/eclim'
" endif
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --gocode-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsUsePythonVersion=2

call plug#end()

syntax on
filetype plugin indent on 

"
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234


" set color
set t_Co=256
colorscheme sahara 
"
"set help
noremap <ESC><ESC> :nohlsearch<CR>
autocmd FileType help nnoremap <buffer> q <C-w>c
"
"set matcher

if has('nvim')
else
  source $VIMRUNTIME/macros/matchit.vim
  let b:match_words = '<:>,<\@<=tag>:<\@<=/tag>'
endif


" golng configure"
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

nnoremap  [unite]   <Nop>
nmap    f [unite]
nnoremap [unite]n :UltiSnipsEdit <CR>

" vimfiler
nnoremap [unite]r :<C-u>VimFilerCurrentDir -toggle -find<Cr>
nnoremap [unite]e :<c-u>VimFilerBufferDir -toggle -find<cr>
nnoremap [unite]p :<c-u>VimFiler -toggle -project<cr>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

autocmd! FileType vimfiler call s:my_vimfiler_settings()
function! s:my_vimfiler_settings()
    nnoremap <silent><buffer><expr> p vimfiler#do_action('project_cd')
    nmap <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
    nmap <buffer><expr> o vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
    nmap <buffer><expr> s vimfiler#smart_cursor_map("\<Plug>(vimfiler_select_sort_type)", "\<Plug>(vimfiler_expand_tree)")
    nnoremap <buffer> b :CtrlPBookmarkDirAdd<CR>
endfunction

" vimshell
nnoremap <space>ii :<C-u>VimShell<cr>
nnoremap <space>ip :<C-u>VimShellInteractive php -a<cr>
nnoremap <space>ir :<C-u>VimShellInteractive irb<cr>
nnoremap <space>iy :<C-u>VimShellInteractive ipython<cr>
nnoremap <space>i :<C-u>VimShellInteractive ipython<cr>

" ctrlp
nnoremap [unite]a :<C-u>CtrlprojEdit<cr>
nnoremap <space>e :<C-u>CtrlPFunky<cr>
nnoremap [unite]j :<C-u>CtrlPMRU<cr>
nnoremap [unite]p :<C-u>FZF<cr>
nnoremap [unite]f :<C-u>CtrlPCurWD<cr>
nnoremap [unite]s :<C-u>CtrlPCurFile<cr>

" augroup CtrlPDirMRU
"   autocmd!
"   autocmd FileType * if &modifiable | execute 'silent CtrlPBookmarkDirAdd! %:p:h' | endif
" augroup END
let g:ctrlp_map = '<c-f>'
" let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['mixed', 'bookmarkdir', 'funky']
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_use_migemo = 1
let g:ctrlp_regexp = 0
let g:ctrlp_mruf_max            = 10000 " MRUの最大記録数
let g:ctrlp_mruf_exclude = '.git/.*' " MacOSX/Linux
let g:ctrlp_mruf_save_on_update = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_prompt_mappings = {
      \ 'PrtCurRight()':        ['<right>'],
      \ 'AcceptSelection("h")': ['<c-o>'],
      \ 'PrtDeleteEnt()':       ['<c-d>'],
      \ 'CreateNewFile()':      ['<c-u>'],
      \ 'PrtClearCache()':      ['<c-l>']
      \ }
  
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_use_caching = 1
  let g:ctrlp_user_command = 'ag %s -l -i --nocolor --nogroup --ignore ''.git''  --ignore ''.DS_Store'' --ignore ''*.png'' --ignore ''*.jpg'' --hidden -g ""'
elseif executable('files')
  let g:ctrlp_use_caching = 1
  let g:ctrlp_user_command = 'files -A %s'
endif

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

"cps
let g:cpsm_highlight_mode = 'none'

nnoremap <cr> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_only_silent = 1

" git fugitive
nnoremap <space>d :<C-u>Gdiff<cr>
nnoremap <space>f :<C-u>Gstatus<cr>
nnoremap <space>' :<C-u>Gitv --all<cr>
nnoremap <space>; :<C-u>Gitv! --all<CR>
nnoremap <space>b :<C-u>Gblame<cr>
nnoremap <space>p :<C-u>Gpush<cr>
nnoremap <space>l :<C-u>Gpull --rebase<cr>
" nnoremap <space>o :<C-u>only<CR>
" nnoremap <Space>a :<C-u>Gwrite<Enter>
" nnoremap <space>r :<C-u>Gread<Enter>
" nnoremap <Space>c :<C-u>Gcommit<Enter>
" nnoremap <Space>C :<C-u>Git commit --amend<Enter>
set statusline=%<%F\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
autocmd QuickFixCmdPost *grep* cwindow


" ref
let g:ref_phpmanual_path = $HOME . '/.vim/refs/php-chunked-xhtml'
let g:ref_laravel_path = $HOME . '/Library/Application%20Support/Dash/DocSets/Laravel/Laravel.docset/Contents/Resources/Documents/laravel.com/api/5.0/index.html'
let g:ref_use_vimproc = 1
autocmd FileType ref call s:initialize_ref_viewer()
function! s:initialize_ref_viewer()
  nmap <buffer> b <Plug>(ref-back)
  nmap <buffer> f <Plug>(ref-forward)
  nnoremap <buffer> q <C-w>c
  setlocal nonumber
  " ... and more settings ...
endfunction

" emmet plugin
" let g:user_emmet_install_global = 0 
let g:use_emmet_complete_tag = 1
let g:user_emmet_expandabbr_key = ',,'

autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

	autocmd FileType python setlocal omnifunc=jedi#completions
	let g:jedi#completions_enabled = 0
	let g:jedi#auto_vim_configuration = 0
	" alternative pattern: '\h\w*\|[^. \t]\.\w*'


" surrond plugin
" autocmd filetype php let b:surround_45 = "<?php \r ?>"
autocmd filetype blade let b:surround_{char2nr("{")} = "{{ \r }}"
autocmd filetype blade let b:surround_{char2nr("e")} = "{!! \r !!}"


" cofofee plugin
let coffee_make_options = '--bare'
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd QuickFixCmdPost * nested cwindow | redraw!
let coffee_indent_keep_current = 1
let coffee_watch_vert = 1
" let coffee_linter = '/usr/local/bin/coffeelint'
" autocmd BufWritePost *.coffee silent make!

" ctags plugin
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']
let g:auto_ctags_bin_path = '/usr/local/bin/ctags'
" let g:auto_ctags_filetype_mode = 1
let g:auto_ctags_tags_args = '--exclude=storage --fields=+aimS --languages=php --tag-relative --recurse --sort=yes  --append=no'
set tags+=.git/tags

" like comment
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
      \'blade_surround' : "{{-- %s --}}",
\}

au FileType blade nmap <buffer><C-_><C-_> :TCommentAs blade_surround<CR>
au FileType blade vmap <buffer><C-_><C-_> :TCommentAs blade_surround<CR>

"yank plugin
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
" nmap <C-p> <Plug>(yankround-prev)
" nmap <C-n> <Plug>(yankround-next)

"help
" nmap <silent> K <Plug>DashSearch

autocmd BufNewFile,BufRead *.blade.php set ft=blade.php noexpandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.ect set ft=ect.html

" Visual mode surround bindings
xmap " S"
xmap ' S'
xmap [ S[
xmap ( S(
xmap { S{

" easy align plugin
vmap <Enter> <Plug>(EasyAlign)

" suffix type (default markdown)
let g:memolist_memo_suffix = "markdown"
let g:memolist_memo_suffix = "txt"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_ex_cmd = 'CtrlP'

noremap [unite]. :MemoNew<CR>
noremap [unite],  :MemoList<CR>


" quickRun
nnoremap <space>r :<C-u>QuickRun<CR>
let g:quickrun_config = {}
let g:quickrun_config = {
\   '*': {
\       'runmode': 'async:remote:vimproc',
\       'split': 'vertical'
\}
\}
"
" let g:quickrun_config.markdown = {
" \ 'outputter' : 'null',
" \ 'command'   : 'open',
" \ 'cmdopt'    : '-a',
" \ 'args'      : 'Marked',
" \ 'exec'      : '%c %o %a %s',
" \ }
"
" autocmd FileType php let b:vcm_tab_complete = 'tags'
" let g:vcm_default_maps = 0
" inoremap <C-K> <C-x><C-]>

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" json systax option
let g:vim_json_syntax_conceal = 0

" ref
let g:ref_detect_filetype = {
      \ 'blade.php': 'phpmanual', }

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

if !has("gui_running") && $COLORTERM == "gnome-terminal" && &t_Co <= 16
    if $TERM == "xterm"
        " Override the default xterm setting of Gnome Terminal so that
        " Powerline works.
        let $TERM = "xterm-256color"
    endif
    set t_Co=256
endif

augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *test.php set filetype=php.unit
augroup END
" 初期化
" let g:quickrun_config = {}
" PHPUnit
let g:quickrun_config['php.unit'] = {'command': 'phpunit'}

  let g:quickrun_config['swift'] = {
  \ 'command': 'swift',
  \ 'exec': '%c %o %s',
  \}

" Vdebug
let g:vdebug_keymap = {
\    "run" : "<Leader>e",
\    "run_to_cursor" : "<c-/>",
\    "step_over" : "<c-p>",
\    "step_into" : "<c-i>",
\    "step_out" : "<c-o>",
\    "close" : "q",
\    "detach" : "x",
\    "set_breakpoint" : "<Leader>p",
\    "eval_visual" : "<Leader>e",
\}

let g:vdebug_options= {
\    "timeout" : 8,
\    "break_on_open" : 0,
\    "continuous_mode": 1,
\    "on_close": "stop",
\}


let g:ycm_max_diagnostics_to_display = 10
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments_and_strings=1
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers['php'] =  ['->', '::']
let g:ycm_semantic_triggers['coffee'] =  ['.']
let g:ycm_semantic_triggers['scss'] =  ['re!^\s*', 're!:\s*']

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:ycm_complete_in_comments = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1 
" let g:ycm_key_invoke_completion = '<c-cr>'
"
let g:ycm_filetype_blacklist = {'unite': 1,}

let g:jsx_ext_required = 1 

" checker
let g:neomake_javascript_eshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['php']
let g:neomake_enabled_makers = ['makeprg']

let g:neomake_error_sign = {
    \ 'text': 'E>',
    \ 'texthl': 'ErrorMsg',
    \ }
  "
" autocmd! BufWritePost *.js,*.jsx,*.py,*.json Neomake
" let g:neomake_open_list = 1

au BufNewFile,BufRead *.php setlocal iskeyword+=$ noexpandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *blade.php setlocal  iskeyword+=$ noexpandtab tabstop=2 shiftwidth=2
" autocmd! BufWritePost * Neomake

"dash"
nmap <silent> <space>d <Plug>DashSearch


" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" fzf
let g:fzf_height=10
nnoremap [unite]a :<C-u>FZF<CR>

" quickfix
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
let g:qfenter_vopen_map = ['<C-v>']
let g:qfenter_hopen_map = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_topen_map = ['<C-t>']
