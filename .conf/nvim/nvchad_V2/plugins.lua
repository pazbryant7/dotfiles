local overrides = require('custom.configs.overrides')

local VeryLazy = 'VeryLazy'
local plugins = {

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('custom.configs.null-ls')
        end,
      },
    },
    config = function()
      require('plugins.configs.lspconfig')
      require('custom.configs.lspconfig')
    end,
  },

  -- override default configs

  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('custom.configs.colorizer')
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    opts = overrides.cmp,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-buffer',
      'f3fora/cmp-spell',
      'hrsh7th/cmp-emoji',
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { 'JoosepAlviste/nvim-ts-context-commentstring', ft = 'javascriptreact' },
    },
    opts = overrides.treesitter,
  },

  { 'williamboman/mason.nvim', opts = overrides.mason },

  { 'nvim-tree/nvim-tree.lua', opts = overrides.nvimtree },

  {
    'nvim-telescope/telescope.nvim',
    opts = overrides.telescope,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  -- lazy

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },

  {
    'nvim-pack/nvim-spectre',
  },

  {
    'ThePrimeagen/harpoon',
    config = function()
      require('custom.configs.harpoon')
    end,
  },

  -- startup

  {
    'folke/todo-comments.nvim',
    event = 'BufWinEnter',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter' },
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('custom.configs.todo-comments')
    end,
  },

  { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = false },
  { 'christoomey/vim-tmux-navigator', lazy = false },

  -- keys

  {
    'numToStr/Comment.nvim',
    keys = { 'gcc', { 'gc', mode = 'v' } },
    config = function()
      require('Comment').setup({
        pre_hook = require(
          'ts_context_commentstring.integrations.comment_nvim'
        ).create_pre_hook(),
      })
    end,
  },

  {
    'mg979/vim-visual-multi',
    keys = { { '<C-n>', mode = 'v' } },
  },

  {
    'vim-scripts/ReplaceWithRegister',
    keys = { 'gr' },
  },

  {
    'tpope/vim-surround',
    keys = { 'ds', 'cs', 'ys', { 'S', mode = 'v' } },
  },

  -- very lazy / event

  {
    'ray-x/lsp_signature.nvim',
    event = 'BufReadPost',
    config = function()
      require('custom.configs.signature')
    end,
    enabled = true,
  },

  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = 'cd app && yarn install',
  },

  {
    'windwp/nvim-ts-autotag',
    ft = 'html',
    config = function()
      require('custom.configs.ts-autotag')
    end,
  },

  { 'tpope/vim-repeat', event = VeryLazy },

  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufWinEnter',
    config = function()
      require('custom.configs.treesitter-context')
    end,
  },

  {
    'kevinhwang91/nvim-ufo',
    event = 'BufWinEnter',
    dependencies = { { 'kevinhwang91/promise-async' } },
    config = function()
      require('custom.configs.ufo')
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { { 'nvim-treesitter/nvim-treesitter' } },
  },

  -- event
  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = true,
  },

  -- cmd
  {
    'preservim/tagbar',
    cmd = 'TagbarToggle',
  },

  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },

  {
    'nvim-treesitter/playground',
    cmd = 'TSHighlightCapturesUnderCursor',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter' },
    },
    config = function()
      require('nvim-treesitter.configs').setup({})
    end,
  },

  {
    'phaazon/hop.nvim',
    cmd = { 'HopAnywhere', 'HopLine', 'HopWord', 'HopWordCurrentLine' },
    branch = 'v2',
    config = function()
      require('custom.configs.hop')
    end,
  },

  {
    'folke/trouble.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    cmd = 'TroubleToggle',
    config = function()
      require('custom.configs.trouble')
    end,
  },

  -- disabled

  {
    'folke/which-key.nvim',
    enabled = false,
  },

  {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'BufWinEnter',
    config = true,
    enabled = false,
  },

  {
    'github/copilot.vim',
    enabled = false,
    event = 'BufWinEnter',
    config = function()
      require('custom.configs.copilot')
    end,
  },
}

return plugins
