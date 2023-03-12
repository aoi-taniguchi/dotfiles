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
"Plug 'nvim-telescope/telescope.nvim', {'commit': '85d95dfdddba7077257a5fa3eb6dd57caf12579f'}
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.1'}
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-z.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
" needs to be set up
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind.nvim'

" ChatGPT
" Plug 'MunifTanjim/nui.nvim'
" Plug 'jackMort/ChatGPT.nvim'

" indent guide
Plug 'lukas-reineke/indent-blankline.nvim'

" outline
Plug 'stevearc/aerial.nvim'
"Plug 'simrat39/symbols-outline.nvim'

" Snnipet Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Debugger Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'szw/vim-maximizer'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui', {'commit': '85b266e20e45004a86b51f13293129b01e2dcf3b'}

" Tree-sitter (required for nvim-dap-python)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Terminal integration
Plug 'akinsho/toggleterm.nvim', {'tag': '*'}

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-commentary'
Plug 'sindrets/diffview.nvim'

" GitHub integration
Plug 'pwntester/octo.nvim'

" Search and move
Plug 'easymotion/vim-easymotion'

" Markdown
Plug 'dhruvasagar/vim-table-mode'
" this causes an error when using with octo.nvim
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" For fun
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'

call plug#end()


" colorscheme SETTINGS
colorscheme nord

" ultisnips SETTINGS
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsJumpForwardTrigger='<C-b>'
let g:UltiSnipsJunpBackwardTrigger='<C-z>'


let mapleader = " "

lua require('me')

highlight DiffAdd cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#3B4252
highlight DiffDelete cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#3B4252
highlight DiffChange cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#3B4252
highlight DiffText cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=#3B4252

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

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup GROUP1
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
augroup END

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}
augroup END
