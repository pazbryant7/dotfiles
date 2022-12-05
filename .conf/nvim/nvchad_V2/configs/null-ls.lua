local present, null_ls = pcall(require, 'null-ls')

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.diagnostics.eslint_d.with({
    condition = function(utils)
      local has_eslint_config = utils.root_has_file('.eslintrc.js')
        or utils.root_has_file('.eslintrc.json')
        or utils.root_has_file('.eslintrc.yml')
        or utils.root_has_file('.eslintrc.yaml')
        or utils.root_has_file('.eslintrc')
        or utils.root_has_file('.eslintrc.cjs')
      return has_eslint_config
    end,
  }),

  b.formatting.prettier.with({
    filetypes = {
      'html',
      'json',
      'yaml',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'css',
      'scss',
      'less',
      'html',
    },
  }),

  -- Lua
  b.formatting.stylua,

  -- python
  b.formatting.blue,
  b.formatting.isort,
  b.diagnostics.mypy,
  b.diagnostics.ruff,

  -- rust
  b.formatting.rustfmt,

  -- markdown
  b.diagnostics.markdownlint,
  b.formatting.markdownlint,
  b.diagnostics.alex,
}

vim.diagnostic.config({
  virtual_text = false,
})

null_ls.setup({
  sources = sources,
  on_attach = function()
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
})
