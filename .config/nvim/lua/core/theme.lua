vim.o.termguicolors = true
vim.cmd [[ colorscheme onedark ]]

require('onedark').setup({
  style = 'dark'
})
require('onedark').load()

return require('onedark.colors')
