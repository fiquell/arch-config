local has_cmp, cmp = pcall(require, "cmp_nvim_lsp")

if not has_cmp then
  return
end

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    bufnr = bufnr,
    filter = function(client)
      return client.name == "null-ls"
    end,
  })
end

local lsp_organize_imports = function(bufnr)
  vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(bufnr) },
  })
end

local M = {}

M.setup = function()
  vim.diagnostic.config({
    virtual_text = {
      prefix = "»",
    },
    signs = false,
    update_in_insert = true,
    severity_sort = true,
  })
end

M.on_attach = function(client, bufnr)
  local format_document = vim.api.nvim_create_augroup("FormatDocument", { clear = true })
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = format_document, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = format_document,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
        lsp_organize_imports(bufnr)
      end,
    })
  end
end

M.capabilities = cmp.default_capabilities()

return M
