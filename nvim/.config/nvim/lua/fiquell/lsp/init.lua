local lspconfig, _ = pcall(require, "lspconfig")

if not lspconfig then
  return
end

require("fiquell.lsp.handlers").setup()
