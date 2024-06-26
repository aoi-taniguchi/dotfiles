lua require('core.options')
let &colorcolumn=join(range(81,120),",")

" PLUGIN SETTINGS
" TODO: migrate to lazy.nvim
let g:python3_host_prog = $VIRTUAL_ENV .. '/bin/python'

call plug#begin('~/.config/nvim/plugged')

" Greeter
Plug 'kyazdani42/nvim-web-devicons'
Plug 'goolord/alpha-nvim'

" Which key
Plug 'folke/which-key.nvim'

" Nvim session
Plug 'rmagatti/auto-session'

" Noice
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'

" Telescope Plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.4'}
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'cljoly/telescope-repo.nvim'

" Harpoon
Plug 'ThePrimeagen/harpoon'

" Scratchpad
Plug 'metakirby5/codi.vim'

" Trouble
Plug 'folke/trouble.nvim'
Plug 'folke/todo-comments.nvim'

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Formatter
Plug 'stevearc/conform.nvim'

" Snnipet Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'

" ChatGPT
" Plug 'jackMort/ChatGPT.nvim'

" indent guide
Plug 'lukas-reineke/indent-blankline.nvim'

" outline
Plug 'stevearc/aerial.nvim'
"Plug 'simrat39/symbols-outline.nvim'

Plug 'RRethy/vim-illuminate'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

" Task Runner
Plug 'stevearc/overseer.nvim'

" Debugger Plugins
" Plug 'mfussenegger/nvim-dap'
Plug 'aoi-taniguchi/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'szw/vim-maximizer'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'folke/neodev.nvim'

" Terminal integration
Plug 'akinsho/toggleterm.nvim', {'tag': '*'}

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Git integration
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-commentary'
Plug 'debugloop/telescope-undo.nvim'
Plug 'sindrets/diffview.nvim'

" GitHub integration
Plug 'pwntester/octo.nvim'

" Search and move
Plug 'easymotion/vim-easymotion'
Plug 'kevinhwang91/nvim-hlslens'
" this causes unexpected behavior when used with vim-maximizer
" Plug 'petertriho/nvim-scrollbar'

" org mode
Plug 'nvim-neorg/neorg'
Plug 'folke/zen-mode.nvim'

" Markdown
Plug 'dhruvasagar/vim-table-mode'
" this causes an error when used with octo.nvim
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
" Markdown preview with glow
Plug 'ellisonleao/glow.nvim'

" Project root
Plug 'notjedi/nvim-rooter.lua'

" Flutter
Plug 'stevearc/dressing.nvim'
" Plug 'akinsho/flutter-tools.nvim'
Plug 'thosakwe/vim-flutter'
let g:flutter_show_log_on_run = 0
let g:flutter_show_log_on_attach = 0
let g:flutter_split_height = 5
let g:flutter_autoscroll = 1
let g:flutter_close_on_quit = 1

" For fun
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'

call plug#end()


" colorscheme SETTINGS
let g:nord_italic = 1
let g:nord_italic_comments = 1
colorscheme nord

" vimdiff color
hi DiffAdd      gui=none    guifg=NONE    guibg=#00693E
hi DiffChange   gui=none    guifg=NONE    guibg=NONE
hi DiffDelete   gui=none    guifg=NONE    guibg=#262B36
hi DiffText     gui=none    guifg=NONE    guibg=#00693E

" vim-illuminate
hi def IlluminatedWordText gui=reverse
hi def IlluminatedWordRead gui=reverse
hi def IlluminatedWordWrite gui=reverse

" ultisnips SETTINGS
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsJumpForwardTrigger='<C-b>'
let g:UltiSnipsJumpBackwardTrigger='<C-z>'


let mapleader = " "

lua require('me')

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

fun! DiffviewOpenWithArgs()
    call inputsave()
    let args = input("input args: ")
    call inputrestore()
    execute ":DiffviewOpen ".args
endfun

fun! DiffviewFileHistoryWithArgs()
    call inputsave()
    let args = input("input args: ")
    call inputrestore()
    execute ":DiffviewFileHistory ".args
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
