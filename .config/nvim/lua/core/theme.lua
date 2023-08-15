vim.o.termguicolors = true

require('catppuccin').setup {
	style = 'mocha',
}
require('catppuccin').load()

vim.cmd [[ colorscheme catppuccin ]]

return require("catppuccin.palettes").get_palette "mocha"
