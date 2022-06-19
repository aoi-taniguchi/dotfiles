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
set autochdir
set updatetime=300
syntax enable

" PLUGIN SETTINGS
let g:python3_host_prog = '~/work/venv1/bin/python'

call plug#begin('~/.config/nvim/plugged')

" Greeter
Plug 'kyazdani42/nvim-web-devicons'
Plug 'goolord/alpha-nvim'

" Which key
Plug 'folke/which-key.nvim'

" Telescope Plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'commit': '85d95dfdddba7077257a5fa3eb6dd57caf12579f'}
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Coc Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

" Snnipet Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Debugger Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'szw/vim-maximizer'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui', {'commit': '85b266e20e45004a86b51f13293129b01e2dcf3b'}

" Formatter Plugins
Plug 'psf/black'
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}

" Terminal integration
Plug 'akinsho/toggleterm.nvim', {'tag': 'v1.*'}

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-commentary'

" Search and move
Plug 'easymotion/vim-easymotion'

" Markdown
Plug 'dhruvasagar/vim-table-mode'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

" For fun
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tyrannicaltoucan/vim-deep-space'

call plug#end()


" Esc SETTINGS
inoremap <C-c> <Esc>

" SPLIT BORDER SETTINGS
"hi VertSplit cterm=none

" clear highlight search
nnoremap <C-l> :noh<CR>

" splitting vim window
"" :sp[lit] file
"" :vs[plit] file
"" <C-w>s (duplicate horizontally)
"" <C-w>v (duplicate vertically)

" exchanging vim window
"" <C-w>x (exchanging vim window)
"" <C-w>w (switching vim window)

" deep-space SETTINGS
set background=dark
set termguicolors
colorscheme deep-space

" Airline SETTINGS
let g:airline_theme = 'lucius'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ultisnips SETTINGS
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsJumpForwardTrigger='<C-b>'
let g:UltiSnipsJunpBackwardTrigger='<C-z>'


let mapleader = " "

" greeter
nnoremap <leader>a :Alpha<CR>

" which-key
nnoremap <leader>w :WhichKey<CR>

" switching buffer SETTINGS
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>q  :bdelete<CR>

" source init.vim
nnoremap <leader>so :source $MYVIMRC<CR>

" QUICKFIX LIST
nnoremap <leader>co :copen<CR>
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>

" ToggleTerm
nnoremap <silent> <leader>gg :lua lazygit_toggle()<CR>
nnoremap <silent> <leader>hh :lua htop_toggle()<CR>
nnoremap <silent> <leader>pp :lua python_toggle()<CR>

lua require('me')

" Telescope
nnoremap <leader>fe :lua require('telescope').extensions.file_browser.file_browser()<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>lg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>bb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>sd :lua require('me.telescope').search_dotfiles()<CR>
nnoremap <leader>sg :lua require('telescope').extensions.lazygit.lazygit()<CR>

" mfussenegger/nvim-dap
nnoremap <leader>dt :lua require'dap'.toggle_breakpoint()<CR>
"nnoremap <leader>dc :lua require'dap'.clear_breakpoints()<CR>
nnoremap <S-h> :lua require'dap'.step_out()<CR>
nnoremap <S-l> :lua require'dap'.step_into()<CR>
nnoremap <S-j> :lua require'dap'.step_over()<CR>
nnoremap <leader>ds :lua require'dap'.close()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
nnoremap <leader>dk :lua require'dap'.up()<CR>
nnoremap <leader>dj :lua require'dap'.down()<CR>
nnoremap <leader>d_ :lua require'dap'.disconnect();require'dap'.close();require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
"nnoremap <leader>di :lua require'dap.ui.variables'.hover()<CR>
nnoremap <leader>dh :lua require'dap.ui.widgets'.hover()<CR>
vnoremap <leader>dh :lua require'dap.ui.variables'.visual_hover()<CR>
"nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
nnoremap <leader>da :lua require'me.debugHelper'.attach()<CR>
"nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>

" nvim-telescope/telescope-dap.nvim
nnoremap <leader>df :Telescope dap frames<CR>
nnoremap <leader>dc :Telescope dap commands<CR>
nnoremap <leader>db :Telescope dap list_breakpoints<CR>
nnoremap <leader>dv :Telescope dap variables<CR>
nnoremap <leader>dcf :Telescope dap configurations<CR>

" rcarriga/nvim-dap-ui
nnoremap <leader>du :lua require('dapui').toggle()<CR>

" black
nnoremap <leader>k :Black<CR>

" vim-maximizer SETTINGS
nnoremap <leader>m :MaximizerToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
" For vim-table-mode (nnoremap <leader>tm to toggle)
""""""""""""""""""""""""""""""""""""""""""""""""
fun! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfun

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'

""""""""""""""""""""""""""""""""""""""""""""""""
" For coc.nvim (TODO: move these to lua file!)
""""""""""""""""""""""""""""""""""""""""""""""""
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

fun! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfun

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)
""""""""""""""""""""""""""""""""""""""""""""""""

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup GROUP1
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END
