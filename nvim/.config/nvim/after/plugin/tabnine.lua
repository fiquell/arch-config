local has_tabnine, tabnine = pcall(require, "tabnine")

if not has_tabnine then
  return
end

tabnine.setup({
  disable_auto_comment = true,
  suggestion_color = { gui = "#565f89" },
})
