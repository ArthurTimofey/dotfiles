local null_ls = require 'null-ls'

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local on_attach = function(client, bufnr)
	if client.supports_method 'textDocument/formatting' then
		vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format { bufnr = bufnr }
			end,
		})
	end
end

null_ls.setup {
	on_attach = on_attach,
	sources = {
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.prettierd.with {
			env = {
				PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
			},
		},
		null_ls.builtins.formatting.stylua,
	},
}
