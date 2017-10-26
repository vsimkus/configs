set nocompatible
set term=screen-256color
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'indenthtml.vim'
Bundle 'scrooloose/nerdtree'
Plugin 'elzr/vim-json'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic.git'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'mattn/webapi-vim'
Plugin 'timonv/vim-cargo'
Plugin 'stanangeloff/php.vim'
Plugin 'jistr/vim-nerdtree-tabs.git'
" Powerline fonts needed to get traingles 
" https://github.com/powerline/fonts
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vimwiki/vimwiki'

filetype plugin indent on
set number
syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab 
set smarttab 
set shiftround 
set autoindent 
set smartindent 

set nobackup
set nowritebackup
set noswapfile
set hidden
set autoread

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
set virtualedit+=block

set whichwrap+=<,>,h,l,[,]

colorscheme molokai
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd VimEnter * wincmd p
 
autocmd FileType vimwiki call SetMarkdownOptions()

function! SetMarkdownOptions()
  call VimwikiSet('syntax', 'markdown')
  call VimwikiSet('custom_wiki2html', '$HOME/vimwiki/wiki2html.sh')
endfunction

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
let g:rustfmt_autosave = 1
let g:syntastic_rust_checkers = ['rustc']
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_autofind=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let mapleader=" "
map <Leader>n <plug>NERDTreeTabsToggle<CR>

map <Leader>a gg=G<CR>
map <Leader><Left> :tabprevious<CR>
map <Leader><Right> :tabnext<CR>

let g:vimwiki_list = [{
  \ 'path': '$HOME/vimwiki',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'path_html': '$HOME/vimwiki_html/',
  \ 'template_path': '$HOME/vimwiki/templates',
  \ 'template_default': 'default',
  \ 'template_ext': '.html',
  \ 'custom_wiki2html': '$HOME/vimwiki/wiki2html.sh',
  \ 'custom_wiki2html_args': ''}]

