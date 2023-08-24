require("fiquell.lsp")
require("fiquell.globals")
require("fiquell.plugins")

local augroup = vim.api.nvim_create_augroup("HighlightYank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      timeout = 100,
    })
  end,
})
