local on_attach = require('plugins.configs.lspconfig').on_attach
local capabilities = require('plugins.configs.lspconfig').capabilities

local lspconfig = require('lspconfig')

local servers = {
  'cssls',
  'html',
  'lua_ls',
  'pyright',
  'tsserver',
  'rust_analyzer',
  'marksman',
  'tailwindcss',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'require' },
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  root_dir = require('lspconfig').util.root_pattern(
    'tailwind.config.js',
    'tailwind.config.cjs',
    'tailwind.config.mjs',
    'tailwind.config.ts'
  ),
  autostart = false,
})
