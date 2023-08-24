local has_gitsigns, gitsigns = pcall(require, "gitsigns")

if not has_gitsigns then
  return
end

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 50,
  },
  preview_config = {
    border = "rounded",
  },
})

vim.keymap.set("n", "<Space>tb", gitsigns.toggle_current_line_blame)
vim.keymap.set("n", "<Space>td", gitsigns.toggle_deleted)
vim.keymap.set("n", "<Space>hp", gitsigns.preview_hunk)
vim.keymap.set("n", "<Space>hu", gitsigns.undo_stage_hunk)
vim.keymap.set("n", "<Space>hb", function()
  gitsigns.blame_line({ full = true })
end)
vim.keymap.set("n", "<Space>hd", function()
  gitsigns.diffthis("~")
end)
vim.keymap.set("v", "<Space>hr", function()
  gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("v", "<Space>hs", function()
  gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
