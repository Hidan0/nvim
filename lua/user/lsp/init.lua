local status, _ = pcall(require, "lspconfig")
if not status then
	vim.notify("Can not load LSP!")
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
