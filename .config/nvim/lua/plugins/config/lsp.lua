local map = require("utils.keymap")
local lsp = require("lspconfig")

local lsp_servers = { "cssls", "html", "jsonls", "tsserver", "yamlls", "taplo", "svelte", "rust_analyzer", "sumneko_lua" }

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = lsp_servers
})

local opts = { noremap = true, silent = true }
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

lsp.sumneko_lua.setup({
  settings = {
    Lua = {
      format = {
        enable = false
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lsp.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.server_capabilities.document_formatting = false
  end,
  format = false
}
