filetype off
filetype plugin indent off

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
endif

call neobundle#begin(expand('~/.vim/bundle'))

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'

""" Color Themas - solarized, mustang, jellybeans
NeoBundle "vim-scripts/github-theme"
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'nanotech/jellybeans.vim'

""" サブモード導入
NeoBundle 'kana/vim-submode'

""" よく使うやつ
NeoBundle 'Shougo/unite.vim'
NeoBundle "ujihisa/unite-colorscheme"
NeoBundle 'Shougo/vimproc.vim', {
          \ 'build' : {
          \     'windows' : 'make -f make_mingw32.mak',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \    },
          \ }
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'tpope/vim-surround'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tmhedberg/matchit'
"NeoBundle 'open-browser.vim'
"NeoBundle 'mattn/emmet-vim'
"NeoBundle 'mattn/webapi-vim'
" set unavailable due to namespace conflict
"NeoBundle 'taichouchou2/html5.vim' 

""" スニペット
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

""" ctags
NeoBundle 'majutsushi/tagbar'
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-endwise'

""" 補完
NeoBundle has('lua') ? 'Shougo/neocomplete.vim' : 'Shougo/neocomplcache.vim'

""" 辞書機能
NeoBundle 'thinca/vim-ref'

" Python
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ "autoload": {
    \   "filetypes": ["python", "python3", "djangohtml"],
    \ }}

call neobundle#end()

""" 編集の設定
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set encoding=utf-8
set nocompatible
set nowritebackup
set nobackup
set noswapfile

filetype plugin on
filetype plugin indent on

""" カラースキーマ
colorscheme industry
if &term =~ "xterm-256color" || "screen-256color"
    set t_Co=256
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ "xterm-color"
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif

" プラグインのインストールチェックメッセージを出す
if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    finish
endif


""" 補完設定
if neobundle#is_installed('neocomplete.vim')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache.vim')
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_force_overwrite_completefunc=1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

let s:hooks = neobundle#get_hooks("neocomplete.vim")
function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_smart_case = 1
    NeoCompleteEnable
endfunction

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
  \ }

""" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

""" Common key bind
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sf :<C-u>Unite tab<CR>
nnoremap ff :<C-u>VimFiler -split -simple -winwidth=35 -no-quit<CR>
"nnoremap sq :<C-u>q<CR>
"nnoremap sQ :<C-u>bd<CR>
"nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
"nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

nnoremap fg :NERDTreeToggle<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

""" unite.vim
" start from insert mode
"let g:unite_enable_start_insert=1
" list up buffer
" nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap ,ub :Unite buffer<CR>
nnoremap ,ud :UniteWithBufferDir -buffer-name=files file<CR>
nnoremap ,ur :Unite -buffer-name=register register<CR>
nnoremap ,uf :VimFiler<CR>

" divide window
"au FileType unite nnoremap <silent> <buffer> <expr> <C-H> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-H> unite#do_action('split')
" divide window vertical
"au FIleType unite nnoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
"au FIleType unite inoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
" Esc x 2 to close
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


""" Development environment for Python
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#force_py_version = 3

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomple#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

let g:syntastic_python_checkers = ["python3","flake8"]

""" tagbar
if ! empty(neobundle#get("tagbar"))
      let g:tagbar_width = 20
      nn <silent> <leader>t :TagbarToggle<CR>
endif

""" ctags
let g:vim_tags_project_tags_command = "/usr/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_auto_generate = 1
set tags+=.tags

if has("path_extra")
    set tags+=tags;
endif

"nnoremap <C-]> g<C-]>
nnoremap <C-]> <C-w><C-]><C-w>T

