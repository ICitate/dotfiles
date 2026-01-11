-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- use({ 'folke/tokyonight.nvim', as = 'tokyonight' })
    -- use({ 'cocopon/iceberg.vim', as = 'iceberg' })
    -- use({ 'bettervim/yugen.nvim', as = 'yugen' })
    -- use({ 'icitate/sober.nvim', as = 'sober' })
    -- use 'webhooked/kanso.nvim'
    use 'mcauley-penney/techbase.nvim'

    use 'fatih/vim-go'

    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})

    use 'tpope/vim-fugitive'
    -- use 'tpope/vim-dadbod'
    -- use 'kristijanhusak/vim-dadbod-ui'

    -- use "rktjmp/shipwright.nvim"
    -- use ('rktjmp/lush.nvim')

    -- use 'neovim/nvim-lspconfig'

    -- Autocompletion
    -- use 'hrsh7th/nvim-cmp'
    -- use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/cmp-path'
    -- use 'saadparwaiz1/cmp_luasnip'
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-nvim-lua'

    -- Snippets
    -- use 'L3MON4D3/LuaSnip'
    -- use 'rafamadriz/friendly-snippets'
end)
