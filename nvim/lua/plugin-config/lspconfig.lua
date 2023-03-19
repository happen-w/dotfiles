local function lsp_highlight_document(client)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end


local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end


M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.on_attach = function(client, _)
  lsp_highlight_document(client)

  if client.name == "jdt.ls" then
    vim.lsp.codelens.refresh()
    require("jdtls.setup").add_commands()
  end
end


return M
