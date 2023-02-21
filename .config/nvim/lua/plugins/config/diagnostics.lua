local icons = {
	warn = '!',
	info = 'I',
	error = 'X',
	hint = '?',
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
	-- disable inline Diagnostics
	underline = true,
	virtual_text = false,
}

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

vim.api.nvim_create_autocmd('CursorHold', {
	callback = function()
		local opts = {
			header = { icons.debug .. ' Diagnostics:', 'Normal' },
			-- align header
			focusable = false,
			close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
			border = 'rounded',
			source = false,
			prefix = ' ',
			scope = 'cursor',
			format = format,
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

-- function to get most recent diagnostics message and to put in the clipboard
function _G.copy_last_diagnostic()
	local line = vim.fn.line '.' - 1
	local bufnr = vim.api.nvim_win_get_buf(0)
	local diags = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line)

	if #diags == 0 then
		return
	end

	local message = diags[1].message
	vim.fn.setreg('+', message)

	vim.api.nvim_echo({ { 'Copied diagnostic message to clipboard: ' .. line .. message, 'None' } }, true, {})
end
