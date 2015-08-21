syntax on

" set foldmethod=syntax
set lazyredraw
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set formatoptions-=c
set gdefault
set history=200
set hlsearch
set ignorecase
set incsearch
set infercase
set iskeyword-=_
set laststatus=2
set linebreak
set mouse=a
set nobackup
set nomodeline
set noswapfile
set number
set numberwidth=3
set relativenumber
set scrolloff=3
set shell=/bin/sh
set shiftwidth=2
set shortmess+=I
set showcmd
set smartcase
set smarttab
set softtabstop=2
set splitbelow
set splitbelow
set splitright
set tabstop=2
set undodir=~/.vim/undo//
set undofile
set virtualedit=onemore
set wildmenu
set wildmode=longest:list,full

let &showbreak = '> '
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let g:airline_powerline_fonts = 1

call plug#begin('~/.vim/plugged')
Plug 'shougo/neocomplete.vim'
Plug 'shougo/neosnippet.vim'
Plug 'pangloss/vim-javascript'
" Plug 'shougo/unite.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/keepcase.vim'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'valloric/MatchTagAlways'
Plug 'mustache/vim-mustache-handlebars'
Plug 'chrisbra/improvedft'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/vim-peekaboo'
Plug 'trusktr/seti.vim'
Plug 'rking/ag.vim'
" Plug 'mhinz/vim-startify'
Plug 'kshenoy/vim-signature'
" Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'tmhedberg/matchit'
Plug 'wincent/Command-T', {'do': 'cd ruby/command-t; ruby extconf.rb; make'}
" TODO better html linter
" Plug 'scrooloose/syntastic'
" TODO make changing to root manual
" Plug 'airblade/vim-rooter'
" Requires lua support
" Plug 'valloric/YouCompleteMe'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

colorscheme seti

let g:airline_extensions = []
let g:ag_working_path_mode="r"
let g:mustache_abbreviations = 1
let g:neocomplete#enable_at_startup = 1
let g:neosnippet#disable_runtime_snippets = {'_': 1}
let g:neosnippet#snippets_directory='~/.vim/neosnippets'
let g:CommandTWildIgnore="node_modules"
let g:CommandTMaxHeight=20
let g:CommandTAcceptSelectionMap='<C-j>'
let g:CommandTSelectNextMap=['<C-n>', 'Down']
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>
" TODO
" let g:syntastic_html_tidy_exec = 'tidy'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>"
\: emmet#isExpandable() ? "\<Plug>(emmet-expand-abbr)"
\: "\<TAB>"

" let g:html_indent_inctags = "template"

nnoremap _ ddkP
nnoremap - ddp
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap LL Lzz
nnoremap HH Hzz
nnoremap Y y$
nnoremap YY Yp

inoremap <c-t> <esc>hxpa
inoremap kj <esc>
inoremap <space><space> <esc>

let mapleader = "\<Space>"
let maplocalleader = "\\"

nnoremap <leader>w :write<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>v :vsplit $MYVIMRC<cr>
nnoremap <leader>o :put<cr>
nnoremap <leader>O :put *<cr>
nnoremap <leader>j :exec ':vsp ' . GetFileExtension('js')<cr>
nnoremap <leader>h :exec ':vsp ' . GetFileExtension('html')<cr>
nnoremap <leader>c :exec ':vsp ' . GetFileExtension('css')<cr>
nnoremap <leader>i :source $MYVIMRC<cr>:PlugInstall<cr>
nnoremap <leader><space> i<space><esc>
nnoremap <leader>n :NeoSnippetEdit<cr>
nnoremap <leader>, A,<cr><cr>
nnoremap <leader>. @:<cr> " repeat last ex command
nnoremap <leader>x :execute getline('.')<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>T :vs#<cr>
" TODO
" nnoremap <leader>a 'PoPlug '<esc>"*pa'<esc>
nnoremap <leader>a :Ag<space>
nnoremap <leader>A :Ag<space><c-r><c-w><cr>
nnoremap <leader>C :ccl<cr>

xnoremap ' v`<i'<esc>`>la'<esc>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <Leader>y "*y
vnoremap <Leader>y "*y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>P "*P

" emacs command-line motions
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

onoremap p i(

autocmd FocusGained,BufEnter * :silent! !
autocmd InsertLeave * update


" todo
" autocmd FocusLost * :wa

augroup filetype_css
  autocmd!
  autocmd FileType css autocmd BufWritePre <buffer> :call Format('cssfmt')
augroup END

augroup filetype_javascript
  autocmd!
  " TODO stdin error
  autocmd FileType javascript autocmd BufWritePre <buffer> :call Format('esformatter')
  autocmd FileType javascript xnoremap <buffer> V $%
augroup END

augroup auto_format
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup filetype_python
  autocmd!
  " autocmd FileType python nnoremap <buffer> <leader>/ 0# <esc>
augroup END

augroup filetype_html
  autocmd!
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
  " TODO fix indent
  autocmd FileType html inoremap <buffer> </ </<C-X><C-O>
  autocmd FileType html xnoremap <buffer> V at
  " TODO fix beautify html to handle {{tag}} \n {{tag}}
  " autocmd FileType html autocmd BufWritePre <buffer> :call Format('html-beautify -f -')
  nnoremap <Leader>f :call Format('html-beautify -f -')<cr>
augroup END

" autocmd StdinReadPre * let s:std_in=1

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

function! Format(formatter)
  " Preparation: save last search, and cursor position.
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')
  let fileWorkingDirectory = expand('%:p:h')
  let currentWorkingDirectory = getcwd()
  execute ':lcd' . fileWorkingDirectory
  execute ':silent' . '%!' . a:formatter
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

function! GetFileExtension(extension)
  let l:filename = expand('%:p')
  return substitute(l:filename, '\..\{2,4\}$', '.' . a:extension, '')
endfunction

function! Capitalize(string)
  return toupper(a:string[0]) . a:string[1:]
endfunction

function! FilenameToMixed(filename)
  " Turns a filename like add_cat.js to addCat
  "
  " Throw away the extension
  let l:fileNoExt = substitute(a:filename, '\..\{2,4\}$', '', '')

  let l:words = split(l:fileNoExt, '_')
  let l:mixedCaseWords = [words[0]]
  let l:wordsToCapitalize = words[1:]
  for word in l:wordsToCapitalize
    call add(l:mixedCaseWords, Capitalize(word))
  endfor

  return join(l:mixedCaseWords, '')

endfunction

