"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
  
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
 
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" [fugitive.vim] Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" [vim-slim] slimのシンタックスハイライト
NeoBundle 'slim-template/vim-slim'
" [NERDTree] ファイル・ディレクトリの一覧表示
NeoBundle 'scrooloose/nerdtree'
" [autoclose] 括弧の入力補完
NeoBundle 'Townk/vim-autoclose'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

call neobundle#end()
 
" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

set number
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,cp932,iso2022-jp,euc-jp,sjis,ucs-2
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

" カーソル位置を強調表示
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn!<CR>
hi CursorLine ctermbg=236 cterm=None
hi CursorLineNr ctermfg=7
hi CursorColumn ctermbg=236

" 行頭行末を左右移動でまたぐ
set whichwrap=b,s,h,l,<,>,[,]

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<\ %f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y%=%c,\ %1l/%L%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=\ %{fugitive#statusline()}

" 予測変換<C-p> or <C-n>の色の設定
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=4
" hi PmenuSbar ctermbg=2
" hi PmenuThumb ctermfg=3
