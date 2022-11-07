local map = function (type, key, value, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(type, key, value, options)
end

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

-- Window Local Options
vim.wo.cursorline = true

-- Global Options
vim.g.hidden = true
vim.g.airline_theme = 'tokyonight-night'

-- nvim commands
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax on')
vim.api.nvim_command('autocmd vimenter * ++nested colorscheme tokyonight')
vim.api.nvim_command('autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart')
vim.api.nvim_command('autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact')

-- File Browser
vim.g.netrw_banner=0
vim.g.netrw_liststyle=0
vim.g.netrw_altv=1
vim.g.netrw_winsize=25
vim.g.netrw_keepdir=0
vim.g.netrw_localcopydircmd='cp -r'

-- FZF
vim.opt.rtp = vim.opt.rtp + '~/config/nvim/pack/junegunn/start/fzf'
vim.g.fzf_layout = {window={width=1, height=0.3, yoffset=1.0}}

-- COC
vim.cmd [[
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-git', 'coc-lua', 'coc-json']
]]

vim.o.updatetime=300
vim.o.signcolumn='yes'
vim.opt.backup = false
vim.opt.writebackup = false

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#confirm() : coc#refresh()', opts)
map("n", "gd", "<Plug>(coc-definition)", {silent = true})
map("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
map("n", "gi", "<Plug>(coc-implementation)", {silent = true})
map("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Copilot
vim.g.copilot_autostart = 1
vim.g.copilot_no_tab_map = true
map("i", "<C-j>", "copilot#Accept('<CR>')", {noremap = true, silent = true, expr=true })

-- Commands
vim.api.nvim_create_user_command('E', 'execute(\'silent! !mkdir -p "$(dirname "<args>")"\') <Bar> e <args>', {nargs = 1})
-- create a command that deletes current file
vim.api.nvim_create_user_command('D', 'execute(\'silent! !rm -rf %\')', {nargs = 0})

-- Key Maps
vim.g.mapleader = ','
map('n', '<c-p>', ':FZF<CR>') -- FZF
map('n', '<c-g>', ':Ag<CR>') -- AG
map('n', '<leader>a', ':luafile ~/.config/nvim/init.lua<CR>') -- refresh neovim
map('n', '<c-s>', ':w<CR>')
map('i', '<c-s>', '<ESC>:w<CR>')
map('v', '<c-s>', '<ESC>:w<CR>')
map('n', '<leader>t', ':tabe | term<CR>')
map('t', '<Esc>', '(&filetype == "fzf") ? "<Esc>" : "<C-\\><C-n>"', {silent = true, noremap = true, expr = true })
-- close buffer using <S-q> and <S-q>
map('n', '<S-q>', ':BufferClose<CR>', {silent=true})
map('n', '<leader>d', ':D<CR>', {silent=true,  noremap=true})
-- open Exp using leader and E
map('n', '<leader>e', ':Exp<CR>', {silent=true,  noremap=true})
-- close explorer using key
map('n', '<leader>c', ':bd<CR>', {silent=true,  noremap=true})

require('plugins.galaxyline')
require('plugins.tabby')
