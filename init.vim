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
set clipboard=unnamedplus
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
"set breakat=\ |@-+;,./?^I
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

"" Color
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

if executable('rg')
  let g:unite_source_rec_async_command=['rg', '--files', '--no-messages', '-L']
  let g:unite_source_grep_command='rg'
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
      \ '\/node_modules\/',
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

" vim-go
" temp disable as it doesn't seem to be getting the path correctly since
" updating
let g:go_fmt_autosave = 0

let g:rust_recommended_style = 1
" autoformat
if executable("rustfmt")
  let g:formatdef_rustfmt = '"rustfmt"'
  let g:formatters_rust = ['rustfmt']
endif

" nginx
au BufRead,BufNewFile nginx.conf,*/nginx.d/*.conf if &ft == '' | setfiletype nginx | endif 

" Jinga templates (for tera)
au BufNewFile,BufRead *.tera set ft=jinja

"" Terminal specific stuff

if has("gui_running")
  set encoding=utf8
  set lines=40 columns=100 linespace=0

  if has("win32")
    if !empty($USERDOMAIN) && $USERDOMAIN =~ "Lethe"
      set guifont=InputMonoNarrow:h10
    else
      set guifont=InputMonoNarrow:h11
    endif
  else
    if !empty($HOSTNAME) && $HOSTNAME =~ "Lethe"
      set guifont=Input\ Mono\ Narrow\ 12
    else
      set guifont=Input\ Mono\ Narrow\ 11
    endif
  endif
  set guioptions-=T
  set guioptions-=m
  set guioptions-=e

  set mousemodel=popup
  set winaltkeys=no

  set spell
  set spelllang=en_us
else
  if &term =~ "xterm"
    set termencoding=utf8
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
    colo default
    " Dont load terminus
    let g:TerminusLoaded=1
    let g:airline_powerline_fonts=0
  endif
endif
