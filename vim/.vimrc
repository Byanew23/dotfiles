set number relativenumber
colorscheme pablo

set hlsearch

set ruler

" ignore case for searching ecscept if its all caps
set ignorecase
set smartcase

syntax on

" Add the Ctrl-P pluggin
" If not intalled get it from http://kien.github.io/ctrlp.vim/
set runtimepath^=~/.vim/bundle/ctrlp.vim

"Map Ctr-F to open Ctrl-P
map <C-F> :CtrlP<CR>

"Show hidden files
let g:ctrlp_show_hidden = 1

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
call plug#begin()

"For markdown preview (Type MarkdownPreviewStart)
Plug 'iamcco/markdown-preview.vim'

"For autocomplete
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
call plug#end()

" Close the preview box after completion
let g:ycm_autoclose_preview_window_after_completion = 1

" Keybinds for tabs
nnoremap tn :tabnew<Space>

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
