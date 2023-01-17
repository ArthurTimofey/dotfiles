local map = require 'utils.keymap'

-- key maps
map('n', '<leader>h', ':nohlsearch<CR>')
map('n', '<c-s>', ':w<CR>')
map('i', '<c-s>', '<ESC>:w<CR>')
map('v', '<c-s>', '<ESC>:w<CR>')
-- shift c s to save without triggering buf
map('n', '<leader>s', ':noautocmd w<CR>')
map('n', '<leader>a', ':luafile ~/.config/nvim/init.lua<CR>')
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>g', ':Cap ') -- :Cap <args>
map('n', '<leader>t', ':tabnew | terminal<CR>') -- open terminal in new tab
map('t', '<esc>', '<c-\\><c-n>')
map('n', '<leader>qa', ':qa<CR>')

-- use leader c to comment line
map('v', '<leader>c', ':CommentToggle<CR>')
map('n', '<leader>c', ':CommentToggle<CR>')

-- copy relative path to clipboard
map('n', '<leader>cp', ':let @+=expand("%:p")<CR>')

map('x', 'p', '"_DP')
