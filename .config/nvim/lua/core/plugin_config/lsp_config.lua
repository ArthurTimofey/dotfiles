local util = require("core.util")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"cssls", "html", "tsserver", "sumneko_lua", "marksman", "rust_analyzer", "svelte", "taplo", "yamlls" }
})

local on_attach = function(_,_)

  util.map('n', '<space>rn', vim.lsp.buf.rename)
  util.map('n', '<space>ca', vim.lsp.buf.code_action )

  util.map('n', 'gd', vim.lsp.buf.definition)
  util.map('n', 'gi', vim.lsp.buf.implementation)
  util.map('n', 'gr', require('telescope.builtin').lsp_references)
  util.map('n', 'K', vim.lsp.buf.hover)

end

require("lspconfig").sumneko_lua.setup {
  on_attach = on_attach,
settings = { Lua = { diagnostics = { globals = {'vim'} }, telemetry = { enable = false } } },
}
