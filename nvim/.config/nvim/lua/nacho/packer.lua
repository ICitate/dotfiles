-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({ 'folke/tokyonight.nvim', as = 'tokyonight' })
    use({ 'cocopon/iceberg.vim', as = 'iceberg' })
    use({ 'bettervim/yugen.nvim', as = 'yugen' })
    use({ 'icitate/sober.nvim', as = 'sober' })

    use 'fatih/vim-go'

    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})

    use 'tpope/vim-fugitive'
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'

    use "rktjmp/shipwright.nvim"
    use ('rktjmp/lush.nvim')

    use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  },

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
  }
end)
