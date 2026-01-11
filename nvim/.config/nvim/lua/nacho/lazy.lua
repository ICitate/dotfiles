-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
      {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.2.0',
        cmd = 'Telescope', -- Loads only when you run a Telescope command
        dependencies = { 'nvim-lua/plenary.nvim' },
      },

      --[[ Uncomment to enable these colorschemes
      { 'folke/tokyonight.nvim', name = 'tokyonight' },
      { 'cocopon/iceberg.vim', name = 'iceberg' },
      { 'bettervim/yugen.nvim', name = 'yugen' },
      { 'icitate/sober.nvim', name = 'sober' },
      { 'webhooked/kanso.nvim' },
      ]]
      { 'mcauley-penney/techbase.nvim', lazy = true },

      { 'fatih/vim-go', ft = 'go' },

      {
        'nvim-treesitter/nvim-treesitter',
      },

      { 'tpope/vim-fugitive', cmd = { 'Git', 'Gdiffsplit', 'Gread', 'Gwrite' } },
      --[[ Uncomment to enable these plugins
      { 'tpope/vim-dadbod' },
      { 'kristijanhusak/vim-dadbod-ui' },
      { 'rktjmp/shipwright.nvim' },
      { 'rktjmp/lush.nvim' },
      { 'neovim/nvim-lspconfig' },
      ]]

      -- Autocompletion
      -- { 'hrsh7th/nvim-cmp', event = 'InsertEnter' },
      -- { 'hrsh7th/cmp-buffer', event = 'InsertEnter' },
      -- { 'hrsh7th/cmp-path', event = 'InsertEnter' },
      -- { 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' },
      -- { 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter' },
      -- { 'hrsh7th/cmp-nvim-lua', event = 'InsertEnter' },

      -- -- Snippets
      -- { 'L3MON4D3/LuaSnip', event = 'InsertEnter' },
      -- { 'rafamadriz/friendly-snippets', event = 'InsertEnter' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = {},
  -- automatically check for plugin updates
  checker = { enabled = false },
})
