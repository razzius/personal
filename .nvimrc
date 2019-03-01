syntax on

set smarttab
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set laststatus=2
set autoread
set shell=/bin/sh
set splitbelow
set cursorline
set paste

autocmd BufNewFile,BufRead * set formatoptions-=cro
set incsearch
set iskeyword-=_

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let g:airline_powerline_fonts = 1

set undofile
set undodir=~/.vim/undo//
set nobackup
set noswapfile
" set backupdir=~/.nvim/backup//
" set directory=~/.nvim/swap//

set history=200
set number
set numberwidth=3
set relativenumber
set scrolloff=4

call plug#begin('~/.vim/plugged')
" Plug 'shougo/neocomplete.vim'
Plug 'pangloss/vim-javascript'
Plug 'shougo/unite.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/keepcase.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'valloric/MatchTagAlways'
Plug 'mustache/vim-mustache-handlebars'
Plug 'chrisbra/improvedft'
Plug 'jiangmiao/auto-pairs'
Plug 'millermedeiros/vim-esformatter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/vim-peekaboo'
Plug 'trusktr/seti.vim'
Plug 'rking/ag.vim'
" Plug 'mhinz/vim-startify'
Plug 'kshenoy/vim-signature'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
" TODO make changing to root manual
" Plug 'airblade/vim-rooter'
" Requires lua support
" Plug 'Shougo/neocomplete.vim'

" Plug 'valloric/YouCompleteMe'
" Plug 'kana/vim-textobj-user'
call plug#end()

" colorscheme seti

let g:airline_extensions = []
let g:UltiSnipsExpandTrigger="<tab>"
let g:mustache_abbreviations = 1

" TODO
let g:html_indent_inctags = "template"

" TODO
" nnoremap <leader>/ <plug>NERDComToggleComment
nnoremap _ ddkp
nnoremap - ddp
nnoremap j gj
nnoremap k gk
nnoremap LL Lzz
nnoremap HH Hzz
nnoremap Y y$
nnoremap YY Yp

inoremap <c-u> <esc>gUiw<esc>i
inoremap <c-t> <esc>hxpa
inoremap kj <esc>

let mapleader = "\<Space>"
let maplocalleader = "\\"

" nnoremap <leader>j o<Esc>
" nnoremap <leader>k O<Esc>
nnoremap <leader>w :write<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>v :vsplit $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>o :call fzf#run({'sink': 'tabe'})<cr>
nnoremap <leader>js :exec ':vsp ' . GetJSName()<cr>
nnoremap <leader>ht :exec ':vsp ' . GetHTMLName()<cr>
nnoremap <leader>i :source $MYVIMRC<cr>:PlugInstall<cr>
nnoremap <leader><space> i<space><esc>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" TODO noremap
xmap ' S'
" TODO fix text object so this is not necessary
" nnoremap djk V%d

" double ` because it's my tmux prefix key
" BUGGY
" vnoremap <leader>' v``<i'<esc>``>i'
" vnoremap <leader>' <esc>`<i'<esc>`>a'
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <Leader>y "*y
vnoremap <Leader>y "*y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>P "*P

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

onoremap p i(

autocmd FocusGained,BufEnter * :silent! !

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>/ 0// <esc>
  autocmd FileType javascript iabbrev <buffer> fn function() {}<Left>
  " autocmd BufWritePre * :call JSFormat()
  autocmd FileType javascript autocmd BufWritePre <buffer> :call JSFormat()
augroup END

augroup auto_format
  autocmd!
  " autocmd FileType javascript BufWritePre <buffer> :silent !esformatter -i %
augroup END

" autocmd FileType javascript BufWritePre <buffer> :Esformatter %

augroup filetype_python
  autocmd!
  autocmd FileType python nnoremap <buffer> <leader>/ 0# <esc>
augroup END

augroup filetype_html
  autocmd!
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
  " TODO fix indent
  autocmd FileType html inoremap <buffer> </ </<C-X><C-O>
  " TODO fix beautify html to handle {{tag}} \n {{tag}}
  " autocmd FileType html autocmd BufWritePre <buffer> :call HTMLFormat()
augroup END

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | FZF! | endif

function! EnterOrIndentTag()
  let line = getline(".")
  let col = getpos(".")[2]
  let before = line[col-2]
  let after = line[col-1]

  if before == ">" && after == "<"
    return "\<Enter>\<C-o>O"
  endif
  return "\<Enter>"
endfunction

inoremap <expr> <Enter> EnterOrIndentTag()
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" <div class="hi mom">
" </div>
" autocmd User Startified let &l:stl = 'this is cool'

" call textobj#user#plugin('json', {
" \   'regex_j': {
" \     'select': 'ak',
" \     '*pattern*': '^\s*"\?\w\+"\?\s*:\s*{\_[^}]*}.*\n\?',
" \   },
" \ })

function! JSFormat()
  " Preparation: save last search, and cursor position.
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')
  let fileWorkingDirectory = expand('%:p:h')
  let currentWorkingDirectory = getcwd()
  execute ':lcd' . fileWorkingDirectory
  execute ':silent' . '%!esformatter'
  if v:shell_error
    undo
    "echo "esformatter error, using builtin vim formatter"
    " use internal formatting command
    execute ":silent normal! gg=G<cr>"
  endif
  " Clean up: restore previous search history, and cursor position
  execute ':lcd' . currentWorkingDirectory
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction

function! HTMLFormat()
  " Preparation: save last search, and cursor position.
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')
  let fileWorkingDirectory = expand('%:p:h')
  let currentWorkingDirectory = getcwd()
  execute ':lcd' . fileWorkingDirectory
  execute ':silent' . '%!html-beautify -f -'
  if v:shell_error
    undo
    "echo "esformatter error, using builtin vim formatter"
    " use internal formatting command
    execute ":silent normal! gg=G<cr>"
  endif
  " Clean up: restore previous search history, and cursor position
  execute ':lcd' . currentWorkingDirectory
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction

function! GetJSName()
  let l:filename = expand('%:p')
  " TODO generic filetype
  return substitute(l:filename, '.html', '.js', '')
endfunction

function! GetHTMLName()
  let l:filename = expand('%:p')
  " TODO generic filetype
  return substitute(l:filename, '.js', '.html', '')
endfunction

