""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" colorscheme 'molokai'
NeoBundle 'tomasr/molokai'

" colorscheme 'hybrid'
NeoBundle 'w0ng/vim-hybrid'

" neomru
NeoBundle 'Shougo/neomru.vim'

" Unite.vim
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1

"vim-indent-guides インデントの可視化
NeoBundle 'nathanaelkane/vim-indent-guides'
"起動時にvim-indent-guidesをオン
let g:indent_guides_enable_on_vim_startup = 1

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""

set number
set title
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent

"閉じ括弧補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

"色の設定
set t_Co=256
"コメントの色を緑に
autocmd ColorScheme * highlight Comment ctermfg=34 guifg=#008800
"カラースキームの設定
colorscheme molokai

syntax on

"日本語入力の設定
call system('type ibus')
if v:shell_error==0
    inoremap <Esc> <Esc>:call system('ibus engine "xkb:jp::jpn"')<CR>
endif
