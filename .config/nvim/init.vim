set path+=**

" Nice menu and autocompletion
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=**/.git/*

let g:airline#extensions#tabline#enabled = 1
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

" PLUGIN SETTINGS
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'puremourning/vimspector'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'preservim/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'szw/vim-maximizer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
call plug#end()

" deep-space SETTINGS
set background=dark
set termguicolors
colorscheme deep-space

let mapleader = " "

" switching buffer SETTINGS
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>q  :bdelete<CR>
nnoremap <leader>ls :ls<CR>

" splitting vim window
"" :sp[lit] file
"" :vs[plit] file
"" <C-w>s (duplicate horizontally)
"" <C-w>v (duplicate vertically)

" exchanging vim window
"" <C-w>x (exchanging vim window)
"" <C-w>w (switching vim window)

" open explore in lhs of current buffer
nnoremap <leader>e :Lexplore<CR>

" source init.vim
nnoremap <leader>so :source $MYVIMRC<CR>

" QUICKFIX LIST
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>

" TELESCOPE SETTINGS
lua require('main')
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').file_browser{hidden=true}<CR>
nnoremap <leader>sd :lua require('main.telescope').search_dotfiles()<CR>

" NETRW SETTINGS
let g:netrw_liststyle=3
let g:netrw_preview=1
let g:netrw_banner=0

" NERDTree SETTINGS
""nnoremap <leader>n :NERDTreeToggle<CR>
""let NERDTreeShowHidden=1
""let NERDTreeMinimalUI=1

" Airline SETTINGS
let g:airline_theme = 'lucius'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-maximizer SETTINGS
"!This will cause enter-not-working issue
"let g:maximizer_default_mapping_key = '<C-m>'

" Esc SETTINGS
inoremap <C-c> <Esc>

" SPLIT BORDER SETTINGS
"hi VertSplit cterm=none

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup GROUP1
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

