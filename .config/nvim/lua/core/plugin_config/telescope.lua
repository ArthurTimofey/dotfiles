local util = require('core.util')
local builtin = require('telescope.builtin') 

util.map('n', '<c-p>', builtin.find_files)
util.map('n', '<Leader><Leader>', builtin.oldfiles)
util.map('n', '<Leader>fg', builtin.live_grep)
util.map('n', '<Leader>fh', builtin.help_tags)
