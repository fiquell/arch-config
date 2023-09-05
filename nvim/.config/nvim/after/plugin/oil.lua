local has_oil, oil = pcall(require, "oil")

if not has_oil then
  return
end

oil.setup({
  columns = {
    "permissions",
    "size",
    "mtime",
  },
  win_options = {
    signcolumn = "yes",
  },
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "<S-e>", oil.open)
