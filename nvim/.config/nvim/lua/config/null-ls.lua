local null_ls_ok, null_ls = pcall(require, "null-ls")

if not null_ls_ok then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier.with({
      extra_args = { "--single-quote", "false" },
    }),
    null_ls.builtins.formatting.black,
    null_ls.builtins.code_actions.shellcheck,
  },
})
