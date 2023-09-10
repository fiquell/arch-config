local has_cmp, cmp = pcall(require, "cmp")
local has_autopairs, autopairs = pcall(require, "nvim-autopairs")
local has_luasnip, luasnip = pcall(require, "luasnip")

if not has_cmp and not has_autopairs and not has_luasnip then
  return
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

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
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmdline" },
  }),
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
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
