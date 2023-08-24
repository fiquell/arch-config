local has_mason, mason = pcall(require, "mason")
local has_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
local has_lspconfig, lspconfig = pcall(require, "lspconfig")

if not has_mason and not has_mason_lspconfig and not has_lspconfig then
  return
end

local handlers = require("fiquell.lsp.handlers")

local servers = {
  "cssls",
  "emmet_ls",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "rust_analyzer",
  "svelte",
  "tailwindcss",
  "taplo",
  "tsserver",
}

local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
}

mason.setup({
  ui = {
    border = "rounded",
    width = 0.9,
    height = 0.7,
  },
})

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

for _, server in pairs(servers) do
  local has_settings, settings = pcall(require, "fiquell.lsp.settings." .. server)

  if has_settings then
    opts = vim.tbl_deep_extend("force", settings, opts)
  end

  if lspconfig[server] and lspconfig[server].setup then
    lspconfig[server].setup(opts)
  end
end
