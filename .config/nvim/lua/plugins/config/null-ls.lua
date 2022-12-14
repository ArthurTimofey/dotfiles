local null_ls = require("null-ls")
local augroup_name = 'CosmicNvimLspFormat'
local group = vim.api.nvim_create_augroup(augroup_name, { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({
      filter = function(client)
        -- apply whatever logic you want (in this example, we'll only use null-ls)
        return client.name == "null-ls"
      end
    })
  end,
  group = group,
  nested = true,
})

null_ls.setup({
  debug = true,
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd,
  }
})
