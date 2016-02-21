let $VIMHOME=expand('<sfile>:p:h')

set nocompatible

runtime plugins.vim
runtime keybinds.vim

syntax enable
filetype plugin indent on

set clipboard=unnamed
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
  set mousemodel=popup 
  "set lines=40 columns=100

  set guifont=InputMonoNarrow:h10
endif

""" Plugin related settings
" Vimfiler
let g:vimfiler_as_default_explorer=1

" Airline
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Unite
function! s:unite_settings()
  setlocal noswapfile undolevels=-1
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

autocmd FileType unite call s:unite_settings()

let g:unite_enable_start_insert = 1
let g:unite_force_overwrite_statusline = 0
"let g:unite_enable_auto_select = 1

if executable('ag')
  let g:unite_source_rec_async_command=['ag', '--vimgrep', '-l', '.']
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='-i --vimgrep'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_rec_async_command=['ack', '--follow', '--nocolor', '--nogroup', '-f']
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Terminus
let g:TerminusBracketedPaste=0

" Easyclip
let g:EasyClipUseSubstituteDefaults=1
let g:EasyClipAutoFormat=1

if !has("gui_running") && !empty($CONEMUANSI)
  set term=pcansi
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  set bs=indent,eol,start
  let g:TerminusCursorShape=0
  let g:airline_powerline_fonts=0
endif
