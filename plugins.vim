call plug#begin($VIMHOME . '/plugins')

""" Base
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'wincent/terminus'

""" General
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'vits/ZoomWin'
Plug 'talek/obvious-resize'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'sickill/vim-pasta'
Plug 'svermeulen/vim-easyclip'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'romainl/vim-qf'
Plug 'vim-utils/vim-man'
Plug 'Chiel92/vim-autoformat'
Plug 'EinfachToll/DidYouMean'

""" Languages
Plug 'sheerun/vim-polyglot'
Plug 'lepture/vim-jinja' 

""" Themes
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
