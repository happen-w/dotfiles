local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

mason_lspconfig.setup({
  ensure_installed = { "pyright", "lua_ls", "clangd", "jdtls" },
  -- ensure_installed = { "pyright", "lua_ls", "clangd"},
})


local servers = mason_lspconfig.get_installed_servers()
local luasetting = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
    },
    diagnostics = {
      globals = { 'vim' },
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true),
      checkThirdParty = false
    },
    telemetry = {
      enable = false,
    },
  },
}


for _, server in ipairs(servers) do
  local opts = {
    on_attach = require("plugin-config.lspconfig").on_attach,
    capabilities = require("plugin-config.lspconfig").capabilities,
  }

  if server == "lua_ls" then
    opts.settings = luasetting
  elseif server == "jdtls" then
      goto continue
  end

  lspconfig[server].setup(opts)

  ::continue::
end
