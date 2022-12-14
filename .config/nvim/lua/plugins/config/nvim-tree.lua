local map = require('utils.keymap')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

map('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

