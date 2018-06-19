set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'w0rp/ale'
Plugin 'craigemery/vim-autotag'
Plugin 'pangloss/vim-javascript'

call vundle#end()
filetype plugin indent on

let python_highlight_all=1
syntax on
set nu
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set fileformat=unix
set encoding=utf-8
set clipboard=unnamed
set mouse=a
set backspace=indent,eol,start
set hlsearch

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile,CursorMoved * match BadWhitespace /\s\+$/

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

let g:ctrlp_custom_ignore='node_modules'
let g:ctrlp_working_path_mode=0

"ale linter
let g:ale_sign_column_always=1
let g:ale_echo_msg_error_str = 'e'
let g:ale_echo_msg_warning_str = 'w'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"https://standardjs.com/
"autocmd bufwritepost *.js silent !standard %
"set autoread

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

let NerdTreeIgnore=['\.pyc$', '\~$', 'node_modules']

map <C-n> :NERDTreeToggle<CR>

