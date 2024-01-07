
vim.cmd [[
call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'rose-pine/neovim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'theprimeagen/harpoon'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
Plug 'puremourning/vimspector'
Plug 'aserowy/tmux.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'dense-analysis/neural'
Plug 'muniftanjim/nui.nvim'
Plug 'elpiloto/significant.nvim'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'EdenEast/nightfox.nvim'

call plug#end()
]]
