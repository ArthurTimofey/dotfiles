require('auto-session').setup {
	pre_save_cmds = { 'NvimTreeToggle' },
	pre_restore_cmds = { 'NvimTreeFindFileToggle' },
	cwd_change_handling = {
		restore_upcoming_session = true,
		pre_restore_cmds = { 'NvimTreeFindFileToggle' }, -- having this or not, still same result
	},
}
