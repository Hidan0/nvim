local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("Can not load null-ls!")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--single-quote", "--tab-width 4" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.rustfmt,
		-- diagnostics.flake8,
	},
})
