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
	'sumneko_lua',
}

require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = lsp_servers,
}

local on_attach = function(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	client.server_capabilities.document_formatting = false
end

vim.lsp.set_log_level 'debug'

lsp.rust_analyzer.setup {
	on_attach = on_attach,
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

lsp.sumneko_lua.setup {
	on_attach = on_attach,
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
	format = false,
}
