local null_ls = require 'null-ls'

local fileTypes = {
	'typescript',
	'typescriptreact',
	'javascript',
	'json',
	'jsonc',
	'yaml',
	'markdown',
	'html',
	'css',
	'scss',
	'less',
	'svelte',
	'cjs',
	'postcss',
	'sh',
}

local eslintFileTypes = {
	'typescript',
	'typescriptreact',
	'javascript',
	'javascriptreact',
	'svelte',
}

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
	timeout = 1000,
	sources = {
		null_ls.builtins.code_actions.eslint_d.with {
			filetypes = eslintFileTypes,
		},
		null_ls.builtins.diagnostics.eslint_d.with {
			filetypes = eslintFileTypes,
		},
		null_ls.builtins.formatting.prettierd.with {
			env = {
				PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
			},
			filetypes = fileTypes,
		},
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.rustfmt.with {
			extra_args = function(params)
				local Path = require 'plenary.path'
				local cargo_toml = Path:new(params.root .. '/' .. 'Cargo.toml')

				if cargo_toml:exists() and cargo_toml:is_file() then
					for _, line in ipairs(cargo_toml:readlines()) do
						local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
						if edition then
							return { '--edition=' .. edition }
						end
					end
				end
				-- default edition when we don't find `Cargo.toml` or the `edition` in it.
				return { '--edition=2021' }
			end,
		},
	},
}
