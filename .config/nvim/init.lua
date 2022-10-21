local map = vim.keymap.set

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
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Window Local Options
vim.wo.cursorline = true

-- Global Options
vim.g.hidden = true
vim.g.airline_theme = 'codedark'

-- nvim commands
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax on')
vim.api.nvim_command('autocmd vimenter * ++nested colorscheme codedark')
-- -- reload buffer when editting
vim.api.nvim_command('autocmd BufWritePost .vimrc,_vimrc,init.vim source $MYVIMRC')

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
vim.g.coc_global_extensions = {'coc-prettier'}

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

-- Copilot
map('i', '<c-j>', 'copilot#Accept("\\<CR>")', opts)

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

-- Commands
vim.api.nvim_create_user_command('E', 'execute(\'silent! !mkdir -p "$(dirname "<args>")"\') <Bar> e <args>', {nargs = 1})


