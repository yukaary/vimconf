set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set encoding=utf-8

set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=$VIM\bundle\neobundle.vim
    call neobundle#rc(expand('$VIM\bundle'))
endif

setlocal omnifunc=syntaxcomplete#Complete

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
NeoBundle 'Shougo/neocomplete.vim'

"コメント
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neocomplcache.vim'

" railsサポート
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'

" reference環境
NeoBundle 'thinca/vim-ref'

" Python
NeoBundle 'davidhalter/jedi-vim'

filetype plugin indent on
syntax on

" Installation check.
if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    finish
endif

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

nnoremap ,ut :<C-u>Unite tab<CR>
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
set completeopt=menu,preview

""" Development environment for Python
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#force_py_version = 3

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomple#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'


