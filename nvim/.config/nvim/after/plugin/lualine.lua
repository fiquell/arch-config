local has_lualine, lualine = pcall(require, "lualine")

if not has_lualine then
  return
end

lualine.setup({
  options = {
    icons_enabled = false,
    theme = "tokyonight",
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "diff", "filename" },
    lualine_x = { "filesize", "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
