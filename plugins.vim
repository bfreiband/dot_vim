call plug#begin($VIMHOME . '/plugins')

""" Base
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-sensible'
Plug 'wincent/terminus'

""" Interface plugins
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'vits/ZoomWin'
Plug 'talek/obvious-resize'
Plug 'mbbill/undotree'

""" Functionality
Plug 'tpope/vim-repeat'
Plug 'sickill/vim-pasta'
Plug 'svermeulen/vim-easyclip'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'

""" Languages
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'kchmck/vim-coffee-script'
Plug 'AndrewRadev/vim-eco'

""" Themes
Plug 'nanotech/jellybeans.vim'

call plug#end()
