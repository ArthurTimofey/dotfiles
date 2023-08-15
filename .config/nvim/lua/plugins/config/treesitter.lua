require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'lua',
		'rust',
		'typescript',
		'html',
		'vim',
		'css',
		'javascript',
		'json',
		'markdown',
		'regex',
		'yaml',
	},

	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
	},
}
