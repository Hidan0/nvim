local status, _ = pcall(require, "lspconfig")
if not status then
	vim.notify("Can not load LSP!")
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

local ok, _ = pcall(require, "rust-tools")
if not ok then
  vim.notify("Can not load rust-tools")
  return
end
