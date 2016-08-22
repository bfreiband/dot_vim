call plug#begin($VIMHOME . '/plugins')

""" Base
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-sensible'
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

""" Languages
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'tikhomirov/vim-glsl'
Plug 'kchmck/vim-coffee-script'
Plug 'AndrewRadev/vim-eco'
Plug 'PProvost/vim-ps1'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'

""" Themes
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
