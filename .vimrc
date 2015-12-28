" neobundl settings {{{
if has('vim_starting')
  set nocompatible
  " neobundleをインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vimからコマンド呼び出しているだけneobundleのクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepathの追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocao='https'

" neobundle#begin - neobundle#endの間に導入するプラグインを記載します。


NeoBundleFetch 'Shougo/neobundle.vim'
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

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする。
NeoBundleCheck
call neobundle#end()
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
