""" Copy and paste from clipboard
vnoremap <Leader>x "+x
noremap <Leader>c "+y
noremap <Leader>v "+gP
cmap <C-v> <C-R>+

""" Autoformat
noremap <Leader>f :Autoformat<CR>

""" Unite
nnoremap <silent> <Leader>b :<C-u>Unite -buffer-name=buffers buffer<CR>
nnoremap <silent> <Leader>o :<C-u>VimFiler<CR>
nnoremap <silent> <leader>p :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <leader>g :<C-u>UniteWithCurrentDir -buffer-name=grep grep<CR>
if has("win32") || has("win64")
  nnoremap <silent> <Leader>t :<C-u>Unite -buffer-name=recursive buffer file_rec<CR>
else
  nnoremap <silent> <Leader>t :<C-u>Unite -buffer-name=recursive buffer file_rec/async:!<CR>
endif

""" Undotree
nnoremap <leader>u :<C-u>:UndotreeToggle<CR>

""" Line movement (Unimpaired and etc)
" Bubble single lines
nmap <A-Up> [e
nmap <A-Down> ]e
" Bubble multiple lines
vmap <A-Up> [egv
vmap <A-Down> ]egv
" Indent
nnoremap <A-Right> >>
nnoremap <A-Left> <<
vnoremap <A-Right> >gv
vnoremap <A-Left> <gv

""" Viewports
nnoremap <silent> <C-Up> :<C-u>wincmd k<CR>
nnoremap <silent> <C-Down> :<C-u>wincmd j<CR>
nnoremap <silent> <C-Right> :<C-u>wincmd l<CR>
nnoremap <silent> <C-Left> :<C-u>wincmd h<CR>
nnoremap <silent> <C-S-Up> :<C-u>ObviousResizeUp<CR>
nnoremap <silent> <C-S-Down> :<C-u>ObviousResizeDown<CR>
nnoremap <silent> <C-S-Left> :<C-u>ObviousResizeLeft<CR>
nnoremap <silent> <C-S-Right> :<C-u>ObviousResizeRight<CR>
nnoremap <silent> <C-=> :<C-u>wincmd =<CR>
nnoremap <silent> <C-w> :<C-u>bw<CR>

noremap <silent> <C-?> :<C-u>ZoomWin<CR>
noremap <silent> <C-BS> :<C-u>ZoomWin<CR>
