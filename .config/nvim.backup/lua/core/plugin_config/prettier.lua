local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "*",
  },
})
