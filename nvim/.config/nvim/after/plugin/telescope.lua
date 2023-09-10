local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  return
end

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

telescope.setup({
  defaults = vim.tbl_extend("force", themes.get_ivy(), {
    preview = false,
    results_title = false,
  }),
})

vim.keymap.set("n", "<C-g>", builtin.live_grep)
vim.keymap.set("n", "<C-p>", builtin.git_files)
vim.keymap.set("n", "<Space>bb", builtin.builtin)
vim.keymap.set("n", "<Space>bh", builtin.help_tags)
