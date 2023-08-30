local has_indent_blankline, indent_blankline = pcall(require, "indent_blankline")

if not has_indent_blankline then
  return
end

indent_blankline.setup({
  show_current_context = true,
})
