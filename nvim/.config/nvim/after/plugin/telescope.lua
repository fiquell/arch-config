local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  return
end

local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_config = { prompt_position = "top" },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
})

vim.keymap.set("n", "<C-p>", builtin.find_files)
vim.keymap.set("n", "<C-t>", builtin.builtin)
vim.keymap.set("n", "<Space>gb", builtin.git_branches)
vim.keymap.set("n", "<Space>gc", builtin.git_commits)
vim.keymap.set("n", "<Space>gs", builtin.git_status)