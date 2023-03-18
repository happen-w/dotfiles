-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local buf = vim.lsp.buf
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  map('n', 'gD', buf.declaration, bufopts)
  map('n', 'gd', buf.definition, bufopts)
  map('n', 'K', buf.hover, bufopts)
  -- 查看实现
  map('n', 'gi', buf.implementation, bufopts)
  map('n', '<C-k>', buf.signature_help, bufopts)
  map('n', '<space>wa', buf.add_workspace_folder, bufopts)
  map('n', '<space>wr', buf.remove_workspace_folder, bufopts)
  map('n', '<space>wl', function()
    print(vim.inspect(buf.list_workspace_folders()))
  end, bufopts)
  map('n', '<space>D', buf.type_definition, bufopts)
  -- 重命名变量
  map('n', '<space>rn', buf.rename, bufopts)
  map('n', '<space>ca', buf.code_action, bufopts)
  -- 查看引用
  map('n', 'gr', buf.references, bufopts)
  -- format
  map('n', '==', function() buf.format { async = true } end, bufopts)
end

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

M.on_attach = function(client,bufnr)
    lsp_highlight_document(client)
    on_attach(client, bufnr)
    
    if client.name == "jdt.ls" then
        vim.lsp.codelens.refresh()
        require("jdtls.setup").add_commands()
    end

end


return M
