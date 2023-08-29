local has_harpoon, harpoon = pcall(require, "harpoon")

if not has_harpoon then
  return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

harpoon.setup({
  menu = {
    width = 80,
    height = 12,
  },
})

vim.keymap.set("n", "<C-a>", mark.add_file)
vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu)

for i = 1, 5 do
  vim.keymap.set("n", tostring(i), function()
    ui.nav_file(i)
  end)
end
