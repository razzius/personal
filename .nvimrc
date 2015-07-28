syntax on

set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set undofile
set undodir=~/.nvim/undo//
set backupdir=~/.nvim/backup//
set directory=~/.nvim/swap//

set number
set numberwidth=3
set relativenumber
set scrolloff=4

set shell=/bin/sh
filetype off
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle')
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'shougo/neocomplete.vim'
Plugin 'shougo/neomru.vim'
Plugin 'shougo/unite.vim'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/keepcase.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" TODO
" nnoremap <leader>/ <plug>NERDComToggleComment
nnoremap _ ddkp
nnoremap - ddp
nnoremap <CR> o<Esc>

nnoremap sa :w<cr>
noremap YY Yp

inoremap <c-u> <esc>gUiw<esc>i
" TODO consolidate
inoremap jk <esc>
inoremap jj <esc>
inoremap kj <esc>
inoremap kk <esc>
inoremap <esc> <nop>
inoremap <c-t> <esc>hxpa

let mapleader = ","
let maplocalleader = "\\"

nnoremap <leader>w :update<cr>
nnoremap <leader>v :vsplit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <space> Lz<cr>


nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" double ` because it's my tmux prefix key
" BUGGY
" vnoremap <leader>' v``<i'<esc>``>i'
" vnoremap <leader>' <esc>`<i'<esc>`>a'

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>/ 0// <esc>
  autocmd FileType javascript iabbrev <buffer> fn function() {}<Left>
augroup END

augroup filetype_python
  autocmd!
  autocmd FileType python nnoremap <buffer> <leader>/ 0# <esc>
augroup END

augroup filetype_html
  autocmd!
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
  autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

onoremap p i(
