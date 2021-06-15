scriptencoding utf-8

set fenc=utf-8
set autoindent
set showcmd

set hlsearch
set incsearch
set ignorecase

set nobackup
set noswapfile
set autoread

set relativenumber
set nu
set guicursor=
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hidden
set noerrorbells
set nowrap
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set showmatch
set laststatus=2
set wildmode=list:longest
syntax enable

" NERDTree SETTINGS
nmap <C-f> :NERDTreeToggle<CR>
let g:airline#extensions#tabline#enabled = 1
let NERDTreeShowHidden=1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" Airline SETTINGS
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

"vim-maximizer SETTINGS
let g:maximizer_default_mapping_key = '<C-m>'

" Esc SETTINGS
inoremap <C-c> <Esc>

"/// SPLIT BORDER SETTINGS
hi VertSplit cterm=none
