local util = require("core.util")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "cssls", "html", "tsserver", "sumneko_lua", "marksman", "rust_analyzer", "svelte", "taplo",
    "yamlls" }
})

local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local on_attach = function(client, bufnr)

  util.map('n', '<space>rn', vim.lsp.buf.rename)
  util.map('n', '<space>ca', vim.lsp.buf.code_action)

  util.map('n', 'gd', vim.lsp.buf.definition)
  util.map('n', 'gi', vim.lsp.buf.implementation)
  util.map('n', 'gr', require('telescope.builtin').lsp_references)
  util.map('n', 'K', vim.lsp.buf.hover)

  if client.supports_method("textDocument/formatting") then
    vim.keymap.set("n", "<Leader>f", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { buffer = bufnr, desc = "[lsp] format" })

    -- format on save
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
      end,
      desc = "[lsp] format on save",
    })
  end

  if client.supports_method("textDocument/rangeFormatting") then
    vim.keymap.set("x", "<Leader>f", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { buffer = bufnr, desc = "[lsp] format" })
  end
end

null_ls.setup({
  debug = true,
  on_attach = on_attach
})

require("lspconfig").sumneko_lua.setup {
  on_attach = on_attach,
  settings = { Lua = { diagnostics = { globals = { 'vim' } }, telemetry = { enable = false } } },
}
