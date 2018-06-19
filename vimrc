set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'xuyuanp/nerdtree-git-plugin'

Plugin 'w0rp/ale'
Plugin 'valloric/youcompleteme'
Plugin 'craigemery/vim-autotag'

Plugin 'nvie/vim-flake8'

Plugin 'pangloss/vim-javascript'

call vundle#end()
filetype plugin indent on

let NerdTreeIgnore=['\.pyc$', '\~$', 'node_modules']
let g:ctrlp_custom_ignore='node_modules'
let g:ctrlp_working_path_mode=0

"iterm2 on osx insert mode caret
"http://vim.wikia.com/wiki/change_cursor_shape_in_different_modes
let &t_SI = "\<esc>]50;CursorShape=1\x7"
let &t_SR = "\<esc>]50;CursorShape=2\x7"
let &t_EI = "\<esc>]50;CursorShape=0\x7"

"ale linter
let g:ale_sign_column_always=1
let g:ale_echo_msg_error_str = 'e'
let g:ale_echo_msg_warning_str = 'w'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


set nu
syntax on
colorscheme onedark
set backspace=indent,eol,start
set encoding=utf-8
set mouse=a
set hlsearch

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile,CursorMoved * match BadWhitespace /\s\+$/

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set textwidth=79
set autoindent
set fileformat=unix

au BufNewFile,BufRead *.html,*.css,*.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set nowrap

au BufNewFile,BufRead *.md,*.markdown
    \ set noswapfile |
    \ set linespace=4 |
    \ set textwidth=60 |
    \ set filetype=markdown |
    \ set nowrap |
    \ set autoread

au FocusGained,CursorHold,CursorMoved *.md,*.markdown checktime
au BufEnter,CursorHoldI,CursorMovedI *.md,*.markdown update

"https://standardjs.com/
"autocmd bufwritepost *.js silent !standard %
"set autoread

map <C-n> :NERDTreeToggle<CR>

