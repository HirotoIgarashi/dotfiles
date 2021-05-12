"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" neobundle#begin - neobundle#endの間に導入するプラグインを記載します。
" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" neobundl settings {{{
if has('vim_starting')
  " neobundleをインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vimからコマンド呼び出しているだけneobundleのクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
endif

let g:neobundle_default_git_protocao='https'

" Let NeoBundle manage NeoBundle
" こんな感じが基本の書き方
NeoBundle 'nanotech/jellybeans.vim'

" vimに非同期処理を提供
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'make -f make_mingw32.mak',
  \   'cygwin' : 'make -f make_cygwin.mak',
  \   'mac' : 'make -f make_mac.mak',
  \   'unix' : 'make -f make_unix.mak',
  \  },
  \}

" 括弧を自動的に閉じる
NeoBundle 'Townk/vim-autoclose'

" 補完機能を使う
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \}
endif

" neocomplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_complete_start_length = 3
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#use_vimproc = 1
let g:neocomplete#source#buffer#cache_limit_size = 1000000
let g:neocomplete#source#tags#cache_limit_size = 30000000
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" }}}

" ifの終了宣言を自動的に挿入
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}

" javascriptのシンタックスハイライト
NeoBundle 'JavaScript-syntax'

" javascriptのインデント
NeoBundle 'pangloss/vim-javascript'

" Markdownの環境
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" ファイルをtree表示してくれる
" 起動は:NERDTree
NeoBundle 'scrooloose/nerdtree'

" Pythonの環境
" NeoBundle 'klen/python-mode'

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする。
NeoBundleCheck

" Required:
call neobundle#end()

"End NeoBundle Scripts-------------------------

filetype plugin indent on
" どうせだからjellybeansカラースキーマを使ってみましょう
set t_Co=256
syntax on
colorscheme jellybeans

set expandtab     "タブ入力を複数の空白入力に置き換える
set tabstop=2     "画面上でタブ文字が占める幅
set shiftwidth=2  "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    "改行時に前の行のインデントを継続する
set smartindent   "改行時に入力された行の末尾に合わせて次の行のインデントを増減

set number        "行番号を表示"
" set list          "タブなどの特殊文字を表示"
set cursorline    "カーソルがある行に特別な色付けなど"
au BufRead,BufNewFile *.md set filetype=markdown

vmap <silent> ;h :s?^\(\s*\)+ '\([^']\+\)',*\s*$?\1\2?g<CR>
vmap <silent> ;q :s?^\(\s*\)\(.*\)s*$? \1 + '\2'?g<CR>

set foldmethod=syntax
set foldlevel=100
