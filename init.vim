let $VIMHOME=expand('<sfile>:p:h')

set nocompatible

runtime plugins.vim
runtime keybinds.vim

syntax enable
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf8
set t_Co=256

set backspace=2
set nohls
set ignorecase
set smartcase
set hidden
set title
set shortmess=atI
set laststatus=2
set visualbell
set cursorline
set modeline
set modelines=10

set wrap
set linebreak
set breakat=\ |@-+;,./?^I
set showbreak=~>\ 

set nobackup
set nowritebackup

set background=dark

colorscheme jellybeans
hi SpellBad term=reverse cterm=underline ctermbg=88 gui=underline guibg=#401010 guisp=Red
hi SpellCap term=reverse cterm=underline ctermbg=20 gui=underline guibg=#000040 guisp=Blue
hi SpellRare term=reverse cterm=underline ctermbg=53 gui=underline guibg=#310041 guisp=Magenta
hi SpellLocal term=underline cterm=underline ctermbg=23 gui=underline guibg=#003020 guisp=Cyan
highlight Cursor guifg=black guibg=grey

if has("gui_running")
  set spell
  set spelllang=en_us
  set guioptions-=T
  set guioptions-=m
  set guioptions-=e
  set winaltkeys=no
  set clipboard=unnamed
  set mousemodel=popup 

  set guifont=Input\ Mono\ Narrow\ Regular\ 11
endif

""" Plugin related settings
" Vimfiler
let g:vimfiler_as_default_explorer=1

" Airline
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Unite
if executable('ag')
  let g:unite_source_rec_async_command=['ag', '--search-files', '--follow', '--nocolor', '--nogroup', '-g', '']
elseif executable('ack')
  let g:unite_source_rec_async_command=['ack', '--follow', '--nocolor', '--nogroup', '-f']
endif
call unite#custom#profile('files', 'filters', 'sorter_rank')

" Terminus
let g:TerminusBracketedPaste=0
