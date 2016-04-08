let $VIMHOME=expand('<sfile>:p:h')

set nocompatible

filetype plugin indent on
syntax on

runtime plugins.vim
runtime keybinds.vim

set backupdir=$VIMHOME/files/backup
set directory=$VIMHOME/files/swap
set viminfo='100,n$VIMHOME/files/viminfo

set encoding=utf8

set ffs=unix,dos
set clipboard=unnamed
set nobackup
set nowritebackup
set hidden

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set backspace=indent,eol,start

set wrap
set linebreak
set breakat=\ |@-+;,./?^I
set showbreak=~>

set ignorecase
set smartcase

set nohls
set title
set visualbell
set shortmess=atI
set laststatus=2
set modeline
set display=lastline

set ttyfast

set showmode
set showcmd

""" Color
let g:jellybeans_use_lowcolor_black=1
set background=dark
colorscheme jellybeans

hi SpellBad cterm=none ctermbg=88 gui=underline guibg=#401010 guisp=Red
hi SpellCap cterm=none ctermbg=20 gui=underline guibg=#000040 guisp=Blue
hi SpellRare cterm=none ctermbg=53 gui=underline guibg=#310041 guisp=Magenta
hi SpellLocal cterm=none ctermbg=23 gui=underline guibg=#003020 guisp=Cyan
hi Cursor guifg=black guibg=grey

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
endfunction

autocmd FileType unite call s:unite_settings()

let g:unite_force_overwrite_statusline=0

if executable('pt')
  let g:unite_source_rec_async_command=['pt', '--nogroup', '--nocolor', '-l', '.']
  let g:unite_source_grep_command='pt'
  let g:unite_source_grep_default_opts='-i --nogroup --nocolor'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ag')
  let g:unite_source_rec_async_command=['ag', '--vimgrep', '-l', '.']
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='-i --vimgrep'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_rec_async_command=['ack', '--follow', '--nocolor', '--nogroup', '-f']
endif

call unite#custom#profile('default', 'context', {
      \ 'start_insert': 1,
      \ 'short_source_names': 1,
      \ 'wipe': 1,
      \})

call unite#custom#source('file_rec', 'ignore_pattern', join([
      \ '\/target\/',
      \ '\/vendor\/',
      \ '\/pkg\/',
      \], '\|'))
call unite#filters#matcher_default#use([
      \ 'matcher_hide_hidden_files',
      \ 'matcher_fuzzy',
      \])
call unite#filters#sorter_default#use(['sorter_selecta'])

" Terminus
let g:TerminusBracketedPaste=0

" Easyclip
let g:EasyClipUseSubstituteDefaults=1
let g:EasyClipAutoFormat=1

" VimFiler
autocmd FileType vimfiler nmap <silent><buffer> <2-LeftMouse> <Plug>(vimfiler_smart_l)

""" Terminal specific stuff

if has("gui_running")
  set lines=40 columns=100 linespace=0

  if !empty($USERDOMAIN) && $USERDOMAIN =~ "Lethe"
    set guifont=InputMonoNarrow:h10
  else
    set guifont=Input\ Mono\ Narrow\ 12
  endif
  set guioptions-=T
  set guioptions-=m
  set guioptions-=e

  set mousemodel=popup
  set winaltkeys=no

  set spell
  set spelllang=en_us
else
  if !empty($CONEMUANSI)
    set termencoding=utf8
    set term=xterm

    set t_ti=
    set t_kb=<C-Del>

    let g:TerminusCursorShape=0
    let g:jellybeans_use_term_background_color=1

    set t_Co=256

    let g:airline_powerline_fonts=0
  else
    set term=$TERM
  endif
  
  " The term stuff here will likely need to be expanded on
  if &term =~ "xterm"
    if has('terminfo')
      let &t_Sf="\e[3%p1%dm"
      let &t_Sb="\e[4%p1%dm"
    else
      let &t_Sf="\e[3%dm"
      let &t_Sb="\e[4%dm"
    endif

    set ttymouse=xterm2
    exe "set t_te=" . &t_te . &t_op

    set t_Co=256
  else
    let g:TerminusCursorShape=0
    let g:jellybeans_use_term_background_color=1
    let g:airline_powerline_fonts=0
    set termencoding=utf8
  endif

endif

filetype plugin indent on
syntax enable
