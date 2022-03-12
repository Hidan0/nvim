local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
  vim.notify("Can not load nvim-lsp-installer")
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, i may also register handlers on specific server instances instead.
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  server:setup(opts)
end)

