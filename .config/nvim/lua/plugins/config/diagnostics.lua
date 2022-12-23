local icons = {
	warn = '⚠️',
	info = 'ℹ️',
	error = '❌',
	hint = '💡',
	debug = '🐛',
}

for type, icon in pairs(icons) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

local function format(diagnostic)
	local icon = icons.error
	if diagnostic.severity == vim.diagnostic.severity.WARN then
		icon = icons.warn
	end

	if diagnostic.severity == vim.diagnostic.severity.HINT then
		icon = icons.hint
	end

	local message = string.format(' %s [%s][%s] %s', icon, diagnostic.code, diagnostic.source, diagnostic.message)
	return message
end

vim.diagnostic.config {
	underline = true,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = false,
		header = { icons.debug .. ' Diagnostics:', 'Normal' },
		scope = 'line',
		source = false,
		format = format,
	},
	virtual_text = {
		prefix = '🧐',
		spacing = 2,
		source = false,
		severity = {
			min = vim.diagnostic.severity.HINT,
		},
		format = format,
	},
}
