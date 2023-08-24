local has_lualine, lualine = pcall(require, "lualine")

if not has_lualine then
  return
end

lualine.setup({
  options = {
    theme = "tokyonight",
    component_separators = "",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" } },
    },
    lualine_b = { "branch" },
    lualine_c = { "diff", "filename" },
    lualine_x = { "filesize", "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = {
      { "location", separator = { right = "" } },
    },
  },
})
