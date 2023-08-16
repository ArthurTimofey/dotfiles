local map = require 'utils.keymap'

local ctrlKey = vim.loop.os_uname().sysname == 'Darwin' and 'c' or 'a'

-- Used mostly on OSes other than mac
-- Swaps any key combination with the other
local swapKeys = function(mode, x, y)
	map(mode, x, y)
	map(mode, y, x)
end

local getKey = function(key)
	return '<' .. ctrlKey .. '-' .. key .. '>'
end

-- Leader Key
vim.g.mapleader = ','

-- CTRL + Keys
-- Swapping default vim keys
swapKeys('n', '<c-w>', getKey 'w')
swapKeys('n', '<c-6>', getKey '6')
swapKeys('n', '<c-o>', getKey 'o')
swapKeys('n', '<c-r>', getKey 'r')

map('n', getKey 's', ':w<CR>')
map('i', getKey 's', '<ESC>:w<CR>')
map('v', getKey 's', '<ESC>:w<CR>')

-- Custom Leader Keys
map('n', '<leader>h', ':nohlsearch<CR>')
map('n', '<leader>s', ':noautocmd w<CR>')
map('n', '<leader>a', ':luafile ~/.config/nvim/init.lua<CR>')
-- map('n', '<leader>g', ':Cap ')
map('n', '<leader>g', ':LazyGit<CR>')
map('n', '<leader>qa', ':qa<CR>')
map('n', '<leader>cp', ':let @+=expand("%:p")<CR>')

-- Nvim Term
map('n', '<leader>tt', ':FloatermNew <CR>')
map('n', '<leader>t', ':FloatermToggle <CR>')
map('n', '<Left>', ':FloatermPrev <CR>')
map('n', '<Right>', ':FloatermNext <CR>')
map('t', '<Esc>', '<C-\\><C-n>:q<CR>')

-- CommentToggle
map('v', '<leader>c', ':CommentToggle<CR>')
map('n', '<leader>c', ':CommentToggle<CR>')

-- LSP
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')

-- Telescope
local builtin = require 'telescope.builtin'
map('n', getKey 'p', builtin.find_files, {})
map('n', getKey 'g', builtin.live_grep, {})
-- telescope on current file live_grep
map('n', '<leader>fg', builtin.current_buffer_fuzzy_find, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
-- show files hidden by .gitignore
map('n', '<leader>ff', builtin.git_files)

-- map - toggle copilot
map('n', '<leader>cf', ':Copilot disable<CR>')
map('n', '<leader>cn', ':Copilot enable<CR>')

-- NvimTree
map('n', getKey 'n', ':NvimTreeFindFileToggle<CR>')

-- Custom Functions
map('n', '<leader>cd', ':lua copy_last_diagnostic()<CR>')
-- clear session
map('n', '<leader>cs', ':lua clear_session()<CR>')

function _G.clear_session()
	local session_dir = vim.fn.stdpath 'data' .. '/sessions'
	local root_dir = vim.fn.getcwd()
	local session_file = string.gsub(root_dir, '/', '%%') .. '.vim'
	local current_session_file_path = session_dir .. '/' .. session_file
	print(current_session_file_path)
	vim.fn.delete(current_session_file_path)
end

-- move around panes using arrow keys
map('n', '<Up>', ':wincmd k<CR>')
map('n', '<Down>', ':wincmd j<CR>')
map('n', '<Left>', ':wincmd h<CR>')
map('n', '<Right>', ':wincmd l<CR>')
