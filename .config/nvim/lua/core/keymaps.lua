local util = require('core.util')

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Options
vim.o.background = 'dark'
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'noinsert,menuone,noselect'
vim.o.inccommand = 'split'
vim.o.mouse='a'
vim.o.number=true
vim.o.title = true
vim.o.ttimeoutlen=0
vim.o.wildmenu = true
vim.o.signcolumn = 'yes'
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth =2
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.shellcmdflag='-ic'
vim.o.showtabline =2
vim.wo.cursorline = true

-- spaces and tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- nvim commands
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax on')
vim.api.nvim_command('autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart')
vim.api.nvim_command('autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact')
vim.cmd('syntax enable')

-- nvim custom commands
vim.api.nvim_create_user_command('Cap', 'execute(\'!cap "<args>"\')', {nargs = 1})

-- key maps
util.map('n', '<leader>h', ':nohlsearch<CR>')
util.map('n', '<c-s>', ':w<CR>')
util.map('i', '<c-s>', '<ESC>:w<CR>')
util.map('v', '<c-s>', '<ESC>:w<CR>')
util.map('n', '<leader>a', ':luafile ~/.config/nvim/init.lua<CR>')
-- open tab 1,2,3,4 using leaderN 
util.map('n', '<leader>1', '1gt')
util.map('n', '<leader>2', '2gt')
util.map('n', '<leader>3', '3gt')
util.map('n', '<leader>4', '4gt')
--
util.map('n', '<leader>g', ':Cap ')
util.map('n', '<leader>t', ':tabnew | terminal<CR>')
