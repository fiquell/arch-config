require("fiquell.lsp")
require("fiquell.globals")
require("fiquell.plugins")

local highlight_yank = vim.api.nvim_create_augroup("HighlightYank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      timeout = 100,
    })
  end,
})

local tmux_status = vim.api.nvim_create_augroup("TmuxStatus", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "VimLeave" }, {
  group = tmux_status,
  pattern = "*",
  command = "silent !tmux set-option status",
})
