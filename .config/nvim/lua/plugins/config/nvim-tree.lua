vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup { -- BEGIN_DEFAULT_OPTS
	filters = {
		exclude = {},
	},
}
