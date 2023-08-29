local has_cmp, cmp = pcall(require, "cmp")
local has_autopairs, autopairs = pcall(require, "nvim-autopairs")
local has_luasnip, luasnip = pcall(require, "luasnip")

if not has_cmp and not has_autopairs and not has_luasnip then
  return
end

local completion_cmp = require("nvim-autopairs.completion.cmp")
local from_vscode = require("luasnip.loaders.from_vscode")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm(),
    ["<C-g>"] = function()
      if cmp.visible_docs() then
        cmp.close_docs()
      else
        cmp.open_docs()
      end
    end,
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmdline" },
  }),
  view = {
    docs = {
      auto_open = false,
    },
  },
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "buffer" },
  }),
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
    {
      name = "cmdline",
      option = {
        ignore_cmds = {},
      },
    },
  }),
})

autopairs.setup({ check_ts = true })
cmp.event:on("confirm_done", completion_cmp.on_confirm_done())
from_vscode.lazy_load()
