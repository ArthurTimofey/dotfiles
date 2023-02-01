local telescope = require 'telescope'

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
