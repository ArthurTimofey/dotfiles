local null_ls = require("null-ls")
local augroup_name = "NullLsFormat"
local group = vim.api.nvim_create_augroup(augroup_name, { clear = true })

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.markdown_toc,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
  },
})
