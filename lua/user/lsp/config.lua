local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
	vim.notify("Can not load nvim-lsp-installer")
	return
end

local lspconfig = require("lspconfig")
local servers = {
	"jsonls",
	"sumneko_lua",
	"rust_analyzer",
	"pyright",
	"tsserver",
	"volar",
	"html",
	"cssls",
  "wgsl_analyzer"
}

lsp_installer.setup({
	ensure_installed = servers,
})

local configs = require("lspconfig.configs")
if not configs.wgsl_analyzer then
	configs.wgsl_analyzer = {
		default_config = {
			cmd = { vim.fn.expand("$HOME") .. "/.cargo/bin/wgsl_analyzer" },
			filetypes = { "wgsl" },
			root_dir = lspconfig.util.root_pattern(".git", "wgsl"),
			settings = {},
		},
	}
end

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end

	lspconfig[server].setup(opts)
end

