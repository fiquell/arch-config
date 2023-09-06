local has_tokyonight, tokyonight = pcall(require, "tokyonight")

if not has_tokyonight then
  return
end

tokyonight.setup({
  style = "night",
  styles = {
    sidebars = "normal",
    floats = "normal",
  },
  lualine_bold = true,
})

vim.cmd.colorscheme("tokyonight")
