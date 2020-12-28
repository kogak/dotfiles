if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' .  shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:toml_file_lazy = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#load_toml(s:toml_file_lazy, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" プラグイン以外のその他設定が続く
" :
set updatetime=100

" ale
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }
" 
" fzf.vim
let g:fzf_layout = { 'window': 'enew' }
" 
syntax on

set termguicolors
colorscheme dogrun

set encoding=utf-8

set number
set cursorline
set expandtab

" fzf
nnoremap <Space>aa :FilesMru --tiebreak=end<cr>
nnoremap <Space>pp :ProjectMru<cr>
nnoremap <Space>gg :GFiles<cr>
nnoremap <Space>hh :History<cr>
nnoremap <Space>bb :Buffers<cr>


" terminal mode
tnoremap <silent> <ESC> <C-\><C-n>

