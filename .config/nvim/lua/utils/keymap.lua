local map = function(type, key, value, opts)
	local options = { noremap = true, replace_keycodes = false }

	if opts then
		options = vim.tbl_extend('force', options, opts)
	end

	vim.keymap.set(type, key, value, options)
end

return map
