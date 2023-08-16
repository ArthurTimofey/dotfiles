local telescope = require 'telescope'
local transform_mod = require('telescope.actions.mt').transform_mod
local actions = require 'telescope.actions'

local map = require 'utils.keymap'

local mod = {}

mod.open_in_nvim_tree = function(prompt_bufnr)
	local cur_win = vim.api.nvim_get_current_win()
	vim.cmd 'NvimTreeFindFile'
	vim.api.nvim_set_current_win(cur_win)
end

mod = transform_mod(mod)

telescope.setup {
	defaults = {
		prompt_prefix = '🔍 ',
		file_ignore_patterns = {
			'.git/',
		},
		dynamic_preview_title = true,
		vimgrep_arguments = {
			'rg',
			'--ignore',
			'--hidden',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--trim',
		},
		mappings = {
			i = {
				['<CR>'] = actions.select_default + mod.open_in_nvim_tree,
			},
			n = {
				['<CR>'] = actions.select_default + mod.open_in_nvim_tree,
			},
		},
	},
	pickers = {
		find_files = {
			prompt_title = '🔦 Searching Files 🔦',
			hidden = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
}

require('telescope').load_extension 'fzf'
