local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins
-- local m = null_ls.methods

local sources = {

	-- webdev stuff
	-- choosed deno for ts/js files because its very fast!
	b.diagnostics.eslint_d,
	b.formatting.prettier,

	-- Lua
	b.formatting.stylua,

	-- python
	b.formatting.blue,
	b.formatting.isort,
	b.diagnostics.ruff,
	-- b.diagnostics.pydocstyle,

	-- json
	b.diagnostics.jsonlint,

	-- rust
	b.formatting.rustfmt,

	-- markdown
	b.diagnostics.markdownlint,
	b.diagnostics.alex,
}

vim.diagnostic.config({
	virtual_text = false,
})

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function()
		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
})
