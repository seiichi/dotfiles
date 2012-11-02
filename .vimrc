" General {{{
set nocompatible                  " be iMproved

set history=256
set clipboard+=unnamed            " yanks go on clipboard instead
set title                         " title of the terminal window

set nobackup
set nowritebackup

set modeline
set modelines=5

let g:is_posix = 1                " to use modern shell
let mapleader = ','

set tags=./tags;$HOME
" }}}

" Formatting {{{
set formatoptions=tcroqB

set textwidth=0

set backspace=indent,eol,start

set autoindent
au FileType c set cindent
set indentkeys-=0#                " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case
"}}}

" Search {{{
set incsearch                     " incremental search
set hlsearch                      " highlight search
set smartcase                     " i don't like ignorecase

" make search results appear in the middle of the screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
"}}}

" Encoding {{{
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,iso-2022-jo,us_ascii,sjis,eus-jp
set ambiwidth=double
"}}}

" Visual {{{
syntax on
colorscheme default

set mouse=a
set mousehide                     " hide mouse after chars typed

"set number
map <silent> <leader>N :set invnumber<CR>

" list
set list
set listchars=tab:>-
set listchars+=trail:=
"set listchars+=eol:¬
set listchars+=extends:»,precedes:«
map <silent> <leader>L :set invlist<CR>

" status line
set laststatus=2
set statusline=%<%f\              " custom statusline
set stl+=[%{&ff}]                 " show fileformat
set stl+=[%{&fileencoding}]       " show fileencoding
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P
"}}}

" Folding {{{
set foldenable
set foldmethod=marker             " fold on the marker ({{{ ... }}})
set foldlevel=100                 " disable autofold

set foldopen=block,hor,tag
set foldopen+=percent,mark
set foldopen+=quickfix
"}}}

" FileType {{{
au FileType javascript set expandtab ts=4 sw=4 sts=4
au FileType ruby set expandtab ts=2 sw=2 sts=2
au FileType perl set expandtab ts=2 sw=2 sts=2
au FileType python set expandtab ts=5 sw=4 sts=4
au FileType sh set expandtab ts=2 sw=2 sts=2
au FileType css set expandtab ts=2 sw=2 sts=2
au FileType htmlcheetah set expandtab ts=2 sw=2 sts=2
au FileType html set expandtab ts=2 sw=2 sts=2
au FileType xhtml set expandtab ts=2 sw=2 sts=2
au FileType vim set expandtab ts=2 sw=2 sts=2

" 80 column layout - http://vim-users.jp/2011/05/hack217/
if exists('&colorcolumn')
  au FileType sh,c,python,javascript,php setlocal colorcolumn=+1 tw=80
endif
"}}}

" reload firefox {{{
if has('python')
  function! FirefoxReload()
python << EOF
import telnetlib
t = telnetlib.Telnet('localhost', 4242)
t.read_until('repl>', 2)
t.write('content.location.reload(true)\nrepl.quit()')
t.close()
EOF
  endfunction
  nmap <silent> <leader>r :call FirefoxReload()<CR>
endif
"}}}

