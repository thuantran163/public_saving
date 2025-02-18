"__________________________________________________ COC.vim
"" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300
set signcolumn=no
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set termguicolors
highlight NormalFloat guibg=#3c3c3c guifg=#ffffff
highlight CocFloating guibg=#3c3c3c guifg=#ffffff
highlight Pmenu guibg=#3c3c3c guifg=#c0caf5
highlight PmenuSel guibg=#5c5c5c guifg=#ffffff
"__________________________________________________
call plug#begin('~/.vim/plugged')  " Use ~/.local/share/nvim/plugged for Neovim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set encoding=utf-8
set fileencoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
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

execute pathogen#infect()
"////////////////////////////////////////// MAPPING ///////////////////////////////////////////
vnoremap vy :w! /tmp/vi-clipboard-tmp<CR>
nnoremap vp :r! cat /tmp/vi-clipboard-tmp<CR>
nmap cpwd :execute '!echo ' . shellescape(expand('%:p:h')) . ' >> ~/.bash_history'<CR><CR>
nmap sp :echo "\n".expand('%:p').""<CR>
nmap gp :execute 'silent !echo ' . shellescape(expand('%:p')) . ' >> ~/.bash_history'<CR>:redraw!<CR>
"nmap gp :echo expand('%:p')<CR>
"vnoremap cyy :w  !xclip -selection clipboard<CR><CR>
"nnoremap cpp :r !xclip -selection clipboard -o<CR>
"set clipboard=unnamedplus
vnoremap cyy "+y
nnoremap cpp "+p
inoremap <nowait> jj <Esc>
nnoremap <S-f> <S-j>
nmap <S-j> <C-d>
nmap <S-k> <C-u>
nnoremap <S-u> <S-^>
nmap oo o<Esc>k
nmap OO O<Esc>j
noremap <S-h> <S-Left>
noremap <S-l> <S-Right>
nnoremap <c-z> :u<CR>      "Avoid using this**
inoremap <c-z> <c-o>:u<CR>
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"////////////////////////////////////////// VIM CONFIG ///////////////////////////////////////////
filetype off                  " required
" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
"set softtabstop =4
"set shiftwidth  =4
"set expandtab
filetype indent on
filetype plugin indent on
let NERDTreeShowHidden=1
set omnifunc=ccomplete#CompleteCpp
"filetype on
" Use a line cursor within insert mode and a block cursor everywhere else.
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
colorscheme molokai
"colorscheme afterglow
"////////////////////////////////////////// SETTING ///////////////////////////////////////////
set timeout timeoutlen=300
set clipboard=unnamedplus
"colorscheme koehler
set nocompatible              " be iMproved, required
"line numbering
set number
"set cursorline
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent 
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
set tw=90
"set spell spelllang=en_us
"set foldmethod=indent
set conceallevel=1
"////////////////////////////////////////// INDENTLINE ///////////////////////////////////////////
"let g:indentLine_conceallevel=1
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_color_tty_light = 100 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)
"let g:indentLine_conceallevel = 1
"let g:indentLine_color_term = 097

