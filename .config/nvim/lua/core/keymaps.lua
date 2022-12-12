local util = require('core.util')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true

-- spaces and tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- key maps
util.map('n', '<leader>h', ':nohlsearch<CR>')
util.map('n', '<c-s>', ':w<CR>')
util.map('i', '<c-s>', '<ESC>:w<CR>')
util.map('v', '<c-s>', '<ESC>:w<CR>')
util.map('n', '<leader>a', ':source $MYVIMRC<CR>')
