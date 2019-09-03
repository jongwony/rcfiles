set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'junegunn/fzf'
Plugin 'junegunn/vim-easy-align'
Plugin 'joshdick/onedark.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ferrine/md-img-paste.vim'
Plugin 'godlygeek/tabular'
Plugin 'davidhalter/jedi-vim'

call vundle#end()
filetype plugin indent on

set number
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
set cursorcolumn
set cursorline
set shell=zsh\ -l
set nowrap
set splitbelow
set splitright
set completeopt=longest,menuone
set spell spelllang=en_us

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

let python_highlight_all=1
syntax on
colorscheme onedark

set foldmethod=indent
set foldlevel=99

let g:ycm_autoclose_preview_window_after_completion=1

let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules']
map <C-t> :NERDTreeToggle<CR>
map <C-]> :FZF<CR>

nmap cpq :%y+ <Bar> :q!<CR>

highlight clear SpellBad
highlight SpellBad cterm=underline
highlight BadWhitespace ctermbg=red guibg=darkred

au BufRead,BufNewFile,CursorMoved * match BadWhitespace /\s\+$/
au BufNewFile,BufRead *.html,*.css,*.js
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2
au BufNewFile,BufRead *.md
	\ set noswapfile |
	\ set autoread
au FocusGained,CursorHold,CursorMoved *.md checktime
au BufEnter,CursorHoldI,CursorMovedI *md update
au FileType python set equalprg=autopep8\ -
au FileType sql set equalprg=sqlformat\ -r\ -k\ upper\ -

source .vimrc_md_img_paste
source .vimrc_jedi
source .vimrc_special_comment
