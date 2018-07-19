set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'shime/vim-livedown'
Plugin 'junegunn/fzf'
Plugin 'joshdick/onedark.vim'
Plugin 'tpope/vim-repeat'

call vundle#end()
filetype plugin indent on

set nu
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamed
set mouse=a
set backspace=indent,eol,start
set hlsearch

syntax on
colorscheme onedark

" NERDTree
let python_highlight_all=1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
let NerdTreeIgnore=['\.pyc$', '\~$', 'node_modules']
map <C-n> :NERDTreeToggle<CR>

" FZF
map <C-p> :FZF<CR>

" npm install -g livedown
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser = "chrome"
nmap gm :LivedownToggle<CR> :!open -a Google\ Chrome http://localhost:1337<CR>

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile,CursorMoved * match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.html,*.css,*.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set nowrap

au BufNewFile,BufRead *.md
    \ set noswapfile |
    \ set autoread

au FocusGained,CursorHold,CursorMoved *.md checktime
au BufEnter,CursorHoldI,CursorMovedI *.md update

" http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
au Filetype python call TextEnableCodeSnip('sql', "'''", "'''", 'SpecialComment')

function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
    let ft=toupper(a:filetype)
    let group='textGroup'.ft
    if exists('b:current_syntax')
        let s:current_syntax=b:current_syntax
        " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
        " do nothing if b:current_syntax is defined.
        unlet b:current_syntax
    endif
    execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
    try
        execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
    catch
    endtry
    if exists('s:current_syntax')
        let b:current_syntax=s:current_syntax
    else
        unlet b:current_syntax
    endif
    execute 'syntax region textSnip'.ft.'
                \ matchgroup='.a:textSnipHl.'
                \ start="'.a:start.'" end="'.a:end.'"
                \ contains=@'.group
endfunction

