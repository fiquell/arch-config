local has_comment, comment = pcall(require, "Comment")
local has_commentstring, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")

if not has_comment and not has_commentstring then
  return
end

comment.setup({
  pre_hook = commentstring.create_pre_hook(),
})
