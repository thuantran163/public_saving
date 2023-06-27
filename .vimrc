execute pathogen#infect()
set conceallevel=1
let g:indentLine_conceallevel=1

vnoremap cyy "+y
nnoremap cpp "+p
inoremap <nowait> jj <Esc>
nnoremap <S-f> <S-j>
nmap <S-j> <C-d>
nmap <S-k> <C-u>

nnoremap <S-u> <S-^>
nmap oo o<Esc>k
nmap OO O<Esc>j
noremap <S-h> b
noremap <S-l> w
set cursorline
"
set timeout timeoutlen=300

"colorscheme koehler

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'udalov/kotlin-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
set tabstop     =4
"set softtabstop =4
"set shiftwidth  =4
"set expandtab

set number
filetype plugin indent on
filetype indent on
"filetype on

set hlsearch

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
filetype plugin indent on
syntax on
colorscheme molokayo
"line numbering
set number
set cursorline
set tabstop=2
set softtabstop=2
set expandtab
set showcmd
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>
set foldmethod=syntax   
set foldnestmax=10
set nofoldenable
set foldlevel=2

set foldmethod=indent
nnoremap <c-z> :u<CR>      " Avoid using this**
inoremap <c-z> <c-o>:u<CR>

"//////////////////////////////////////////INDENTLINE///////////////////////////////////////////
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_tty_light = 100 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_conceallevel = 1
let g:indentLine_color_term = 097

