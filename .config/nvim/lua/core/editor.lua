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
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- auto refresh buffers when files change
vim.cmd 'autocmd FocusGained,BufEnter * checktime'

vim.cmd [[autocmd FileType help wincmd L]]

-- prevent comment lines from continuing
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
