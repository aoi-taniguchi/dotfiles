lua require('core.options')

" PLUGIN SETTINGS
let g:python3_host_prog = $VIRTUAL_ENV .. '/bin/python'

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
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-z.nvim'

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

" GitHub integration
Plug 'pwntester/octo.nvim'

" Search and move
Plug 'easymotion/vim-easymotion'

" Markdown
Plug 'dhruvasagar/vim-table-mode'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" For fun
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'

call plug#end()


" Esc SETTINGS
inoremap <C-c> <Esc>

" colorscheme SETTINGS
colorscheme nord

" ultisnips SETTINGS
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsJumpForwardTrigger='<C-b>'
let g:UltiSnipsJunpBackwardTrigger='<C-z>'


let mapleader = " "

lua require('me')

" mfussenegger/nvim-dap
nnoremap <S-h> :lua require('dap').step_out()<CR>
nnoremap <S-l> :lua require('dap').step_into()<CR>
nnoremap <S-j> :lua require('dap').step_over()<CR>
vnoremap <leader>dh :lua require('dap.ui.variables').visual_hover()<CR>

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
    autocmd FileType python,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END
