local util = require('core.util')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

util.map('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

