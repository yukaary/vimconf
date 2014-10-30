set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set encoding=utf-8
set nocompatible
set nowritebackup
set nobackup
set noswapfile
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif

"setlocal omnifunc=syntaxcomplete#Complete

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'

" Plugins
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'Shougo/neosnippet-snippets'

" web
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tmhedberg/matchit'
"NeoBundle 'tell-k/vim-browsereload-mac' MacOnly

" 補完
NeoBundle has('lua') ? 'Shougo/neocomplete.vim' : 'Shougo/neocomplcache.vim'

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
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" railsサポート
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'

" reference環境
NeoBundle 'thinca/vim-ref'

" Python
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ "autoload": {
    \   "filetypes": ["python", "python3", "djangohtml"],
    \ }}

" Go
"NeoBundleLazy 'Blackrush/vim-gocode', {
"    \ "autoload": {
"    \   "filetypes": ["go"],
"    \ }}
NeoBundle 'Blackrush/vim-gocode', {"autoload": {"filetypes": ['go']}}

filetype plugin on
filetype plugin indent on
syntax on

" Installation check.
if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    finish
endif

" neocomplete
let s:hooks = neobundle#get_hooks("neocomplete.vim")
function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_smart_case = 1
    NeoCompleteEnable
endfunction

" neocomplcache
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


""" Development environment for Go
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
set completeopt=menu,preview

""" Development environment for Python
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#force_py_version = 3

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomple#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
