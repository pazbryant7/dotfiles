local M = {}

M.treesitter = {
  auto_install = true,
  additional_vim_regex_highlighting = false,
  ensure_installed = {
    'json',
    'javascript',
    'typescript',
    'tsx',
    'gitignore',
    'css',
    'html',
    'markdown',
    'lua',
    'vim',
    'python',
    'rust',
    'scss',
    'gitignore',
    'graphql',
    'prisma',
    'regex',
    'sql',
    'yaml',
    'dockerfile',
    'toml',
  },
  playground = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua
    'lua-language-server',
    'stylua',

    -- javascript/typescript
    'typescript-language-server',
    'tailwindcss-language-server',

    -- python
    'pyright',
    'blue',
    'isort',
    'mypy',
    'ruff',

    -- rust
    'rust-analyzer',
    'rustfmt',

    -- web dev stuff
    'css-lsp',
    'html-lsp',
    'eslint_d',

    -- formatter
    'prettier',

    -- markdown
    'markdownlint',
    'marksman',
    'alex',
  },
}

M.telescope = {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
  defaults = {
    vimgrep_arguments = {
      'rg',
      '-L',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-uu',
    },
    file_ignore_patterns = { 'node_modules', '.docker', '.git', 'yarn.lock' },
    extensions_list = { 'themes', 'terms', 'harpoon', 'fzf' },
  },
}

M.cmp = {
  completion = {
    completeopt = 'menu,menuone',
  },
  mapping = {
    ['<Up>'] = require('cmp').mapping.select_prev_item(),
    ['<Down>'] = require('cmp').mapping.select_next_item(),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'treesitter' },
    { name = 'nvim_lsp_document_symbol' },
    { name = 'spell' },
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
  view = {
    side = 'left',
    width = 90,
    cursorline = false,
  },
  renderer = {
    group_empty = true,
    indent_width = 4,
    highlight_git = true,
    highlight_opened_files = 'all',
  },
  hijack_unnamed_buffer_when_opening = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  tab = {
    sync = {
      open = true,
      close = true,
    },
  },
  sort_by = 'name',
  diagnostics = {
    enable = false,
  },
}

return M
