local lsp = require 'lspconfig'

local lsp_servers = {
	'cssls',
	'html',
	'jsonls',
	'tsserver',
	'yamlls',
	'taplo',
	'svelte',
	'rust_analyzer',
	'lua_ls',
	'tailwindcss',
	'bashls',
	'sqlls',
}

require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = lsp_servers,
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	client.server_capabilities.document_formatting = false
end

vim.lsp.set_log_level 'error'

lsp.rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		['rust-analyzer'] = {
			assist = {
				importGranularity = 'module',
				importPrefix = 'by_self',
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
		},
	},
}

lsp.lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			format = {
				enable = false,
			},
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},
}

lsp.tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	format = false,
	cmd = { 'typescript-language-server', '--stdio' },
	root_dir = vim.loop.cwd,
}

lsp.svelte.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lsp.cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		css = { validate = true, lint = {
			unknownAtRules = 'ignore',
		} },
		scss = { validate = true, lint = {
			unknownAtRules = 'ignore',
		} },
		less = { validate = true, lint = {
			unknownAtRules = 'ignore',
		} },
	},
}

lsp.tailwindcss.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lsp.html.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lsp.bashls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

lsp.sqlls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
