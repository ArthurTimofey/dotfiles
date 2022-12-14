vim.g.mapleader = ','

-- Options
vim.o.background = 'dark'
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'noinsert,menuone,noselect'
vim.o.inccommand = 'split'
vim.o.mouse = 'a'
vim.o.number = true
vim.o.title = true
vim.o.ttimeoutlen = 0
vim.o.wildmenu = true
vim.o.signcolumn = 'yes'
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.shellcmdflag = '-ic'
vim.o.showtabline = 2
vim.wo.cursorline = true

-- show spaces and tabs as characters use a fat dot for spaces
-- and dash for tabs
vim.o.list = true
vim.o.listchars = 'tab:▸ ,trail:·,nbsp:␣,extends:❯,precedes:❮'

-- spaces and tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
