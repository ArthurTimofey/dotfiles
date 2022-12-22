local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
  },
})

local augroup_name = "LSPFORMAT"
local group = vim.api.nvim_create_augroup(augroup_name, { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({
    })
  end,
  group = group,
  nested = true,
})
