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

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'

" Plugins
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree' 

" web
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tmhedberg/matchit'
"NeoBundle 'tell-k/vim-browsereload-mac' MacOnly

" 補完
NeoBundle 'taichouchou2/vim-rsense'

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
NeoBundle 'taichouchou2/vim-ref-ri'
NeoBundle 'taq/vim-rspec'

filetype plugin indent on
syntax on

" Installation check.
if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    finish
endif
