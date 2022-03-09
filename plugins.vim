call plug#begin('~/.config/nvim/plugged')

" nvim lsp
Plug 'neovim/nvim-lspconfig'

" lsp auto complete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" add icon for autocomplete menu
Plug 'onsails/lspkind-nvim'

" lsp signature help on type
Plug 'ray-x/lsp_signature.nvim'

" lsp saga
Plug 'tami5/lspsaga.nvim'

" finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" auto bracket closer
Plug 'windwp/nvim-autopairs'

" show buffers
Plug 'akinsho/bufferline.nvim'

" theme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim' " disabled due to highlight signature
Plug 'EdenEast/nightfox.nvim'
Plug 'ray-x/aurora'
Plug 'mhartington/oceanic-next'
Plug 'jacoborus/tender.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'arcticicestudio/nord-vim'

" buffers
Plug 'hoob3rt/lualine.nvim'

" file explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" comment
Plug 'numToStr/Comment.nvim'

" indent
Plug 'lukas-reineke/indent-blankline.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim' " show changes in right of editor
Plug 'kdheepak/lazygit.nvim'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter' " run :TSUpdate later to update treesitter, for unknown reason it stuck when installing plugin

" symbol outline - tree of symbols on the right hand of your neovim
Plug 'simrat39/symbols-outline.nvim'

" hint for neovim commands
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" which key
Plug 'folke/which-key.nvim'

" trouble - diagnostic list
Plug 'folke/trouble.nvim'

" markdown preview
Plug 'ellisonleao/glow.nvim'

call plug#end()
