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
" Debugger Plugins
"Plug 'puremourning/vimspector'
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'szw/vim-maximizer'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'preservim/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
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

lua require('main')
" TELESCOPE SETTINGS
nnoremap <leader>tg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>tf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>tb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>te :lua require('telescope.builtin').file_browser{hidden=true}<CR>
nnoremap <leader>td :lua require('main.telescope').search_dotfiles()<CR>

" mfussenegger/nvim-dap
nnoremap <leader>dt :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <S-h> :lua require'dap'.step_out()<CR>
nnoremap <S-l> :lua require'dap'.step_into()<CR>
nnoremap <S-j> :lua require'dap'.step_over()<CR>
nnoremap <leader>ds :lua require'dap'.stop()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <leader>dk :lua require'dap'.up()<CR>
nnoremap <leader>dj :lua require'dap'.down()<CR>
nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
"nnoremap <leader>di :lua require'dap.ui.variables'.hover()<CR>
nnoremap <leader>dh :lua require'dap.ui.widgets'.hover()<CR>
vnoremap <leader>dh :lua require'dap.ui.variables'.visual_hover()<CR>
"nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
nnoremap <leader>da :lua require'main.debugHelper'.attach()<CR>
"nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>

" nvim-telescope/telescope-dap.nvim
nnoremap <leader>df :Telescope dap frames<CR>
nnoremap <leader>dc :Telescope dap commands<CR>
nnoremap <leader>db :Telescope dap list_breakpoints<CR>
nnoremap <leader>dv :Telescope dap variables<CR>
nnoremap <leader>dcf :Telescope dap configurations<CR>

" rcarriga/nvim-dap-ui
nnoremap <leader>du :lua require('dapui').toggle()<CR>

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

