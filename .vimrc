set secure
call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

set nocompatible

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Line number toggling
function! NumberToggle()
  if(&relativenumber != 1 && &number != 1)
    set number
    highlight LineNr ctermfg=gray
  elseif(&relativenumber != 1 && &number == 1)
    set relativenumber
    highlight LineNr ctermfg=darkgray
  else
    set norelativenumber
    set nonumber
  endif
endfunc
nnoremap <C-m> :call NumberToggle()<CR>
call NumberToggle()

" pdflatex compiling from inside vim
autocmd FileType tex setlocal makeprg=pdflatex\ --shell-escape\ '%'

" markdown config
autocmd BufNewFile,BufRead *.md set filetype=markdown
let g:vim_markdown_folding_disabled = 1

" C++ highlighting config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

" Highlight matches when searching
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR><Space>
