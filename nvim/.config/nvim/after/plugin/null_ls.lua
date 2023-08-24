local has_null_ls, null_ls = pcall(require, "null-ls")

if not has_null_ls then
  return
end

local is_available = function(utils)
  return utils.root_has_file({
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json",
  })
end

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.gitsigns.with({
      config = {
        filter_actions = function(title)
          return title:lower():match("blame") == nil
        end,
      },
    }),
    null_ls.builtins.code_actions.eslint_d.with({
      condition = is_available,
    }),

    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = is_available,
    }),

    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.taplo,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.prettierd.with({
      extra_filetypes = { "svelte" },
    }),
    null_ls.builtins.formatting.eslint_d.with({
      condition = is_available,
    }),
  },
})
