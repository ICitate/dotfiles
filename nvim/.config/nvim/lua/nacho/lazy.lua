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

      { 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.config').setup {
              -- A list of parser names, or "all"
              -- ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "go" },

              -- Install parsers synchronously (only applied to `ensure_installed`)
              sync_install = false,

              -- Automatically install missing parsers when entering buffer
              -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
              auto_install = false,

              highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
              },
            }
        end
      },

      {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },

        opts = {  
            highlight = {
              -- This matches: KEYWORD, followed by optional (any_characters), followed by optional spaces and a colon
              pattern = [[.*<(KEYWORDS)(\([^)]*\))?\s*:]], 
              
              comments_only = true, -- Safely process targets only inside Treesitter comment scopes
            },
            search = {
              -- This ensures that Ripgrep searches (like Telescope) match the same parenthesized syntax
              pattern = [[\b(KEYWORDS)(\([^)]*\))?\s*:]],
            }
        }
          -- signs = false, -- Turn off if you don't want signs in the gutter column
      },

      { 'tpope/vim-fugitive', cmd = { 'Git', 'Gdiffsplit', 'Gread', 'Gwrite' } },

      {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            indent = {
                animate = {
                    enabled = false,
                },
            -- your indent configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            },
        },
      },

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
